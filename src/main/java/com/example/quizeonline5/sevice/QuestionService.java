package com.example.quizeonline5.sevice;

import com.example.quizeonline5.dto.QuestionDto;
import com.example.quizeonline5.entity.Question;
import com.example.quizeonline5.entity.User;

import java.util.List;
import java.util.Map;

public interface QuestionService {
    Long addQuestionToBank(QuestionDto questionDto);
    List<Map<String, Object>>  getAllQuestion();
    List<Map<String, Object>>  getAllQuestion(Long bankId);
    List<Map<String, Object>> getQuestionsByUserId(Long userId);
}
