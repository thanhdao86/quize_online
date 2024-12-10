package com.example.quizeonline5.repository;

import com.example.quizeonline5.entity.Classes;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ClassRepository extends JpaRepository<Classes, Long> {
    List<Classes> findAllByTeacher_UserId(Long teacherId);
}
