package online_quizzes.controller;

import online_quizzes.dto.ApiResponse;
import online_quizzes.dto.ClassDto;
import online_quizzes.dto.CommonResponse;
import online_quizzes.dto.StudentDto;
import online_quizzes.entity.Classes;
import online_quizzes.service.ClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
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
        return new ResponseEntity< >(CommonResponse.success(classService.getAllClasses()), HttpStatus.OK);
    }


    @PostMapping
    public ResponseEntity<ApiResponse> createClass(@RequestBody ClassDto classDto) {
        ApiResponse apiResponse = classService.createClass(classDto);
        return new ResponseEntity< >(apiResponse, HttpStatus.OK);
    }

    @DeleteMapping("/{classId}")
    public ResponseEntity<ApiResponse> deleteClass(@PathVariable Long classId) {
        ApiResponse apiResponse = classService.deleteClass(classId);
        if (apiResponse.getSuccess()) {
            return new ResponseEntity< >(apiResponse, HttpStatus.OK);
        }
        return  new ResponseEntity< >(apiResponse, HttpStatus.BAD_REQUEST);
    }

    @PutMapping("/{classId}")
    public ResponseEntity<ApiResponse> updateClass(@PathVariable Long classId, @RequestBody ClassDto classDto) {
        ApiResponse apiResponse = classService.updateClass(classId, classDto);
        if (apiResponse.getSuccess()) {
            return new ResponseEntity< >(apiResponse, HttpStatus.OK);
        }
        return  new ResponseEntity< >(apiResponse, HttpStatus.BAD_REQUEST);
    }

    @GetMapping("/{classId}/students")
    public ResponseEntity<?> getStudentsInClass(@PathVariable Long classId) {
        return new ResponseEntity< >(CommonResponse.success(classService.getStudentsInClass(classId)), HttpStatus.OK);
    }

    @GetMapping("/{classId}/teacher")
    public ResponseEntity<?> getTeacherInClass(@PathVariable Long classId) {
        return ResponseEntity.ok(classService.getTeacherInClass(classId));
    }

    @GetMapping("/teachers/{teacherId}/classes")
    public ResponseEntity<?> getClassesByTeacher(@PathVariable Long teacherId) {
        return new ResponseEntity<>(CommonResponse.success(classService.getClassesByTeacher(teacherId)), HttpStatus.OK);
    }

    // get class student enroll
    @GetMapping("/students/{studentId}")
    public ResponseEntity<?> getAvailableClassesForStudent(@PathVariable Long studentId) {
        List<?> availableClasses = classService.getEnrolledClassByStudent(studentId);
        return new ResponseEntity<>(CommonResponse.success(availableClasses), HttpStatus.OK);
    }

    // get class by classId
    @GetMapping("/{classId}")
    public ResponseEntity<CommonResponse> getClassById(@PathVariable Long classId) {
        ClassDto dtClass = classService.getClassById(classId);
        if (dtClass != null) {
            return new ResponseEntity< >(CommonResponse.success(dtClass), HttpStatus.OK);
        }
        return new ResponseEntity< >(CommonResponse.error("Class not found"), HttpStatus.NOT_FOUND);
    }

    @PostMapping("/{classId}/students")
    public ResponseEntity<ApiResponse> addStudentToClass(@PathVariable Long classId, @RequestBody StudentDto studentDto) {
        ApiResponse apiResponse = classService.addStudentToClass(classId, studentDto);
        return new ResponseEntity<>(apiResponse, HttpStatus.OK);
    }
}
