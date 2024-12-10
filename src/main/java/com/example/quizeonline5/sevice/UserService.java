package com.example.quizeonline5.sevice;

import com.example.quizeonline5.entity.User;
import org.springframework.data.jpa.repository.Query;

public interface UserService {
    User registerUser(User user);
    User getUserByEmail(String email);
//    User finByUserId(Long id);
}
