package com.example.quizeonline5.sevice.impl;


import com.example.quizeonline5.dto.ApiResponse;
import com.example.quizeonline5.dto.ClassDto;
import com.example.quizeonline5.dto.StudentDto;
import com.example.quizeonline5.entity.ClassStudent;
import com.example.quizeonline5.entity.Classes;
import com.example.quizeonline5.entity.Subject;
import com.example.quizeonline5.entity.User;
import com.example.quizeonline5.exception.ResourceNotFoundException;
import com.example.quizeonline5.repository.ClassRepository;
import com.example.quizeonline5.repository.ClassStudentRepository;
import com.example.quizeonline5.repository.SubjectRepository;
import com.example.quizeonline5.repository.UserRepository;
import com.example.quizeonline5.sevice.ClassService;
import com.example.quizeonline5.sevice.ClassStudentService;
import com.example.quizeonline5.utils.AppConstants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class ClassStudentServiceImpl implements ClassStudentService {
    @Autowired
    private ClassStudentRepository classStudentRepository;

    @Autowired
    private ClassRepository classRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private SubjectRepository subjectRepository;

    @Override
    public void deleteMappingByClassId(Long classId) {
        Classes classes = classRepository.findById(classId).orElseThrow(() -> new ResourceNotFoundException(AppConstants.CLASSES, AppConstants.ID, classId));
        if (classes == null) {
            throw new IllegalArgumentException("Classs not found");
        }

        List<ClassStudent> classStudents = classStudentRepository.findByClassEntityIs(classes);
        if (classStudents == null) {
            throw new IllegalArgumentException("Subject not found");
        }
        for (ClassStudent classStudent : classStudents) {
            classStudentRepository.delete(classStudent);
        }
    }
}
