package online_quizzes.controller;

import online_quizzes.dto.CommonResponse;
import online_quizzes.dto.SubjectDto;
import online_quizzes.service.SubjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

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
