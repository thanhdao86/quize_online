package com.example.quizeonline5.sevice;

import com.example.quizeonline5.entity.User;

public interface UserService {
    User registerUser(User user);
    User getUserByEmail(String email);
}
