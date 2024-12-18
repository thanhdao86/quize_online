package online_quizzes.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "result_answers")
public class ResultAnswer {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "result_id", nullable = false)
    private Result result;

    @ManyToOne
    @JoinColumn(name = "question_id", nullable = false)
    private Question question;

    @Column(nullable = false)
    private String studentAnswer;

    @Column(nullable = false)
    private boolean isCorrect; // Trả lời đúng/sai

    public ResultAnswer() {

    }

    // Getters và Setters

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Result getResult() {
        return result;
    }

    public void setResult(Result result) {
        this.result = result;
    }

    public Question getQuestion() {
        return question;
    }

    public void setQuestion(Question question) {
        this.question = question;
    }

    public String getStudentAnswer() {
        return studentAnswer;
    }

    public void setStudentAnswer(String studentAnswer) {
        this.studentAnswer = studentAnswer;
    }

    public boolean isCorrect() {
        return isCorrect;
    }

    public void setCorrect(boolean correct) {
        isCorrect = correct;
    }

    public ResultAnswer(Long id, Result result, Question question, String studentAnswer, boolean isCorrect) {
        this.id = id;
        this.result = result;
        this.question = question;
        this.studentAnswer = studentAnswer;
        this.isCorrect = isCorrect;
    }

}
