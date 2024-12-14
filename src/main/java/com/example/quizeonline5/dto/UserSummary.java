package com.example.quizeonline5.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Getter
@Data
public class UserSummary {
    private Long userId;
    private String email;
    private String role;
    private String fullName;


    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public UserSummary(Long userId, String email, String role, String fullName) {
        this.userId = userId;
        this.email = email;
        this.role = role;
        this.fullName = fullName;
    }
}

