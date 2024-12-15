package com.example.quizeonline5.sevice.impl;

import com.example.quizeonline5.dto.QuestionDto;
import com.example.quizeonline5.entity.Question;
import com.example.quizeonline5.entity.QuestionBank;
import com.example.quizeonline5.repository.QuestionBankRepository;
import com.example.quizeonline5.repository.QuestionRepository;
import com.example.quizeonline5.sevice.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

@Service
public class QuestionServiceImpl implements QuestionService {
    @Autowired
    private QuestionRepository questionRepository;

    @Autowired
    private QuestionBankRepository questionBankRepository;

    @Override
    public Long addQuestionToBank(QuestionDto questionDto) {
        // Lấy ngân hàng câu hỏi từ ID
        QuestionBank questionBank = questionBankRepository.findById(questionDto.getBankId())
                .orElseThrow(() -> new IllegalArgumentException("Question Bank not found"));

        // Tạo đối tượng Question mới
        Question question = new Question();
        question.setQuestionContent(questionDto.getQuestionContent());
        question.setCorrectAnswer(questionDto.getCorrectAnswer());
        question.setQuestionBank(questionBank);
        question.setCreatedAt(LocalDateTime.now());
        question.setUpdatedAt(LocalDateTime.now());

        // Lưu câu hỏi vào cơ sở dữ liệu
        return questionRepository.save(question).getQuestionId();
    }
}