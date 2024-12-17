package com.example.quizeonline5.entity;

import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.persistence.*;
import java.time.LocalDateTime;
import java.util.List;

@Entity
@Table(name = "results")
public class Result {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @JsonProperty("result_id")
    private Long resultId;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @ManyToOne
    @JoinColumn(name = "exam_id", nullable = false)
    private Exam exam;

    @Column(nullable = false)
    private double score;

    @Column(name = "submitted_at")
    @JsonProperty("submitted_at")
    private LocalDateTime submittedAt;

    @Column(name = "total_question")
    @JsonProperty("total_question")
    private double totalQuestion; // Tổng số câu hỏi trong bài thi

    @Column(name = "total_correct")
    @JsonProperty("total_correct")
    private double totalCorrect; // Tổng số câu trả lời đúng

    // Getters và Setters
    @OneToMany(mappedBy = "result", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<ResultAnswer> answers; // Các câu trả lời của sinh viên

    public Long getResultId() {
        return resultId;
    }

    public void setResultId(Long resultId) {
        this.resultId = resultId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Exam getExam() {
        return exam;
    }

    public void setExam(Exam exam) {
        this.exam = exam;
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

    public List<ResultAnswer> getAnswers() {
        return answers;
    }

    public void setAnswers(List<ResultAnswer> answers) {
        this.answers = answers;
    }

    public Result(Long resultId, User user, Exam exam, double score, LocalDateTime submittedAt, double totalQuestion, double totalCorrect, List<ResultAnswer> answers) {
        this.resultId = resultId;
        this.user = user;
        this.exam = exam;
        this.score = score;
        this.submittedAt = submittedAt;
        this.totalQuestion = totalQuestion;
        this.totalCorrect = totalCorrect;
        this.answers = answers;
    }

    public Result() {
    }
}
