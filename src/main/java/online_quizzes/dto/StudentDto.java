package online_quizzes.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

public class StudentDto {
    @JsonProperty("student_id")
    private Long studentId;

    @JsonProperty("full_name")
    private String fullName;

    // Getters and Setters
    public Long getStudentId() {
        return studentId;
    }

    public void setStudentId(Long studentId) {
        this.studentId = studentId;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public StudentDto(Long studentId) {
        this.studentId = studentId;
    }

    public StudentDto() {
    }

    public void setEmail(String email) {

    }
}