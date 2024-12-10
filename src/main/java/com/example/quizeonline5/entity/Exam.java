package com.example.quizeonline5.entity;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "exams")
public class Exam {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long examId;

    @Column(nullable = false)
    private String examName;

    @ManyToOne
    @JoinColumn(name = "subject_id", nullable = false)
    private Subject subject;

    @ManyToOne
    @JoinColumn(name = "class_id", nullable = false)
    private Classes classEntity;

    @ManyToOne
    @JoinColumn(name = "created_by", nullable = false)
    private User createdBy;

    @Column(name = "created_at")
    private LocalDateTime createdAt;

    @Column(nullable = false)
    private int duration; // Thời gian làm bài (phút)

    // Getters và Setters

    public Long getExamId() {
        return examId;
    }

    public void setExamId(Long examId) {
        this.examId = examId;
    }

    public String getExamName() {
        return examName;
    }

    public void setExamName(String examName) {
        this.examName = examName;
    }

    public Subject getSubject() {
        return subject;
    }

    public void setSubject(Subject subject) {
        this.subject = subject;
    }

    public Classes getClassEntity() {
        return classEntity;
    }

    public void setClassEntity(Classes classEntity) {
        this.classEntity = classEntity;
    }

    public User getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(User createdBy) {
        this.createdBy = createdBy;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public Exam() {
    }

    public Exam(Long examId, String examName, Subject subject, Classes classEntity, User createdBy, LocalDateTime createdAt, int duration) {
        this.examId = examId;
        this.examName = examName;
        this.subject = subject;
        this.classEntity = classEntity;
        this.createdBy = createdBy;
        this.createdAt = createdAt;
        this.duration = duration;
    }
}