package online_quizzes.service;

import online_quizzes.dto.SubjectDto;
import online_quizzes.entity.Subject;

import java.util.List;

public interface SubjectService {
    Long createSubject(SubjectDto subjectDto);
    void deleteSubject(Long subjectId);
    void updateSubject(Long subjectId, SubjectDto subjectDto);
    List<Subject> getAllSubjects();
    Subject getSubjectById(Long subjectId);
}
