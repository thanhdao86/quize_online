package com.example.quizeonline5.sevice.impl;

import com.example.quizeonline5.dto.QuestionBankDto;
import com.example.quizeonline5.dto.QuestionBankDetailDto;
import com.example.quizeonline5.dto.QuestionDetailDto;
import com.example.quizeonline5.entity.QuestionBank;
import com.example.quizeonline5.entity.User;
import com.example.quizeonline5.repository.QuestionBankRepository;
import com.example.quizeonline5.repository.UserRepository;
import com.example.quizeonline5.sevice.QuestionBankService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

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
    public  List<Map<String, Object>> getAllQuestionBanksByUser(Long userId) {
        // get all question banks created by the user
        return questionBankRepository.findByCreatedBy_UserId(userId).stream().map(questionBank -> {
            Map<String, Object> map = new HashMap<>();
            map.put("question_bank_id", questionBank.getQuestionBankId());
            map.put("bank_name", questionBank.getBankName());
            map.put("is_public", questionBank.isPublic());
            map.put("created_by", questionBank.getCreatedBy());
            map.put("created_at", questionBank.getCreatedAt());
            return map;
        }).collect(Collectors.toList());
    }

    @Override
    public QuestionBankDetailDto getQuestionBankDetails(Long questionBankId) {
        QuestionBank questionBank = questionBankRepository.findById(questionBankId)
                .orElseThrow(() -> new IllegalArgumentException("Question Bank not found"));

        QuestionBankDetailDto detailDto = new QuestionBankDetailDto();
        detailDto.setQuestionBankId(questionBank.getQuestionBankId());
        detailDto.setBankName(questionBank.getBankName());
        detailDto.setCreatedById(questionBank.getCreatedBy().getUserId());
        detailDto.setPublic(questionBank.isPublic());
        detailDto.setCreatedAt(questionBank.getCreatedAt());

        // Convert questions to QuestionDetailDto to avoid circular reference
        if (questionBank.getQuestions() != null) {
            detailDto.setQuestions(
                    questionBank.getQuestions().stream()
                            .map(question -> {
                                QuestionDetailDto questionDetail = new QuestionDetailDto();
                                questionDetail.setQuestionId(question.getQuestionId());
                                questionDetail.setQuestionContent(question.getQuestionContent());
                                questionDetail.setAnswer(question.getAnswer());
                                questionDetail.setCorrectAnswer(question.getCorrectAnswer());
                                questionDetail.setCreatedAt(question.getCreatedAt());
                                questionDetail.setUpdatedAt(question.getUpdatedAt());
                                return questionDetail;
                            })
                            .collect(Collectors.toList())
            );
        }

        return detailDto;
    }

    @Override
    public List<Map<String, Object>> getAllQuestionBank() {
        return questionBankRepository.findAll().stream().map(questionBank -> {
            Map<String, Object> map = new HashMap<>();
            map.put("question_bank_id", questionBank.getQuestionBankId());
            map.put("bank_name", questionBank.getBankName());
            map.put("is_public", questionBank.isPublic());
            map.put("created_by", questionBank.getCreatedBy());
            map.put("created_at", questionBank.getCreatedAt());
            return map;
        }).collect(Collectors.toList());
    }
}