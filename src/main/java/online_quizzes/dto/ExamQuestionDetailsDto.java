package online_quizzes.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

public class ExamQuestionDetailsDto {
    @JsonProperty("question_id")
    private Long questionId;

    @JsonProperty("question")
    private String questionContent;

    @JsonProperty("answer")
    private String answer;

    @JsonProperty("student_answer")
    private String studentAnswer;

    @JsonProperty("correct_answer")
    private String correctAnswer;

    @JsonProperty("question_bank_id")
    private Long bankId;

    // Constructors
    public ExamQuestionDetailsDto() {}

    // Getters and Setters
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

    public Long getBankId() {
        return bankId;
    }

    public void setBankId(Long bankId) {
        this.bankId = bankId;
    }

    public String getCorrectAnswer() {
        return correctAnswer;
    }

    public void setCorrectAnswer(String correctAnswer) {
        this.correctAnswer = correctAnswer;
    }

    public String getStudentAnswer() {
        return studentAnswer;
    }

    public void setStudentAnswer(String studentAnswer) {
        this.studentAnswer = studentAnswer;
    }
}