package com.example.quizeonline5.sevice;

import com.example.quizeonline5.dto.SubjectDto;
import com.example.quizeonline5.entity.Subject;

import java.util.List;

public interface SubjectService {
    Long createSubject(SubjectDto subjectDto);
    void deleteSubject(Long subjectId);
    void updateSubject(Long subjectId, SubjectDto subjectDto);
    List<Subject> getAllSubjects();
    Subject getSubjectById(Long subjectId);
}
