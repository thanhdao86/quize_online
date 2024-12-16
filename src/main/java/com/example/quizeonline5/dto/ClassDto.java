package com.example.quizeonline5.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

import java.time.LocalDateTime;
import java.util.List;

@Data
public class ClassDto {
    @JsonProperty("class_id")
    Number classId;

    @JsonProperty("class_name")
    String className;

    @JsonProperty("subject_id")
    Long subjectId;

    @JsonProperty("teacher_id")
    Long teacherId;

    @JsonProperty("students")
    private List<StudentDto> students;

    @JsonProperty("teacher")
    private UserDto teacher;

    SubjectDto subject;

    @JsonProperty("created_at")
    private LocalDateTime createdAt;

    public UserDto getTeacher() {
        return teacher;
    }

    public void setTeacher(UserDto teacher) {
        this.teacher = teacher;
    }

    public String getClassName() {
        return className;
    }

    public Number getClassId() {
        return classId;
    }

    public void setClassId(Number classId) {
        this.classId = classId;
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

    public void setStudents(List<StudentDto> students) {
        this.students = students;
    }

    public SubjectDto getSubject() {
        return subject;
    }

    public void setSubject(SubjectDto subject) {
        this.subject = subject;
    }
}