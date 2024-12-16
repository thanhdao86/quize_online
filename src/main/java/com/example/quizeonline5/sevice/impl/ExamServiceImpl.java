package com.example.quizeonline5.sevice.impl;

import com.example.quizeonline5.dto.ExamDto;
import com.example.quizeonline5.dto.ExamQuestionDto;
import com.example.quizeonline5.dto.ExamQuestionDetailsDto;
import com.example.quizeonline5.entity.*;
import com.example.quizeonline5.repository.*;
import com.example.quizeonline5.sevice.ExamService;
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
    public ExamDto getExamDetails(Long examId) {
        Exam exam = examRepository.findById(examId)
                .orElseThrow(() -> new IllegalArgumentException("Exam not found"));

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

    @Override
    public List<Exam> getExamByClassId(Long classId) {
        Classes classEntity = classRepository.findById(classId)
                .orElseThrow(() -> new IllegalArgumentException("Class not found"));

        return examRepository.findAll().stream()
                .filter(exam -> exam.getClassEntity().getClassId().equals(classEntity.getClassId()))
                .collect(Collectors.toList());
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
}