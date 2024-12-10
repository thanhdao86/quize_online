package com.example.quizeonline5.repository;

import com.example.quizeonline5.entity.Subject;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SubjectRepository extends JpaRepository<Subject, Long> {
    // Tìm kiếm subject theo tên (nếu cần)
    Subject findBySubjectName(String subjectName);
}
