package com.example.quizeonline5.sevice;

import com.example.quizeonline5.dto.QuestionBankDto;
import com.example.quizeonline5.entity.QuestionBank;

import java.util.List;
import java.util.Map;

public interface QuestionBankService {
    Long createQuestionBank(QuestionBankDto questionBankDto);
    void deleteQuestionBank(Long questionBankId);
    void updateQuestionBank(Long questionBankId, QuestionBankDto questionBankDto);
    List<QuestionBank> getAllQuestionBanksByUser(Long userId);
    QuestionBank getQuestionBankDetails(Long questionBankId);
    List<Map<String, Object>> getAllQuestionBank();
}
