package com.example.quizeonline5.repository;
import com.example.quizeonline5.entity.Question;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface QuestionRepository extends JpaRepository<Question, Long> {
    List<Question> findByQuestionBank_QuestionBankId(Long bankId);
}
