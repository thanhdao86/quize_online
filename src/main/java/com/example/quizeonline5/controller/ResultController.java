package com.example.quizeonline5.controller;

import com.example.quizeonline5.dto.CommonResponse;
import com.example.quizeonline5.dto.ExamSubmissionDto;
import com.example.quizeonline5.entity.Result;
import com.example.quizeonline5.sevice.ResultService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/results")
public class ResultController {
    @Autowired
    private ResultService resultService;

    @PostMapping
    public ResponseEntity<?> submitExam(@RequestBody ExamSubmissionDto submissionDto) {
        Long resultId = resultService.submitExam(submissionDto);
        return ResponseEntity.ok(CommonResponse.success("Exam submitted successfully with Result ID: " + resultId));
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> getResultById(@PathVariable Long id) {
        return ResponseEntity.ok(CommonResponse.success(resultService.getResultById(id)));
    }

    @GetMapping("/student/{studentId}")
    public ResponseEntity<?> getResultsByStudent(@PathVariable Long studentId) {
        return ResponseEntity.ok(CommonResponse.success(resultService.getResultsByStudent(studentId)));
    }
}
