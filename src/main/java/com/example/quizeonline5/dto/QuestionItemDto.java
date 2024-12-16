package com.example.quizeonline5.dto;

import lombok.Data;

@Data
public class QuestionItemDto {
    private String key;   // Option key (A, B, C, D, etc.)
    private String value; // Option content

    public QuestionItemDto() {}

    public QuestionItemDto(String key, String value) {
        this.key = key;
        this.value = value;
    }
}
