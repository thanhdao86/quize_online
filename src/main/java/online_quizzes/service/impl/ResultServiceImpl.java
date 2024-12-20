package online_quizzes.service.impl;

import online_quizzes.dto.AnswerDto;
import online_quizzes.dto.ExamSubmissionDto;
import online_quizzes.entity.*;
import online_quizzes.repository.*;
import online_quizzes.service.ResultService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class ResultServiceImpl implements ResultService {
    @Autowired
    private ResultRepository resultRepository;

    @Autowired
    private ResultAnswerRepository resultAnswerRepository;

    @Autowired
    private QuestionRepository questionRepository;

    @Autowired
    private ExamRepository examRepository;

    @Autowired
    private UserRepository userRepository;

    @Override
    public Long submitExam(ExamSubmissionDto submissionDto) {
        // Lấy thông tin sinh viên và đề thi
        User student = userRepository.findById(submissionDto.getStudentId())
                .orElseThrow(() -> new IllegalArgumentException("Student not found"));
        Exam exam = examRepository.findById(submissionDto.getExamId())
                .orElseThrow(() -> new IllegalArgumentException("Exam not found"));

        // Tạo đối tượng Result
        Result result = new Result();
        result.setUser(student);
        result.setExam(exam);
        result.setSubmittedAt(LocalDateTime.now());
        result.setScore(0); // Tạm thời set điểm = 0
        result.setTotalCorrect(0); // Tạm thời set điểm = 0
        result.setTotalQuestion(0); // Tạm thời set điểm = 0
        result = resultRepository.save(result);

        // Xử lý từng câu trả lời
        double totalScore = 0;
        double totalQuestion = 0;
        double totalCorrect = 0;
        for (AnswerDto answerDto : submissionDto.getAnswers()) {
            Question question = questionRepository.findById(answerDto.getQuestionId())
                    .orElseThrow(() -> new IllegalArgumentException("Question not found"));
            totalQuestion += 1;
            boolean isCorrect = question.getCorrectAnswer().equals(answerDto.getStudentAnswer());
            if (isCorrect) {
                totalCorrect += 1; // Mỗi câu đúng 1 điểm (tuỳ logic)
            }

            ResultAnswer resultAnswer = new ResultAnswer();
            resultAnswer.setResult(result);
            resultAnswer.setQuestion(question);
            resultAnswer.setStudentAnswer(answerDto.getStudentAnswer());
            resultAnswer.setCorrect(isCorrect);

            resultAnswerRepository.save(resultAnswer);
        }

        // Cập nhật điểm tổng kết
        result.setTotalQuestion(totalQuestion);
        result.setTotalCorrect(totalCorrect);
        resultRepository.save(result);

        return result.getResultId();
    }

    @Override
    public Result getResultById(Long resultId) {
        return resultRepository.findById(resultId)
                .orElseThrow(() -> new IllegalArgumentException("Result not found"));
    }

    @Override
    public List<Result> getResultsByStudent(Long studentId) {
        return resultRepository.findByUser_UserId(studentId);
    }
}