package com.example.quizeonline5.sevice.impl;

import com.example.quizeonline5.dto.QuestionDto;
import com.example.quizeonline5.entity.Question;
import com.example.quizeonline5.entity.QuestionBank;
import com.example.quizeonline5.repository.QuestionBankRepository;
import com.example.quizeonline5.repository.QuestionRepository;
import com.example.quizeonline5.sevice.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class QuestionServiceImpl implements QuestionService {
    @Autowired
    private QuestionRepository questionRepository;

    @Autowired
    private QuestionBankRepository questionBankRepository;

    @Override
    public Long addQuestionToBank(QuestionDto questionDto) {
        // Lấy ngân hàng câu hỏi từ ID
        QuestionBank questionBank = questionBankRepository.findById(questionDto.getBankId())
                .orElseThrow(() -> new IllegalArgumentException("Question Bank not found"));

        // Tạo đối tượng Question mới
        Question question = new Question();
        question.setQuestionContent(questionDto.getQuestionContent());
        question.setAnswer(questionDto.getAnswer());
        question.setCorrectAnswer(questionDto.getCorrectAnswer());
        question.setQuestionBank(questionBank);
        question.setCreatedAt(LocalDateTime.now());
        question.setUpdatedAt(LocalDateTime.now());

        // Lưu câu hỏi vào cơ sở dữ liệu
        return questionRepository.save(question).getQuestionId();
    }

    @Override
    public List<Map<String, Object>>  getAllQuestion() {
        return questionRepository.findAll()
                .stream()
                .map(question -> {
                    Map<String, Object> map = new HashMap<>();
                    map.put("question_id", question.getQuestionId());
                    map.put("question", question.getQuestionContent());
                    map.put("answer", question.getAnswer());
                    map.put("correct_answer", question.getCorrectAnswer());
                    map.put("question_bank_id", question.getQuestionBank().getQuestionBankId());
                    map.put("created_at", question.getCreatedAt());
                    map.put("updated_at", question.getUpdatedAt());
                    return map;
                }).collect(Collectors.toList());
    }

    @Override
    public  List<Map<String, Object>>  getAllQuestion(Long bankId) {
        return questionRepository.findAll()
            .stream()
            .filter(question -> question.getQuestionBank().getQuestionBankId().equals(bankId))
            .map(question -> {
                Map<String, Object> map = new HashMap<>();
                map.put("question_id", question.getQuestionId());
                map.put("question", question.getQuestionContent());
                map.put("answer", question.getAnswer());
                map.put("correct_answer", question.getCorrectAnswer());
                map.put("question_bank_id", question.getQuestionBank().getQuestionBankId());
                map.put("created_at", question.getCreatedAt());
                map.put("updated_at", question.getUpdatedAt());
                return map;
            }).collect(Collectors.toList());
    }
}