package online_quizzes.repository;

import online_quizzes.entity.Exam;
import online_quizzes.entity.ExamQuestion;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ExamQuestionRepository extends JpaRepository<ExamQuestion, Long> {
    List<ExamQuestion> findByExam(Exam exam);
}