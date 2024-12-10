package com.example.quizeonline5.sevice;

import com.example.quizeonline5.dto.ClassDto;

import java.util.List;
import java.util.Map;

public interface ClassService {
    Long createClass(ClassDto classDto);
    void deleteClass(Long classId);
    void updateClass(Long classId, ClassDto classDto);
    List<Map<String, Object>> getAllClasses();
    List<Map<String, Object>> getStudentsInClass(Long classId);
    Map<String, Object> getTeacherInClass(Long classId);
    List<Map<String, Object>> getClassesByTeacher(Long teacherId);
}