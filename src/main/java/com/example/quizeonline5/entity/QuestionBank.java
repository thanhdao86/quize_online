package com.example.quizeonline5.entity;

import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.persistence.*;

import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "question_banks")
public class QuestionBank {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @JsonProperty("question_bank_id")
    private Long questionBankId;

    @Column(nullable = false)
    @JsonProperty("bank_name")
    private String bankName;

    @ManyToOne
    @JoinColumn(name = "created_by", nullable = false)
    @JsonProperty("created_by")
    private User createdBy;

    @Column(name = "is_public")
    @JsonProperty("is_public")
    private boolean isPublic;

    @Column(name = "created_at")
    @JsonProperty("created_at")
    private LocalDateTime createdAt;

    // Getters và Setters

    public Long getQuestionBankId() {
        return questionBankId;
    }

    public void setQuestionBankId(Long questionBankId) {
        this.questionBankId = questionBankId;
    }

    public String getBankName() {
        return bankName;
    }

    public void setBankName(String bankName) {
        this.bankName = bankName;
    }

    public User getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(User createdBy) {
        this.createdBy = createdBy;
    }

    public boolean isPublic() {
        return isPublic;
    }

    public void setPublic(boolean aPublic) {
        isPublic = aPublic;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public QuestionBank() {
    }

    @OneToMany(mappedBy = "questionBank",
            cascade = CascadeType.ALL,
            orphanRemoval = true)
    private Set<Question> questions;

    public QuestionBank(Long questionBankId, String bankName, User createdBy, boolean isPublic, LocalDateTime createdAt) {
        this.questionBankId = questionBankId;
        this.bankName = bankName;
        this.createdBy = createdBy;
        this.isPublic = isPublic;
        this.createdAt = createdAt;
    }

    public Set<Question> getQuestions() {
        return questions;
    }

    public void setQuestions(Set<Question> questions) {
        this.questions = questions;
    }
}