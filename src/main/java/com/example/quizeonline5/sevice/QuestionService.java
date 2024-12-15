package com.example.quizeonline5.sevice;

import com.example.quizeonline5.dto.QuestionDto;

public interface QuestionService {
    Long addQuestionToBank(QuestionDto questionDto);
}
