package com.example.quizeonline5.controller;

import com.example.quizeonline5.dto.ClassDto;
import com.example.quizeonline5.sevice.ClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/classes")
public class ClassController {

    @Autowired
    private ClassService classService;

    @GetMapping
    public ResponseEntity<?> getAllClasses() {
        return ResponseEntity.ok(classService.getAllClasses());
    }


    @PostMapping
    public ResponseEntity<?> createClass(@RequestBody ClassDto classDto) {
        Long classId = classService.createClass(classDto);
        return ResponseEntity.ok().body("Class created successfully with ID: " + classId);
    }

    @DeleteMapping("/{classId}")
    public ResponseEntity<?> deleteClass(@PathVariable Long classId) {
        classService.deleteClass(classId);
        return ResponseEntity.ok().body("Class deleted successfully");
    }

    @PutMapping("/{classId}")
    public ResponseEntity<?> updateClass(@PathVariable Long classId, @RequestBody ClassDto classDto) {
        classService.updateClass(classId, classDto);
        return ResponseEntity.ok().body("Class updated successfully");
    }



    @GetMapping("/{classId}/students")
    public ResponseEntity<?> getStudentsInClass(@PathVariable Long classId) {
        return ResponseEntity.ok(classService.getStudentsInClass(classId));
    }

    @GetMapping("/{classId}/teacher")
    public ResponseEntity<?> getTeacherInClass(@PathVariable Long classId) {
        return ResponseEntity.ok(classService.getTeacherInClass(classId));
    }

    @GetMapping("/teachers/{teacherId}/classes")
    public ResponseEntity<?> getClassesByTeacher(@PathVariable Long teacherId) {
        return ResponseEntity.ok(classService.getClassesByTeacher(teacherId));
    }
}
