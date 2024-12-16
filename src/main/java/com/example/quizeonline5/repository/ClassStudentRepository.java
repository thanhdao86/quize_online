package com.example.quizeonline5.repository;

import com.example.quizeonline5.entity.ClassStudent;
import com.example.quizeonline5.entity.Classes;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ClassStudentRepository extends JpaRepository<ClassStudent, Long> {
    List<ClassStudent> findByClassEntityIs(Classes classEntity);
    void deleteClassStudentByClassEntity(ClassStudent classEntity);
}
