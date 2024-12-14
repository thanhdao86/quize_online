package com.example.quizeonline5.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

public class QuestionBankDto {

    @JsonProperty("bank_name")
    private String bankName;

    @JsonProperty("created_by")
    private Long createdBy; // User ID of creator

    @JsonProperty("is_public")
    private boolean isPublic;

    public String getBankName() {
        return bankName;
    }

    public void setBankName(String bankName) {
        this.bankName = bankName;
    }

    public Long getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(Long createdBy) {
        this.createdBy = createdBy;
    }

    public boolean isPublic() {
        return isPublic;
    }

    public void setPublic(boolean aPublic) {
        isPublic = aPublic;
    }
}
