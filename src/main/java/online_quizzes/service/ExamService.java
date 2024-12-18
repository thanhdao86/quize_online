package online_quizzes.service;

import online_quizzes.dto.ExamDto;
import online_quizzes.entity.Exam;

import java.util.List;

public interface ExamService {
    Long createExam(ExamDto examDto);
    List<Exam> getAllExams();
    void updateExam(Long examId, ExamDto examDto); // Add this method
    List<Exam> getExamsByUserId(Long userId);
    List<ExamDto> getExamByClassId(Long classId, Long studentId, Long teacherId);
    ExamDto getExamDetails(Long examId, Long studentId, Long teacherId);
}
