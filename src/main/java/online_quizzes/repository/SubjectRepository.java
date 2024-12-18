package online_quizzes.repository;

import online_quizzes.entity.Subject;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SubjectRepository extends JpaRepository<Subject, Long> {
    // Tìm kiếm subject theo tên (nếu cần)
    Subject findBySubjectName(String subjectName);
}
