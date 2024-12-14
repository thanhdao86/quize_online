package com.example.quizeonline5.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.List;

public class ExamDto {
    @JsonProperty("exam_name")
    private String examName;

    @JsonProperty("class_id")
    private Long classId;

    @JsonProperty("subject_id")
    private Long subjectId;

    @JsonProperty("created_by")
    private Long createdBy; // ID của giáo viên

    @JsonProperty("duration")
    private int duration;   // Thời gian làm bài (phút)

    @JsonProperty("questions")
    private List<ExamQuestionDto> questions; // Danh sách câu hỏi và điểm

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

    public List<ExamQuestionDto> getQuestions() {
        return questions;
    }

    public void setQuestions(List<ExamQuestionDto> questions) {
        this.questions = questions;
    }
}
