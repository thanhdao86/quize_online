package com.example.quizeonline5.sevice;

import com.example.quizeonline5.dto.ExamDto;
import com.example.quizeonline5.entity.Exam;

import java.util.List;

public interface ExamService {
    Long createExam(ExamDto examDto);
    List<Exam> getAllExams();
    void updateExam(Long examId, ExamDto examDto); // Add this method
    List<Exam> getExamsByUserId(Long userId);
    List<ExamDto> getExamByClassId(Long classId, Long studentId, Long teacherId);
    ExamDto getExamDetails(Long examId, Long studentId);
}
