package online_quizzes.service.impl;

import online_quizzes.dto.ExamDto;
import online_quizzes.dto.ExamQuestionDetailsDto;
import online_quizzes.dto.ResultDto;
import online_quizzes.entity.*;
import online_quizzes.repository.*;
import online_quizzes.service.ExamService;
import online_quizzes.utils.AppConstants;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class ExamServiceImpl implements ExamService {
    @Autowired
    private ExamRepository examRepository;

    @Autowired
    private ExamQuestionRepository examQuestionRepository;

    @Autowired
    private ClassRepository classRepository;

    @Autowired
    private SubjectRepository subjectRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private QuestionRepository questionRepository;

    @Autowired
    private ResultRepository resultRepository;

    @Override
    public Long createExam(ExamDto examDto) {
        // Lấy thông tin lớp học, môn học, và người tạo đề thi
        Classes classEntity = classRepository.findById(examDto.getClassId())
                .orElseThrow(() -> new IllegalArgumentException("Class not found"));

        Subject subject = subjectRepository.findById(examDto.getSubjectId())
                .orElseThrow(() -> new IllegalArgumentException("Subject not found"));

        User createdBy = userRepository.findById(examDto.getCreatedBy())
                .orElseThrow(() -> new IllegalArgumentException("User not found"));

        // Tạo đối tượng Exam
        Exam exam = new Exam();
        exam.setExamName(examDto.getExamName());
        exam.setClassEntity(classEntity);
        exam.setSubject(subject);
        exam.setCreatedBy(createdBy);
        exam.setDuration(examDto.getDuration());
        exam.setCreatedAt(LocalDateTime.now());
        exam.setUpdatedAt(LocalDateTime.now());

        // Lưu Exam vào cơ sở dữ liệu
        exam = examRepository.save(exam);

        // Lưu các câu hỏi vào ExamQuestion
//        for (ExamQuestionDto questionDto : examDto.getQuestions()) {
//            Question question = questionRepository.findById(questionDto.getQuestionId())
//                    .orElseThrow(() -> new IllegalArgumentException("Question not found"));
//
//            ExamQuestion examQuestion = new ExamQuestion();
//            examQuestion.setExam(exam);
//            examQuestion.setQuestion(question);
//
//            examQuestionRepository.save(examQuestion);
//        }

        return exam.getExamId();
    }

    @Override
    public List<Exam> getAllExams() {
        return examRepository.findAll().stream().sorted((e1, e2) -> e2.getCreatedAt().compareTo(e1.getCreatedAt())).collect(Collectors.toList());
    }

    @Override
    public void updateExam(Long examId, ExamDto examDto) {
        Exam exam = examRepository.findById(examId)
                .orElseThrow(() -> new IllegalArgumentException("Exam not found"));

        Classes classEntity = classRepository.findById(examDto.getClassId())
                .orElseThrow(() -> new IllegalArgumentException("Class not found"));

        exam.setExamName(examDto.getExamName());
        exam.setDuration(examDto.getDuration());
        exam.setClassEntity(classEntity);
        exam.setUpdatedAt(LocalDateTime.now());

        examRepository.save(exam);
        List<ExamQuestion> examQuestions = examQuestionRepository.findByExam(exam);
        if (examQuestions != null) {
            for (ExamQuestion examQuestion : examQuestions) {
                examQuestionRepository.delete(examQuestion);
            }
        }
        for (ExamQuestionDetailsDto questionDto : examDto.getQuestions()) {
            Question question = questionRepository.findById(questionDto.getQuestionId())
                    .orElseThrow(() -> new IllegalArgumentException("Question not found"));

            ExamQuestion examQuestion = new ExamQuestion();
            examQuestion.setExam(exam);
            examQuestion.setQuestion(question);

            examQuestionRepository.save(examQuestion);
        }
    }

    @Override
    public List<Exam> getExamsByUserId(Long userId) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new IllegalArgumentException("User not found"));

        return examRepository.findByCreatedByUserId(userId);
    }

    @Override
    public List<ExamDto> getExamByClassId(Long classId, Long studentId, Long teacherId) {
        // Add logging
        Logger logger = LoggerFactory.getLogger(ExamServiceImpl.class);
        logger.info("getExamByClassId called with params: classId={}, studentId={}, teacherId={}",
                classId, studentId, teacherId);

        // Validate class existence
        Classes classEntity = classRepository.findById(classId)
                .orElseThrow(() -> {
                    logger.error("Class not found with id: {}", classId);
                    return new IllegalArgumentException("Class not found");
                });

        try {
            if (teacherId != null) {
                // Validate teacher
                User teacher = userRepository.findById(teacherId)
                        .orElseThrow(() -> {
                            logger.error("Teacher not found with id: {}", teacherId);
                            return new IllegalArgumentException("Teacher not found");
                        });

                // Check teacher role
                if (!teacher.getRole().equals(AppConstants.ROLE_TEACHER)) {
                    logger.warn("User {} is not a teacher", teacherId);
                    throw new IllegalArgumentException("Provided user is not a teacher");
                }

                // Find all exams in this class for teachers
                List<Exam> classExams = examRepository.findByClassEntity_ClassId(classEntity.getClassId());

                logger.info("Found {} exams in class {} for teacher view",
                        classExams.size(), classId);

                return classExams.stream()
                        .map(this::convertToExamDto)
                        .collect(Collectors.toList());
            }

            // Student logic remains similar
            if (studentId != null) {
                User student = userRepository.findById(studentId)
                        .orElseThrow(() -> {
                            logger.error("Student not found with id: {}", studentId);
                            return new IllegalArgumentException("Student not found");
                        });

                if (!student.getRole().equals(AppConstants.ROLE_STUDENT)) {
                    logger.warn("User {} is not a student", studentId);
                    throw new IllegalArgumentException("Provided user is not a student");
                }

                // Use JPA method to find exams by class
                List<Exam> classExams = examRepository.findByClassEntity_ClassId(classEntity.getClassId());

                logger.info("Found {} exams in class {}", classExams.size(), classId);

                return classExams.stream()
                        .map(exam -> {
                            ExamDto examDto = convertToExamDto(exam);

                            // Check exam submission status
                            Result result = resultRepository.findByUser_UserId(studentId)
                                    .stream()
                                    .filter(r -> r.getExam().getExamId().equals(exam.getExamId()))
                                    .findFirst()
                                    .orElse(null);

                            examDto.setStatus(result != null ? 1L : 0L);
                            return examDto;
                        })
                        .collect(Collectors.toList());
            }

            // Admin logic: find all exams for the class
            List<Exam> adminExams = examRepository.findByClassEntity_ClassId(classEntity.getClassId());

            logger.info("Found {} exams for admin in class {}", adminExams.size(), classId);

            return adminExams.stream()
                    .map(this::convertToExamDto)
                    .collect(Collectors.toList());

        } catch (Exception e) {
            logger.error("Error in getExamByClassId: ", e);
            throw e;
        }
    }

    @Override
    public ExamDto getExamDetails(Long examId, Long studentId, Long teacherId) {
        Logger logger = LoggerFactory.getLogger(ExamServiceImpl.class);
        logger.info("getExamDetails called with examId: {}, studentId: {}, teacherId: {}", examId, studentId, teacherId);

        // Find the exam, throw exception if not found
        Exam exam = examRepository.findById(examId)
                .orElseThrow(() -> {
                    logger.error("Exam not found with id: {}", examId);
                    return new IllegalArgumentException("Exam not found");
                });

        // Create ExamDto with exam details
        ExamDto examDto = new ExamDto();
        examDto.setExamId(exam.getExamId());
        examDto.setExamName(exam.getExamName());
        examDto.setClassId(exam.getClassEntity().getClassId());
        examDto.setSubjectId(exam.getSubject().getSubjectId());
        examDto.setCreatedBy(exam.getCreatedBy().getUserId());
        examDto.setDuration(exam.getDuration());

        // Fetch exam questions for this exam
        List<ExamQuestion> examQuestions = examQuestionRepository.findByExam(exam);

        // Teacher view
        if (teacherId != null) {
            User teacher = userRepository.findById(teacherId)
                    .orElseThrow(() -> {
                        logger.error("Teacher not found with id: {}", teacherId);
                        return new IllegalArgumentException("Teacher not found");
                    });

            // Verify the teacher is associated with this class
            if (!teacher.getRole().equals(AppConstants.ROLE_TEACHER)) {
                throw new IllegalArgumentException("User is not a teacher");
            }

            logger.info("Teacher with id: {} is viewing exam details for exam id: {}", teacherId, examId);

            // Get all results for this exam
            List<Result> examResults = resultRepository.findByExam_ExamId(examId);

            // Prepare student participation details
            List<Map<String, Object>> studentParticipations = new ArrayList<>();

            // Find all students in the class
            List<User> studentsInClass = userRepository.findByClassesContainingAndRole(
                    exam.getClassEntity(), AppConstants.ROLE_STUDENT);

            for (User student : studentsInClass) {
                Map<String, Object> participation = new HashMap<>();
                participation.put("student_id", student.getUserId());
                participation.put("student_name", student.getFullName());

                // Find student's result for this exam
                Result studentResult = examResults.stream()
                        .filter(result -> result.getUser().getUserId().equals(student.getUserId()))
                        .findFirst()
                        .orElse(null);

                if (studentResult != null) {
                    participation.put("exam_taken", true);
                    participation.put("total_question", studentResult.getTotalQuestion());
                    participation.put("total_correct", studentResult.getTotalCorrect());
                    participation.put("score", studentResult.getScore());
                    participation.put("submitted_at", studentResult.getSubmittedAt());
                } else {
                    participation.put("exam_taken", false);
                    participation.put("total_question", examQuestions.size());
                    participation.put("total_correct", 0);
                    participation.put("score", 0.0);
                }

                studentParticipations.add(participation);
            }

            examDto.setStudentParticipations(studentParticipations);

            // Prepare questions without answers for teacher
            List<ExamQuestionDetailsDto> questionDtos = examQuestions.stream()
                    .map(examQuestion -> {
                        Question question = examQuestion.getQuestion();
                        ExamQuestionDetailsDto dto = new ExamQuestionDetailsDto();
                        dto.setQuestionId(question.getQuestionId());
                        dto.setQuestionContent(question.getQuestionContent());
                        dto.setBankId(question.getQuestionBank().getQuestionBankId());
                        return dto;
                    })
                    .collect(Collectors.toList());

            examDto.setQuestions(questionDtos);

            logger.info("Teacher with id: {} has successfully viewed exam details for exam id: {}", teacherId, examId);
        }
        // Student view
        else if (studentId != null) {
            User student = userRepository.findById(studentId)
                    .orElseThrow(() -> {
                        logger.error("Student not found with id: {}", studentId);
                        return new IllegalArgumentException("Student not found");
                    });

            // Verify the student is in this class
            if (!student.getRole().equals(AppConstants.ROLE_STUDENT) ||
                    !student.getClasses().contains(exam.getClassEntity())) {
                throw new IllegalArgumentException("Student not enrolled in this class");
            }

            // Find student's result for this exam
            Result result = resultRepository.findByUser_UserId(studentId)
                    .stream()
                    .filter(r -> r.getExam().getExamId().equals(examId))
                    .findFirst()
                    .orElse(null);

            if (result != null) {
                // Exam submitted
                ResultDto resultDto = new ResultDto();
                resultDto.setResultId(result.getResultId());
                resultDto.setUserId(result.getUser().getUserId());
                resultDto.setExamId(result.getExam().getExamId());
                resultDto.setScore(result.getScore());
                resultDto.setSubmittedAt(result.getSubmittedAt());
                resultDto.setTotalQuestion(result.getTotalQuestion());
                resultDto.setTotalCorrect(result.getTotalCorrect());

                examDto.setResult(resultDto);
                examDto.setStatus(1L);

                // Prepare questions with student's answers
                List<ExamQuestionDetailsDto> questionDtos = examQuestions.stream()
                        .map(examQuestion -> {
                            Question question = examQuestion.getQuestion();
                            ExamQuestionDetailsDto dto = new ExamQuestionDetailsDto();
                            dto.setQuestionId(question.getQuestionId());
                            dto.setQuestionContent(question.getQuestionContent());
                            dto.setBankId(question.getQuestionBank().getQuestionBankId());
                            dto.setAnswer(question.getAnswer());

                            ResultAnswer studentAnswer = result.getAnswers().stream()
                                    .filter(ra -> ra.getQuestion().getQuestionId().equals(question.getQuestionId()))
                                    .findFirst()
                                    .orElse(null);

                            if (studentAnswer != null) {
                                dto.setStudentAnswer(studentAnswer.getStudentAnswer());
                                dto.setCorrectAnswer(question.getCorrectAnswer());
                            }

                            return dto;
                        })
                        .collect(Collectors.toList());

                examDto.setQuestions(questionDtos);
            } else {
                // Exam not submitted
                examDto.setStatus(0L);

                // Prepare questions without answers
                List<ExamQuestionDetailsDto> questionDtos = examQuestions.stream()
                        .map(examQuestion -> {
                            Question question = examQuestion.getQuestion();
                            ExamQuestionDetailsDto dto = new ExamQuestionDetailsDto();
                            dto.setQuestionId(question.getQuestionId());
                            dto.setQuestionContent(question.getQuestionContent());
                            dto.setBankId(question.getQuestionBank().getQuestionBankId());
                            dto.setAnswer(question.getAnswer());
                            return dto;
                        })
                        .collect(Collectors.toList());

                examDto.setQuestions(questionDtos);
            }
        } else {
            // No user specified - minimal exam details
            List<ExamQuestionDetailsDto> questionDtos = examQuestions.stream()
                    .map(examQuestion -> {
                        Question question = examQuestion.getQuestion();
                        ExamQuestionDetailsDto dto = new ExamQuestionDetailsDto();
                        dto.setQuestionId(question.getQuestionId());
                        dto.setQuestionContent(question.getQuestionContent());
                        dto.setBankId(question.getQuestionBank().getQuestionBankId());
                        return dto;
                    })
                    .collect(Collectors.toList());

            examDto.setQuestions(questionDtos);
        }

        return examDto;
    }

    private ExamDto convertToExamDto(Exam exam) {
        List<ExamQuestion> examQuestions = examQuestionRepository.findByExam(exam);
        List<ExamQuestionDetailsDto> questionDtos = examQuestions.stream()
                .map(examQuestion -> {
                    Question question = examQuestion.getQuestion();
                    ExamQuestionDetailsDto dto = new ExamQuestionDetailsDto();
                    dto.setQuestionId(question.getQuestionId());
                    dto.setQuestionContent(question.getQuestionContent());
                    dto.setAnswer(question.getAnswer());
                    dto.setBankId(question.getQuestionBank().getQuestionBankId());
                    return dto;
                })
                .collect(Collectors.toList());

        ExamDto examDto = new ExamDto();
        examDto.setExamId(exam.getExamId());
        examDto.setExamName(exam.getExamName());
        examDto.setClassId(exam.getClassEntity().getClassId());
        examDto.setSubjectId(exam.getSubject().getSubjectId());
        examDto.setCreatedBy(exam.getCreatedBy().getUserId());
        examDto.setDuration(exam.getDuration());
        examDto.setQuestions(questionDtos);

        return examDto;
    }
}