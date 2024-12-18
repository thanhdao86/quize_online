package online_quizzes.service.impl;

import online_quizzes.dto.ExamDto;
import online_quizzes.dto.ExamQuestionDetailsDto;
import online_quizzes.dto.ResultDto;
import online_quizzes.entity.*;
import online_quizzes.repository.*;
import online_quizzes.service.ExamService;
import online_quizzes.utils.AppConstants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
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
        return examRepository.findAll();
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
    public  List<ExamDto> getExamByClassId(Long classId, Long studentId, Long teacherId) {
        Classes classEntity = classRepository.findById(classId)
                .orElseThrow(() -> new IllegalArgumentException("Class not found"));

        if (teacherId != null) {
            User teacher = userRepository.findById(teacherId)
                    .orElseThrow(() -> new IllegalArgumentException("Teacher not found"));

            if (!teacher.getRole().equals(AppConstants.ROLE_TEACHER)) {
                throw new IllegalArgumentException("Provided user is not a teacher");
            }

            return examRepository.findAll().stream()
                    .filter(exam -> exam.getClassEntity().getClassId().equals(classEntity.getClassId()))
                    .filter(exam -> exam.getCreatedBy().getUserId().equals(teacherId))
                    .map(this::convertToExamDto)
                    .collect(Collectors.toList());
        }

        // return for student
        if (studentId != null) {
            boolean isStudent = userRepository.findById(studentId)
                    .orElseThrow(() -> new IllegalArgumentException("Student not found"))
                    .getRole().equals(AppConstants.ROLE_STUDENT);
            if (isStudent) {
                return examRepository.findAll().stream()
                        .filter(exam -> exam.getClassEntity().getClassId().equals(classEntity.getClassId()))
                        .map(exam -> {
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

                            // check exam is submit or not
                            Result result = resultRepository.findByUser_UserId(studentId)
                                    .stream()
                                    .filter(r -> r.getExam().getExamId().equals(exam.getExamId()))
                                    .findFirst()
                                    .orElse(null);
                            if (result != null) {
                                examDto.setStatus(1L);
                            } else {
                                examDto.setStatus(0L);
                            }
                            return examDto;
                        })
                        .collect(Collectors.toList());

            }
        }

        // default return for admin
        return examRepository.findAll().stream()
                .filter(exam -> exam.getClassEntity().getClassId().equals(classEntity.getClassId()))
                .map(exam -> {
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
                })
                .collect(Collectors.toList());
    }

    @Override
    public ExamDto getExamDetails(Long examId, Long studentId) {
        // Find the exam, throw exception if not found
        Exam exam = examRepository.findById(examId)
                .orElseThrow(() -> new IllegalArgumentException("Exam not found"));

        // Fetch exam questions for this exam
        List<ExamQuestion> examQuestions = examQuestionRepository.findByExam(exam);

        // Create ExamDto with exam details
        ExamDto examDto = new ExamDto();
        examDto.setExamId(exam.getExamId());
        examDto.setExamName(exam.getExamName());
        examDto.setClassId(exam.getClassEntity().getClassId());
        examDto.setSubjectId(exam.getSubject().getSubjectId());
        examDto.setCreatedBy(exam.getCreatedBy().getUserId());
        examDto.setDuration(exam.getDuration());

        // Check exam submission status for students
        if (studentId != null) {
            Result result = resultRepository.findByUser_UserId(studentId)
                    .stream()
                    .filter(r -> r.getExam().getExamId().equals(exam.getExamId()))
                    .findFirst()
                    .orElse(null);

            if (result != null) {
                // Exam submitted
                examDto.setStatus(1L);

                // Convert Result to ResultDto
                ResultDto resultDto = new ResultDto();
                resultDto.setResultId(result.getResultId());
                resultDto.setUserId(result.getUser().getUserId());
                resultDto.setExamId(result.getExam().getExamId());
                resultDto.setScore(result.getScore());
                resultDto.setSubmittedAt(result.getSubmittedAt());
                resultDto.setTotalQuestion(result.getTotalQuestion());
                resultDto.setTotalCorrect(result.getTotalCorrect());

                examDto.setResult(resultDto);

                // Map exam questions with student's answers and correct answers
                List<ExamQuestionDetailsDto> questionDtos = examQuestions.stream()
                        .map(examQuestion -> {
                            Question question = examQuestion.getQuestion();
                            ExamQuestionDetailsDto dto = new ExamQuestionDetailsDto();
                            dto.setQuestionId(question.getQuestionId());
                            dto.setQuestionContent(question.getQuestionContent());
                            dto.setBankId(question.getQuestionBank().getQuestionBankId());
                            dto.setAnswer(question.getAnswer());

                            // Find the student's answer for this question
                            ResultAnswer studentAnswer = result.getAnswers().stream()
                                    .filter(ra -> ra.getQuestion().getQuestionId().equals(question.getQuestionId()))
                                    .findFirst()
                                    .orElse(null);

                            if (studentAnswer != null) {
                                // Return student's answer
                                dto.setStudentAnswer(studentAnswer.getStudentAnswer());
                                // Return correct answer
                                dto.setCorrectAnswer(question.getCorrectAnswer());
                            }

                            return dto;
                        })
                        .collect(Collectors.toList());

                examDto.setQuestions(questionDtos);

            } else {
                // Exam not submitted
                examDto.setStatus(0L);

                // Map exam questions with answer options
                List<ExamQuestionDetailsDto> questionDtos = examQuestions.stream()
                        .map(examQuestion -> {
                            Question question = examQuestion.getQuestion();
                            ExamQuestionDetailsDto dto = new ExamQuestionDetailsDto();
                            dto.setQuestionId(question.getQuestionId());
                            dto.setQuestionContent(question.getQuestionContent());
                            dto.setBankId(question.getQuestionBank().getQuestionBankId());

                            // Return answer options (assuming this is stored in the 'answer' field as a JSON array)
                            dto.setAnswer(question.getAnswer());

                            return dto;
                        })
                        .collect(Collectors.toList());

                examDto.setQuestions(questionDtos);
            }
        } else {
            // If no studentId is provided, return basic exam details
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