package online_quizzes.service;

import online_quizzes.dto.ExamSubmissionDto;
import online_quizzes.entity.Result;

import java.util.List;

public interface ResultService {
    Long submitExam(ExamSubmissionDto submissionDto); // Sinh viên nộp bài thi
    Result getResultById(Long resultId); // Lấy kết quả theo ID
    List<Result> getResultsByStudent(Long studentId); // Lấy tất cả kết quả của sinh viên
}