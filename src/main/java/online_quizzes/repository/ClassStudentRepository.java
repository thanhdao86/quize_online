package online_quizzes.repository;

import online_quizzes.entity.ClassStudent;
import online_quizzes.entity.Classes;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ClassStudentRepository extends JpaRepository<ClassStudent, Long> {
    List<ClassStudent> findByClassEntityIs(Classes classEntity);
    void deleteClassStudentByClassEntity(ClassStudent classEntity);
}
