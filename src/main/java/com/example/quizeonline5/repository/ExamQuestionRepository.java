package com.example.quizeonline5.repository;

import com.example.quizeonline5.entity.Exam;
import com.example.quizeonline5.entity.ExamQuestion;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ExamQuestionRepository extends JpaRepository<ExamQuestion, Long> {
    List<ExamQuestion> findByExam(Exam exam);
}