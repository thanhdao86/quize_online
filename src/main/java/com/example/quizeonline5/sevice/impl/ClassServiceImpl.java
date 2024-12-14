package com.example.quizeonline5.sevice.impl;


import com.example.quizeonline5.dto.ApiResponse;
import com.example.quizeonline5.dto.ClassDto;
import com.example.quizeonline5.dto.StudentDto;
import com.example.quizeonline5.entity.Classes;
import com.example.quizeonline5.entity.Subject;
import com.example.quizeonline5.entity.User;
import com.example.quizeonline5.exception.ResourceNotFoundException;
import com.example.quizeonline5.repository.ClassRepository;
import com.example.quizeonline5.repository.SubjectRepository;
import com.example.quizeonline5.repository.UserRepository;
import com.example.quizeonline5.sevice.ClassService;
import com.example.quizeonline5.utils.AppConstants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.*;
import java.util.stream.Collectors;

@Service
public class ClassServiceImpl implements ClassService {
    @Autowired
    private ClassRepository classRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private SubjectRepository subjectRepository;

    @Override
    public ApiResponse createClass(ClassDto classDto) {

        if (classDto.getTeacherId() == null) {
            throw new IllegalArgumentException("Teacher ID must not be null");
        }
        if (classDto.getSubjectId() == null) {
            throw new IllegalArgumentException("Subject ID must not be null");
        }
        User teacher = userRepository.findById(classDto.getTeacherId())
                .orElseThrow(() -> new IllegalArgumentException("Teacher not found"));

        Subject subject = subjectRepository.findById(1L)
                .orElseThrow(() -> new IllegalArgumentException("Subject not found"));

        Classes classEntity = new Classes();
        classEntity.setClassName(classDto.getClassName());
        classEntity.setTeacher(teacher);
        classEntity.setSubject(subject);
        classEntity.setCreatedAt(LocalDateTime.now());
        classEntity.setUpdatedAt(LocalDateTime.now());
        Long id =  classRepository.save(classEntity).getClassId();
        if (id != null) {
            return new ApiResponse(true, "Class created successfully with ID: " + id);
        } else {
            return new ApiResponse(false, "Class not created");
        }
    }

    @Override
    public ApiResponse deleteClass(Long classId) {
        Classes classes = classRepository.findById(classId).orElseThrow(() -> new ResourceNotFoundException(AppConstants.CLASSES, AppConstants.ID, classId));
        if (classes == null) {
            return new ApiResponse(Boolean.FALSE, "Class not found");
        }
        classRepository.deleteById(classId);
        return new ApiResponse(Boolean.TRUE, "Class deleted successfully");
    }

    @Override
    public ApiResponse updateClass(Long classId, ClassDto classDto) {
        Classes classEntity = classRepository.findById(classId)
                .orElseThrow(() -> new IllegalArgumentException("Class not found"));

        User teacher = userRepository.findById(classDto.getTeacherId())
                .orElseThrow(() -> new IllegalArgumentException("Teacher not found"));

        classEntity.setClassName(classDto.getClassName());
        classEntity.setTeacher(teacher);
        classEntity.setUpdatedAt(java.time.LocalDateTime.now());
        classRepository.save(classEntity);
        return new ApiResponse(Boolean.TRUE, "Update class success");
    }

    @Override
    public List<Map<String, Object>> getAllClasses() {
        return classRepository.findAll().stream().map(classEntity -> {
            Map<String, Object> map = new HashMap<>();
            map.put("class_id", classEntity.getClassId());
            map.put("class_name", classEntity.getClassName());
            map.put("subject_name", classEntity.getSubject().getSubjectName());
            map.put("teacher_name", classEntity.getTeacher().getFullName());
            return map;
        }).collect(Collectors.toList());
    }

    @Override
    public List<Map<String, Object>> getStudentsInClass(Long classId) {
        Classes classEntity = classRepository.findById(classId)
                .orElseThrow(() -> new IllegalArgumentException("Class not found"));

        return classEntity.getStudents().stream().map(classStudent -> {
            Map<String, Object> map = new HashMap<>();
            map.put("student_id", classStudent.getUserId());
            map.put("full_name", classStudent.getFullName());
            map.put("email", classStudent.getEmail());
            return map;
        }).collect(Collectors.toList());
    }

    @Override
    public Map<String, Object> getTeacherInClass(Long classId) {
        Classes classEntity = classRepository.findById(classId)
                .orElseThrow(() -> new IllegalArgumentException("Class not found"));

        User teacher = classEntity.getTeacher();
        return Map.of(
                "teacher_id", teacher.getUserId(),
                "full_name", teacher.getFullName(),
                "email", teacher.getEmail(),
                "subject_name", classEntity.getSubject().getSubjectName()
        );
    }

    @Override
    public List<Map<String, Object>> getClassesByTeacher(Long teacherId) {
        return List.of();
    }

    @Override
    public Classes getClassById(Long classId) {
        return  classRepository.findById(classId)
                .orElseThrow(() -> new IllegalArgumentException("Class not found"));

    }

    @Override
    public ApiResponse addStudentToClass(Long classId, StudentDto studentDto) {
        Classes classEntity = classRepository.findById(classId)
                .orElseThrow(() -> new ResourceNotFoundException(AppConstants.CLASSES, AppConstants.ID, classId));

        User student = userRepository.findById(studentDto.getStudentId())
                .orElseThrow(() -> new ResourceNotFoundException(AppConstants.USER, AppConstants.ID, studentDto.getStudentId()));

        classEntity.getStudents().add(student);
        classRepository.save(classEntity);

        return new ApiResponse(true, "Student added to class successfully");
    }

//    @Override
//    public Map<String, Object> getTeacherDetailsInClass(Long classId) {
//        Classes classEntity = classRepository.findById(classId)
//                .orElseThrow(() -> new IllegalArgumentException("Class not found"));
//
//        User teacher = classEntity.getTeacher();
//        return Map.of(
//                "teacherId", teacher.getUserId(),
//                "fullName", teacher.getFullName(),
//                "email", teacher.getEmail(),
//                "subjectName", classEntity.getSubject().getSubjectName()
//        );
//    }

}
