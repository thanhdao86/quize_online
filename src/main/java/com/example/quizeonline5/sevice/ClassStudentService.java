package com.example.quizeonline5.sevice;

import com.example.quizeonline5.dto.ApiResponse;
import com.example.quizeonline5.dto.ClassDto;
import com.example.quizeonline5.dto.StudentDto;
import com.example.quizeonline5.entity.Classes;

import java.util.List;
import java.util.Map;

public interface ClassStudentService {
    void deleteMappingByClassId(Long classId);
}