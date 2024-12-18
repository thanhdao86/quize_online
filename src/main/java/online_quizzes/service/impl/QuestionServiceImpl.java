package online_quizzes.service.impl;

import online_quizzes.dto.QuestionDto;
import online_quizzes.entity.Question;
import online_quizzes.entity.QuestionBank;
import online_quizzes.repository.QuestionBankRepository;
import online_quizzes.repository.QuestionRepository;
import online_quizzes.service.QuestionService;
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

    @Override
    public List<Map<String, Object>> getQuestionsByUserId(Long userId) {
        return questionRepository.findAll().stream()
                .filter(question -> question.getQuestionBank().getCreatedBy().getUserId().equals(userId))
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
    public Long updateQuestion(Long questionId, QuestionDto questionDto) {
        // Lấy câu hỏi từ ID
        Question question = questionRepository.findById(questionId)
                .orElseThrow(() -> new IllegalArgumentException("Question not found"));

        // Cập nhật thông tin câu hỏi
        question.setQuestionContent(questionDto.getQuestionContent());
        question.setAnswer(questionDto.getAnswer());
        question.setCorrectAnswer(questionDto.getCorrectAnswer());
        question.setUpdatedAt(LocalDateTime.now());

        // Lưu câu hỏi vào cơ sở dữ liệu
        return questionRepository.save(question).getQuestionId();
    }
}