package online_quizzes.controller;

import online_quizzes.dto.CommonResponse;
import online_quizzes.dto.ExamSubmissionDto;
import online_quizzes.service.ResultService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

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
