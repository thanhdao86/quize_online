package online_quizzes.repository;

import online_quizzes.entity.ResultAnswer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ResultAnswerRepository extends JpaRepository<ResultAnswer, Long> {
}
