package online_quizzes.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

public class QuestionDto {
    @JsonProperty("question")
    private String questionContent;
    @JsonProperty("answer")
    private String answer;
    @JsonProperty("correct_answer")
    private String correctAnswer;
    @JsonProperty("question_bank_id")
    private Long bankId;

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

    public Long getBankId() {
        return bankId;
    }

    public void setBankId(Long bankId) {
        this.bankId = bankId;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }
}
