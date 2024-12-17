package com.example.quizeonline5.repository;

import com.example.quizeonline5.dto.ExamDto;
import com.example.quizeonline5.entity.Exam;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ExamRepository extends JpaRepository<Exam, Long> {
    List<Exam> findByCreatedByUserId(Long userId);
}
