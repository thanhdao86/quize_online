package online_quizzes.controller;

import online_quizzes.dto.CommonResponse;
import online_quizzes.dto.QuestionDto;
import online_quizzes.dto.QuestionUploadDto;
import online_quizzes.service.QuestionService;
import online_quizzes.service.QuestionUploadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/questions")
public class QuestionController {
    @Autowired
    private QuestionService questionService;

    @Autowired
    private QuestionUploadService questionUploadService;


    @PostMapping
    public ResponseEntity<?> addQuestionToBank(@RequestBody QuestionDto questionDto) {
        Long questionId = questionService.addQuestionToBank(questionDto);
        return ResponseEntity.ok(CommonResponse.success("Question added successfully with ID: " + questionId));
    }

    @GetMapping
    public ResponseEntity<?> getAllQuestion() {
        return new ResponseEntity< >(CommonResponse.success(questionService.getAllQuestion()), HttpStatus.OK);
    }

    @GetMapping(path = "/banks/{bankId}")
    public ResponseEntity<?> getAllQuestionByBankId(@PathVariable Long bankId) {
        return new ResponseEntity< >(CommonResponse.success(questionService.getAllQuestion(bankId)), HttpStatus.OK);
    }

    @PostMapping("/upload")
    public ResponseEntity<?> uploadQuestions(@RequestBody QuestionUploadDto uploadDto) {
        questionUploadService.uploadQuestions(uploadDto);
        return ResponseEntity.ok("Questions uploaded successfully.");
    }

    @GetMapping("/user/{userId}")
    public ResponseEntity<?> getQuestionsByUserId(@PathVariable Long userId) {
        List<Map<String, Object>> questions = questionService.getQuestionsByUserId(userId);
        return ResponseEntity.ok(CommonResponse.success(questions));
    }
}