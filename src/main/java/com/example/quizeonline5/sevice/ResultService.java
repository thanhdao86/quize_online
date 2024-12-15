package com.example.quizeonline5.sevice;

import com.example.quizeonline5.dto.ExamSubmissionDto;
import com.example.quizeonline5.entity.Result;

import java.util.List;

public interface ResultService {
    Long submitExam(ExamSubmissionDto submissionDto); // Sinh viên nộp bài thi
    Result getResultById(Long resultId); // Lấy kết quả theo ID
    List<Result> getResultsByStudent(Long studentId); // Lấy tất cả kết quả của sinh viên
}