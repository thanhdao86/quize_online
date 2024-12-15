package com.example.quizeonline5.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

@Data
public class AnswerDto {
    @JsonProperty("question_id")
    private Long questionId;
    @JsonProperty("student_answer")
    private String studentAnswer; // Câu trả lời của sinh viên
}
