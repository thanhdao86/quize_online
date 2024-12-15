package com.example.quizeonline5.sevice;

import com.example.quizeonline5.dto.UserDto;
import com.example.quizeonline5.entity.User;

import java.util.List;

public interface UserService {
    User registerUser(UserDto userDTO);
    User authenticateUser(String email, String password);
    User getUserByEmail(String email);
    User getUserById(Long userId);
    List<User> getUsers();
    User updateUser(Long userId, UserDto userDTO);
}