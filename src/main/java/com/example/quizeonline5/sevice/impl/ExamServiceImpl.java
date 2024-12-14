package com.example.quizeonline5.sevice.impl;

import com.example.quizeonline5.dto.ExamDto;
import com.example.quizeonline5.dto.ExamQuestionDto;
import com.example.quizeonline5.entity.*;
import com.example.quizeonline5.repository.*;
import com.example.quizeonline5.sevice.ExamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

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

        // Lưu Exam vào cơ sở dữ liệu
        exam = examRepository.save(exam);

        // Lưu các câu hỏi vào ExamQuestion
        for (ExamQuestionDto questionDto : examDto.getQuestions()) {
            Question question = questionRepository.findById(questionDto.getQuestionId())
                    .orElseThrow(() -> new IllegalArgumentException("Question not found"));

            ExamQuestion examQuestion = new ExamQuestion();
            examQuestion.setExam(exam);
            examQuestion.setQuestion(question);
            examQuestion.setPoint(questionDto.getPoint());

            examQuestionRepository.save(examQuestion);
        }

        return exam.getExamId();
    }
}