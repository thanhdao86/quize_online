package com.example.quizeonline5.repository;

import com.example.quizeonline5.entity.QuestionBank;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface QuestionBankRepository extends JpaRepository<QuestionBank, Long> {
    List<QuestionBank> findByCreatedBy_UserId(Long userId);

    // Find all public question banks
    List<QuestionBank> findByIsPublicTrue();

    // Find a specific question bank by ID and ensure it belongs to a specific user
    QuestionBank findByQuestionBankIdAndCreatedBy_UserId(Long questionBankId, Long userId);
}