package com.example.quizeonline5.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

public class StudentDto {
    @JsonProperty("student_id")
    private Long studentId;

    // Getters and Setters
    public Long getStudentId() {
        return studentId;
    }
    public void setStudentId(Long studentId) {
        this.studentId = studentId;
    }

    public StudentDto(Long studentId) {
        this.studentId = studentId;
    }

    public StudentDto() {
    }
}
