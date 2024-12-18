package online_quizzes.service;

import online_quizzes.dto.QuestionBankDto;
import online_quizzes.dto.QuestionBankDetailDto;

import java.util.List;
import java.util.Map;

public interface QuestionBankService {
    Long createQuestionBank(QuestionBankDto questionBankDto);
    void deleteQuestionBank(Long questionBankId);
    void updateQuestionBank(Long questionBankId, QuestionBankDto questionBankDto);
    List<Map<String, Object>> getAllQuestionBanksByUser(Long userId);
    QuestionBankDetailDto getQuestionBankDetails(Long questionBankId);
    List<Map<String, Object>> getAllQuestionBank();
}