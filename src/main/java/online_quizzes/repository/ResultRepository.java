package online_quizzes.repository;

import online_quizzes.entity.Result;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ResultRepository extends JpaRepository<Result, Long> {
    List<Result> findByUser_UserId(Long userId); // Lấy kết quả theo sinh viên
    List<Result> findByExam_ExamId(Long examId); // Lấy kết quả theo đề thi
}
