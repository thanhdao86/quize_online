package com.example.quizeonline5.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

public class QuestionDto {
    @JsonProperty("question_content")
    private String questionContent;
    @JsonProperty("correct_answer")
    private String correctAnswer;
    @JsonProperty("bank_id")
    private Long bankId;

    public String getQuestionContent() {
        return questionContent;
    }

    public void setQuestionContent(String questionContent) {
        this.questionContent = questionContent;
    }

    public String getCorrectAnswer() {
        return correctAnswer;
    }

    public void setCorrectAnswer(String correctAnswer) {
        this.correctAnswer = correctAnswer;
    }

    public Long getBankId() {
        return bankId;
    }

    public void setBankId(Long bankId) {
        this.bankId = bankId;
    }
}
