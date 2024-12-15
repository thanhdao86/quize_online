package com.example.quizeonline5.repository;

import com.example.quizeonline5.entity.ResultAnswer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ResultAnswerRepository extends JpaRepository<ResultAnswer, Long> {
}
