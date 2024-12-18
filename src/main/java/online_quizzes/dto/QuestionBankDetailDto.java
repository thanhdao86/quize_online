package online_quizzes.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import java.time.LocalDateTime;
import java.util.List;

public class QuestionBankDetailDto {
    @JsonProperty("question_bank_id")
    private Long questionBankId;

    @JsonProperty("bank_name")
    private String bankName;

    @JsonProperty("created_by")
    private Long createdById;

    @JsonProperty("created_by_username")
    private String createdByUsername;

    @JsonProperty("is_public")
    private boolean isPublic;

    @JsonProperty("created_at")
    private LocalDateTime createdAt;

    @JsonProperty("questions")
    private List<QuestionDetailDto> questions;

    // Getters and setters
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

    public Long getCreatedById() {
        return createdById;
    }

    public void setCreatedById(Long createdById) {
        this.createdById = createdById;
    }

    public String getCreatedByUsername() {
        return createdByUsername;
    }

    public void setCreatedByUsername(String createdByUsername) {
        this.createdByUsername = createdByUsername;
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

    public List<QuestionDetailDto> getQuestions() {
        return questions;
    }

    public void setQuestions(List<QuestionDetailDto> questions) {
        this.questions = questions;
    }
}