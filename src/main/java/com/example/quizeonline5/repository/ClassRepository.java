package com.example.quizeonline5.repository;

import com.example.quizeonline5.entity.Classes;
import com.example.quizeonline5.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ClassRepository extends JpaRepository<Classes, Long> {
//    List<Classes> findAllByTeacher_UserId(Long teacherId);
    List<Classes> findByTeacher(User teacher);
}
