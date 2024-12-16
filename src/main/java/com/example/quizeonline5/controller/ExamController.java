package com.example.quizeonline5.controller;

import com.example.quizeonline5.dto.CommonResponse;
import com.example.quizeonline5.dto.ExamDto;
import com.example.quizeonline5.entity.Exam;
import com.example.quizeonline5.sevice.ExamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/exams")
public class ExamController {
    @Autowired
    private ExamService examService;

    @PostMapping
    public ResponseEntity<?> createExam(@RequestBody ExamDto examDto) {
        Long examId = examService.createExam(examDto);
        return ResponseEntity.ok(CommonResponse.success("Exam created successfully with ID: " + examId));
    }

    @GetMapping
    public ResponseEntity<?> getAllExams() {
        List<Exam> exams = examService.getAllExams();
        return ResponseEntity.ok(CommonResponse.success(exams));
    }
}
