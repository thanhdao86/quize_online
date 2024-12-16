package com.example.quizeonline5.sevice;

import com.example.quizeonline5.dto.ApiResponse;
import com.example.quizeonline5.dto.ClassDto;
import com.example.quizeonline5.dto.StudentDto;
import com.example.quizeonline5.entity.Classes;

import java.util.List;
import java.util.Map;

public interface ClassService {
    ApiResponse createClass(ClassDto classDto);
    ApiResponse deleteClass(Long classId);
    ApiResponse updateClass(Long classId, ClassDto classDto);
    List<Map<String, Object>> getAllClasses();
    List<Map<String, Object>> getStudentsInClass(Long classId);
    Map<String, Object> getTeacherInClass(Long classId);
    List<Map<String, Object>> getClassesByTeacher(Long teacherId);
    Classes getClassById(Long classId);
    ApiResponse addStudentToClass(Long classId, StudentDto studentDto);
    List<ClassDto> getEnrolledClassByStudent(Long studentId);
}