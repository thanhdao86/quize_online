package com.example.quizeonline5.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

public class ExamQuestionDto {

    @JsonProperty("question_id")
    private Long questionId;

    @JsonProperty("point")
    private int point;

    public Long getQuestionId() {
        return questionId;
    }

    public void setQuestionId(Long questionId) {
        this.questionId = questionId;
    }

    public int getPoint() {
        return point;
    }

    public void setPoint(int point) {
        this.point = point;
    }
}
