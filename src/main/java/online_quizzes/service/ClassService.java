package online_quizzes.service;

import online_quizzes.dto.ApiResponse;
import online_quizzes.dto.ClassDto;
import online_quizzes.dto.StudentDto;
import online_quizzes.entity.Classes;

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