package com.example.quizeonline5.controller;

import com.example.quizeonline5.dto.CommonResponse;
import com.example.quizeonline5.dto.SubjectDto;
import com.example.quizeonline5.entity.Subject;
import com.example.quizeonline5.sevice.SubjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/subjects")
public class SubjectController {
    @Autowired
    private SubjectService subjectService;

    @PostMapping
    public ResponseEntity<?> createSubject(@RequestBody SubjectDto subjectDto) {
        Long id = subjectService.createSubject(subjectDto);
        return ResponseEntity.ok(CommonResponse.success("Subject created successfully with ID: " + id));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteSubject(@PathVariable Long id) {
        subjectService.deleteSubject(id);
        return ResponseEntity.ok(CommonResponse.success("Subject deleted successfully"));
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> updateSubject(@PathVariable Long id, @RequestBody SubjectDto subjectDto) {
        subjectService.updateSubject(id, subjectDto);
        return ResponseEntity.ok(CommonResponse.success("Subject updated successfully"));
    }

    @GetMapping
    public ResponseEntity<?> getAllSubjects() {
        return ResponseEntity.ok(CommonResponse.success(subjectService.getAllSubjects()));
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> getSubjectById(@PathVariable Long id) {
        return ResponseEntity.ok(CommonResponse.success(subjectService.getSubjectById(id)));
    }
}
