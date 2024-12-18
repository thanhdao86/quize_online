package online_quizzes.entity;

import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "questions")
public class Question {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "question_id")
    @JsonProperty("question_id")
    private Long questionId;

    @Lob
    @Column(name = "question_content", length = 64000)
    @JsonProperty("question")
    private String questionContent;

    @Lob
    @Column(nullable = false, name = "answer", columnDefinition = "TEXT", length = 64000)
    @JsonProperty("answer")
    private String answer;

    @Column(nullable = false, name = "correct_answer")
    @JsonProperty("correct_answer")
    private String correctAnswer;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "question_bank_id", nullable = false)
    @JsonProperty("question_bank_id")
    private QuestionBank questionBank;

    @Column(name = "created_at")
    @JsonProperty("created_at")
    private LocalDateTime createdAt;

    @Column(name = "updated_at")
    @JsonProperty("updated_at")
    private LocalDateTime updatedAt;

    public Question(Long questionId, String questionContent, String answer, String correctAnswer, QuestionBank questionBank, LocalDateTime createdAt, LocalDateTime updatedAt) {
        this.questionId = questionId;
        this.questionContent = questionContent;
        this.answer = answer;
        this.correctAnswer = correctAnswer;
        this.questionBank = questionBank;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    public Question() {
    }

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

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
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
}
