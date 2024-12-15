package com.example.quizeonline5.sevice.impl;

import com.example.quizeonline5.config.PasswordEncoder;
import com.example.quizeonline5.dto.UserDto;
import com.example.quizeonline5.entity.User;
import com.example.quizeonline5.exception.AppException;
import com.example.quizeonline5.repository.UserRepository;
import com.example.quizeonline5.sevice.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public User registerUser(UserDto userDTO) {
        Optional<User> existingUser = userRepository.findByEmail(userDTO.getEmail());
        if (existingUser.isPresent()) {
            throw new AppException("User with this email already exists");
        }

        User user = new User();
        user.setEmail(userDTO.getEmail());
        user.setPassword(passwordEncoder.encode(userDTO.getPassword())); // Hash the password
        user.setFullName(userDTO.getFullName());
        user.setRole(userDTO.getRole());
        user.setCreatedAt(LocalDateTime.now());
        user.setUpdatedAt(LocalDateTime.now());

        return userRepository.save(user);
    }

    @Override
    public User authenticateUser(String email, String password) {
        // Find user by email
        User user = userRepository.findByEmail(email)
                .orElseThrow(() -> new AppException("User not found"));

        // Check password
        if (!passwordEncoder.matches(password, user.getPassword())) {
            throw new AppException("Invalid credentials");
        }

        return user;
    }

    @Override
    public User getUserByEmail(String email) {
        return userRepository.findByEmail(email)
                .orElseThrow(() -> new AppException("User not found"));
    }

    @Override
    public User getUserById(Long userId) {
        return userRepository.findById(userId)
                .orElseThrow(() -> new AppException("User not found"));
    }

    @Override
    public List<User> getUsers() {
        return userRepository.findAll().stream()
                .filter(user -> !"admin".equalsIgnoreCase(user.getRole()))
                .sorted((u1, u2) -> u2.getUserId().compareTo(u1.getUserId()))
                .collect(Collectors.toList());
    }

    @Override
    public User updateUser(Long userId, UserDto userDTO) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new AppException("User not found"));

        user.setEmail(userDTO.getEmail());
        user.setFullName(userDTO.getFullName());
        user.setRole(userDTO.getRole());
        if (userDTO.getPassword() != null && !userDTO.getPassword().isEmpty()) {
            user.setPassword(passwordEncoder.encode(userDTO.getPassword()));
        }
        user.setUpdatedAt(LocalDateTime.now());

        return userRepository.save(user);
    }
}