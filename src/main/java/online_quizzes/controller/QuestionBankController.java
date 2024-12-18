package online_quizzes.controller;

import online_quizzes.dto.CommonResponse;
import online_quizzes.dto.QuestionBankDto;
import online_quizzes.dto.QuestionBankDetailDto;
import online_quizzes.service.QuestionBankService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/question-banks")
public class QuestionBankController {
    @Autowired
    private QuestionBankService questionBankService;

    @PostMapping
    public ResponseEntity<?> createQuestionBank(@RequestBody QuestionBankDto questionBankDto) {
        Long id = questionBankService.createQuestionBank(questionBankDto);
        if (id == null) {
            return new ResponseEntity<>(CommonResponse.error("Create failed"), HttpStatus.BAD_REQUEST);
        }
        return new ResponseEntity<>(CommonResponse.success("Create success"), HttpStatus.OK);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteQuestionBank(@PathVariable Long id) {
        questionBankService.deleteQuestionBank(id);
        return new ResponseEntity<>(CommonResponse.success("Question Bank deleted successfully"), HttpStatus.OK);
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> updateQuestionBank(@PathVariable Long id, @RequestBody QuestionBankDto questionBankDto) {
        questionBankService.updateQuestionBank(id, questionBankDto);
        return new ResponseEntity<>(CommonResponse.success("Question Bank updated successfully"), HttpStatus.OK);
    }

    @GetMapping("/user/{userId}")
    public ResponseEntity<?> getAllQuestionBanksByUser(@PathVariable Long userId) {
        return new ResponseEntity<>(CommonResponse.success(questionBankService.getAllQuestionBanksByUser(userId)), HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> getQuestionBankDetails(@PathVariable Long id) {
        QuestionBankDetailDto details = questionBankService.getQuestionBankDetails(id);
        return new ResponseEntity<>(CommonResponse.success(details), HttpStatus.OK);
    }

    @GetMapping
    public ResponseEntity<?> getAllQuestionBank() {
        return new ResponseEntity<>(CommonResponse.success(questionBankService.getAllQuestionBank()), HttpStatus.OK);
    }
}