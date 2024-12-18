package com.example.quizeonline5.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import java.time.LocalDateTime;

public class ResultDto {
    @JsonProperty("result_id")
    private Long resultId;

    @JsonProperty("user_id")
    private Long userId;

    @JsonProperty("exam_id")
    private Long examId;

    @JsonProperty("score")
    private double score;

    @JsonProperty("submitted_at")
    private LocalDateTime submittedAt;

    @JsonProperty("total_question")
    private double totalQuestion;

    @JsonProperty("total_correct")
    private double totalCorrect;

    // Add getters and setters

    public Long getResultId() {
        return resultId;
    }

    public void setResultId(Long resultId) {
        this.resultId = resultId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getExamId() {
        return examId;
    }

    public void setExamId(Long examId) {
        this.examId = examId;
    }

    public double getScore() {
        return score;
    }

    public void setScore(double score) {
        this.score = score;
    }

    public LocalDateTime getSubmittedAt() {
        return submittedAt;
    }

    public void setSubmittedAt(LocalDateTime submittedAt) {
        this.submittedAt = submittedAt;
    }

    public double getTotalQuestion() {
        return totalQuestion;
    }

    public void setTotalQuestion(double totalQuestion) {
        this.totalQuestion = totalQuestion;
    }

    public double getTotalCorrect() {
        return totalCorrect;
    }

    public void setTotalCorrect(double totalCorrect) {
        this.totalCorrect = totalCorrect;
    }
}