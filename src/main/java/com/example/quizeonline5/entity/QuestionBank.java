package com.example.quizeonline5.entity;

import jakarta.persistence.*;

import java.time.LocalDateTime;

@Entity
@Table(name = "question_banks")
public class QuestionBank {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long questionBankId;

    @Column(nullable = false)
    private String bankName;

    @ManyToOne
    @JoinColumn(name = "created_by", nullable = false)
    private User createdBy;

    @Column(name = "is_public")
    private boolean isPublic;

    @Column(name = "created_at")
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

    public QuestionBank(Long questionBankId, String bankName, User createdBy, boolean isPublic, LocalDateTime createdAt) {
        this.questionBankId = questionBankId;
        this.bankName = bankName;
        this.createdBy = createdBy;
        this.isPublic = isPublic;
        this.createdAt = createdAt;
    }
}