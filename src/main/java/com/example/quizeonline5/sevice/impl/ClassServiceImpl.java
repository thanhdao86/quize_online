package com.example.quizeonline5.sevice.impl;


import com.example.quizeonline5.dto.ClassDto;
import com.example.quizeonline5.entity.Classes;
import com.example.quizeonline5.entity.Subject;
import com.example.quizeonline5.entity.User;
import com.example.quizeonline5.repository.ClassRepository;
import com.example.quizeonline5.repository.SubjectRepository;
import com.example.quizeonline5.repository.UserRepository;
import com.example.quizeonline5.sevice.ClassService;
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
    public Long createClass(ClassDto classDto) {

        if (classDto.getTeacherId() == null) {
            throw new IllegalArgumentException("Teacher ID must not be null");
        }
        if (classDto.getSubjectId() == null) {
            throw new IllegalArgumentException("Subject ID must not be null");
        }

        User teacher = userRepository.findById(classDto.getTeacherId())
                .orElseThrow(() -> new IllegalArgumentException("Teacher not found"));

        Subject subject = subjectRepository.findById(classDto.getSubjectId())
                .orElseThrow(() -> new IllegalArgumentException("Subject not found"));

        Classes classEntity = new Classes();
        classEntity.setClassName(classDto.getClassName());
        classEntity.setTeacher(teacher);
        classEntity.setSubject(subject);
        classEntity.setCreatedAt(LocalDateTime.now());
        return classRepository.save(classEntity).getClassId();
    }

    @Override
    public void deleteClass(Long classId) {
        classRepository.deleteById(classId);
    }

    @Override
    public void updateClass(Long classId, ClassDto classDto) {
        Classes classEntity = classRepository.findById(classId)
                .orElseThrow(() -> new IllegalArgumentException("Class not found"));

        User teacher = userRepository.findById(classDto.getTeacherId())
                .orElseThrow(() -> new IllegalArgumentException("Teacher not found"));

        classEntity.setClassName(classDto.getClassName());
        classEntity.setTeacher(teacher);
        classEntity.setUpdatedAt(java.time.LocalDateTime.now());
        classRepository.save(classEntity);
    }

    @Override
    public List<Map<String, Object>> getAllClasses() {
        return classRepository.findAll().stream().map(classEntity -> {
            Map<String, Object> map = new HashMap<>();
            map.put("classId", classEntity.getClassId());
            map.put("className", classEntity.getClassName());
            map.put("subjectName", classEntity.getSubject().getSubjectName());
            map.put("teacherName", classEntity.getTeacher().getFullName());
            return map;
        }).collect(Collectors.toList());
    }

    @Override
    public List<Map<String, Object>> getStudentsInClass(Long classId) {
        Classes classEntity = classRepository.findById(classId)
                .orElseThrow(() -> new IllegalArgumentException("Class not found"));

        return classEntity.getStudents().stream().map(classStudent -> {
            Map<String, Object> map = new HashMap<>();
            map.put("studentId", classStudent.getStudent().getUserId());
            map.put("fullName", classStudent.getStudent().getFullName());
            map.put("email", classStudent.getStudent().getEmail());
            return map;
        }).collect(Collectors.toList());
    }

    @Override
    public Map<String, Object> getTeacherInClass(Long classId) {
        Classes classEntity = classRepository.findById(classId)
                .orElseThrow(() -> new IllegalArgumentException("Class not found"));

        User teacher = classEntity.getTeacher();
        return Map.of(
                "teacherId", teacher.getUserId(),
                "fullName", teacher.getFullName(),
                "email", teacher.getEmail(),
                "subjectName", classEntity.getSubject().getSubjectName()
        );
    }

    @Override
    public List<Map<String, Object>> getClassesByTeacher(Long teacherId) {
        return List.of();
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
