package com.example.quizeonline5.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.List;

public class ClassDto {
    @JsonProperty("class_name")
    String className;

    @JsonProperty("subject_id")
    Long subjectId;

    @JsonProperty("teacher_id")
    Long teacherId;

    @JsonProperty("students")
    private List<StudentDto> students;

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public Long getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(Long subjectId) {
        this.subjectId = subjectId;
    }

    public Long getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(Long teacherId) {
        this.teacherId = teacherId;
    }

    public List<StudentDto> getStudents() {
        return students;
    }

}