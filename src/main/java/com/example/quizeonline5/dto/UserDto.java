package com.example.quizeonline5.dto;

import lombok.Data;

@Data
public class UserDto {
    private String email;
    private String password;
    private String fullName;
    private String role;
}