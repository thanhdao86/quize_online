package com.example.quizeonline5.dto;

import com.example.quizeonline5.entity.Result;
import com.example.quizeonline5.entity.ResultAnswer;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

import java.util.List;

@Data
public class ExamDto {
    @JsonProperty("exam_id")
    private Long examId;

    @JsonProperty("exam_name")
    private String examName;

    @JsonProperty("class_id")
    private Long classId;

    @JsonProperty("subject_id")
    private Long subjectId;

    @JsonProperty("created_by")
    private Long createdBy;

    @JsonProperty("duration")
    private int duration;

    @JsonProperty("questions")
    private List<ExamQuestionDetailsDto> questions;

    @JsonProperty("status")
    private Long status;

    private Result result;

    // Constructors
    public ExamDto() {}

    // Getters and Setters
    public Long getExamId() {
        return examId;
    }

    public void setExamId(Long examId) {
        this.examId = examId;
    }

    public String getExamName() {
        return examName;
    }

    public void setExamName(String examName) {
        this.examName = examName;
    }

    public Long getClassId() {
        return classId;
    }

    public void setClassId(Long classId) {
        this.classId = classId;
    }

    public Long getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(Long subjectId) {
        this.subjectId = subjectId;
    }

    public Long getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(Long createdBy) {
        this.createdBy = createdBy;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public List<ExamQuestionDetailsDto> getQuestions() {
        return questions;
    }

    public void setQuestions(List<ExamQuestionDetailsDto> questions) {
        this.questions = questions;
    }

    public Long getStatus() {
        return status;
    }

    public void setStatus(Long status) {
        this.status = status;
    }
}