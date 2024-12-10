package com.example.quizeonline5.dto;

import lombok.*;

@Data
@Getter
@Setter
@Builder
@ToString
public class ClassDto {
    String className;
    Long subjectId;
    Long teacherId;
}