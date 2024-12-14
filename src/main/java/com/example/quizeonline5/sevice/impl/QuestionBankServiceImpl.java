package com.example.quizeonline5.sevice.impl;

import com.example.quizeonline5.dto.QuestionBankDto;
import com.example.quizeonline5.entity.QuestionBank;
import com.example.quizeonline5.entity.User;
import com.example.quizeonline5.repository.QuestionBankRepository;
import com.example.quizeonline5.repository.UserRepository;
import com.example.quizeonline5.sevice.QuestionBankService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class QuestionBankServiceImpl implements QuestionBankService {
    @Autowired
    private QuestionBankRepository questionBankRepository;

    @Autowired
    private UserRepository userRepository;

    @Override
    public Long createQuestionBank(QuestionBankDto questionBankDto) {
        User creator = userRepository.findById(questionBankDto.getCreatedBy())
                .orElseThrow(() -> new IllegalArgumentException("User not found"));

        QuestionBank questionBank = new QuestionBank();
        questionBank.setBankName(questionBankDto.getBankName());
        questionBank.setCreatedBy(creator);
        questionBank.setPublic(questionBankDto.isPublic());
        questionBank.setCreatedAt(LocalDateTime.now());

        return questionBankRepository.save(questionBank).getQuestionBankId();
    }

    @Override
    public void deleteQuestionBank(Long questionBankId) {
        if (!questionBankRepository.existsById(questionBankId)) {
            throw new IllegalArgumentException("Question Bank not found");
        }
        questionBankRepository.deleteById(questionBankId);
    }

    @Override
    public void updateQuestionBank(Long questionBankId, QuestionBankDto questionBankDto) {
        QuestionBank questionBank = questionBankRepository.findById(questionBankId)
                .orElseThrow(() -> new IllegalArgumentException("Question Bank not found"));

        questionBank.setBankName(questionBankDto.getBankName());
        questionBank.setPublic(questionBankDto.isPublic());
        questionBankRepository.save(questionBank);
    }

    @Override
    public List<QuestionBank> getAllQuestionBanksByUser(Long userId) {
        return questionBankRepository.findByCreatedBy_UserId(userId);
    }

    @Override
    public QuestionBank getQuestionBankDetails(Long questionBankId) {
        return questionBankRepository.findById(questionBankId)
                .orElseThrow(() -> new IllegalArgumentException("Question Bank not found"));
    }
}
