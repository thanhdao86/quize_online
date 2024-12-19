package online_quizzes.repository;

import online_quizzes.entity.Classes;
import online_quizzes.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.data.jpa.repository.Query;

import java.util.Optional;
import java.util.List;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    Optional<User> findByEmail(String email);

    @Query("SELECT u FROM User u JOIN u.classes c WHERE c = :classEntity AND u.role = :role")
    List<User> findByClassesContainingAndRole(Classes classEntity, String role);

    long countByRole(String role);
}
