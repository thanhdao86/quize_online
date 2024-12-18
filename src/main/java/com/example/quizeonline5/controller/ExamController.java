package com.example.quizeonline5.controller;

import com.example.quizeonline5.dto.CommonResponse;
import com.example.quizeonline5.dto.ExamDto;
import com.example.quizeonline5.entity.Exam;
import com.example.quizeonline5.sevice.ExamService;
import org.hibernate.annotations.Parameter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
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

    @PutMapping("/{examId}")
    public ResponseEntity<?> updateExam(@PathVariable Long examId, @RequestBody ExamDto examDto) {
        examService.updateExam(examId, examDto);
        return ResponseEntity.ok(CommonResponse.success("Exam updated successfully"));
    }

    @GetMapping
    public ResponseEntity<?> getAllExams() {
        List<Exam> exams = examService.getAllExams();
        return ResponseEntity.ok(CommonResponse.success(exams));
    }

    @GetMapping("/{examId}")
    public ResponseEntity<?> getExamDetails(@PathVariable Long examId,
                                            @RequestParam(name = "student_id", required = false) Long studentId) {
        try {
            return ResponseEntity.ok(CommonResponse.success(examService.getExamDetails(examId, studentId)));
        } catch (IllegalArgumentException e) {
            return ResponseEntity.badRequest().body(CommonResponse.error(e.getMessage()));
        }
    }

    @GetMapping("/class/{classId}")
    public ResponseEntity<?> getExamDetailByClassId(@PathVariable Long classId,  @RequestParam(name = "student_id", required = false) Long studentId,
                                                    @RequestParam(name = "teacher_id", required = false) Long teacherId) {
        return new ResponseEntity< >(CommonResponse.success(examService.getExamByClassId(classId, studentId, teacherId)), HttpStatus.OK);
    }

    @GetMapping("/user/{userId}")
    public ResponseEntity<?> getExamsByUserId(@PathVariable Long userId) {
        List<Exam> exams = examService.getExamsByUserId(userId);
        return ResponseEntity.ok(CommonResponse.success(exams));
    }
}
