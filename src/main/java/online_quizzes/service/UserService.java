package online_quizzes.service;

import online_quizzes.dto.UserDto;
import online_quizzes.entity.User;

import java.util.List;

public interface UserService {
    User registerUser(UserDto userDTO);
    User authenticateUser(String email, String password);
    User getUserByEmail(String email);
    User getUserById(Long userId);
    List<User> getUsers();
    User updateUser(Long userId, UserDto userDTO);
    List<User> getUsersByRole(String role);
}