package com.example.quizeonline5.repository;

import com.example.quizeonline5.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Optional;

public interface UserRepository extends JpaRepository<User, Long> {
    Optional<User> findByEmail(String email);

    @Query(value = "SELECT * FROM users u WHERE u.user_id = ?", nativeQuery = true)
    Optional<User> findByUserId(Long id);
}
