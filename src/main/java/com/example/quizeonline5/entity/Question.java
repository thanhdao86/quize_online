package com.example.quizeonline5.entity;

import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "questions")
public class Question {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @JsonProperty("question_id")
    private Long questionId;

    @Column(nullable = false)
    @JsonProperty("question_content")
    private String questionContent;

    @Column(nullable = false)
    @JsonProperty("correct_answer")
    private String correctAnswer;

    @ManyToOne
    @JoinColumn(name = "bank_id", nullable = false)
    @JsonProperty("question_bank")
    private QuestionBank questionBank;

    @Column(name = "created_at")
    @JsonProperty("created_at")
    private LocalDateTime createdAt;

    @Column(name = "updated_at")
    @JsonProperty("updated_at")
    private LocalDateTime updatedAt;

    // Getters và Setters


    public Long getQuestionId() {
        return questionId;
    }

    public void setQuestionId(Long questionId) {
        this.questionId = questionId;
    }

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

    public QuestionBank getQuestionBank() {
        return questionBank;
    }

    public void setQuestionBank(QuestionBank questionBank) {
        this.questionBank = questionBank;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public LocalDateTime getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(LocalDateTime updatedAt) {
        this.updatedAt = updatedAt;
    }

    public Question() {
    }

    public Question(Long questionId, String questionContent, String correctAnswer, QuestionBank questionBank, LocalDateTime createdAt, LocalDateTime updatedAt) {
        this.questionId = questionId;
        this.questionContent = questionContent;
        this.correctAnswer = correctAnswer;
        this.questionBank = questionBank;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }
}
