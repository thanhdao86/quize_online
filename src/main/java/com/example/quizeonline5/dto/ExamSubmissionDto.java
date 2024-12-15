package com.example.quizeonline5.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

import java.util.List;

@Data
public class ExamSubmissionDto {
    @JsonProperty("exam_id")
    private Long examId;
    @JsonProperty("student_id")
    private Long studentId; // ID của sinh viên nộp bài
    @JsonProperty("answers")
    private List<AnswerDto> answers; // Danh sách câu trả lời
}
