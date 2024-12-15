package com.example.quizeonline5.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

@Data
public class UserDto {
    private String email;
    private String password;

    @JsonProperty("full_name")
    private String fullName;
    private String role;
}