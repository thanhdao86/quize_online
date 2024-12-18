package online_quizzes.service;

import online_quizzes.dto.QuestionDto;

import java.util.List;
import java.util.Map;

public interface QuestionService {
    Long addQuestionToBank(QuestionDto questionDto);
    List<Map<String, Object>>  getAllQuestion();
    List<Map<String, Object>>  getAllQuestion(Long bankId);
    List<Map<String, Object>> getQuestionsByUserId(Long userId);
}
