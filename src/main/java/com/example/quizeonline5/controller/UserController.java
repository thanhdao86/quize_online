package com.example.quizeonline5.controller;

import com.example.quizeonline5.dto.UserDto;
import com.example.quizeonline5.dto.UserResponseDto;
import com.example.quizeonline5.entity.User;
import com.example.quizeonline5.exception.AppException;
import com.example.quizeonline5.sevice.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/users")
public class UserController {
    @Autowired
    private UserService userService;

    // User Registration Endpoint
    @PostMapping("/register")
    public ResponseEntity<?> registerUser(@RequestBody UserDto userDTO) {
        try {
            User registeredUser = userService.registerUser(userDTO);
            return new ResponseEntity<>(registeredUser, HttpStatus.CREATED);
        } catch (AppException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
        }
    }

    // User Authentication Endpoint
    @PostMapping("/login")
    public ResponseEntity<?> loginUser(@RequestBody UserDto userDTO) {
        try {
            User authenticatedUser = userService.authenticateUser(userDTO.getEmail(), userDTO.getPassword());
            UserResponseDto responseDto = new UserResponseDto();
            responseDto.setUserId(authenticatedUser.getUserId());
            responseDto.setEmail(authenticatedUser.getEmail());
            responseDto.setRole(authenticatedUser.getRole());
            responseDto.setFullName(authenticatedUser.getFullName());
            return ResponseEntity.ok(responseDto);
        } catch (AppException e) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(e.getMessage());
        }
    }

    // Get User by Email
    @GetMapping("/{email}")
    public ResponseEntity<User> getUserByEmail(@PathVariable String email) {
        User user = userService.getUserByEmail(email);
        return ResponseEntity.ok(user);
    }

    @GetMapping("/me")
    public ResponseEntity<User> getCurrentUser(@RequestParam Long userId) {
        User user = userService.getUserById(userId);
        return ResponseEntity.ok(user);
    }

    @GetMapping("")
    public ResponseEntity<List<UserResponseDto>> getUsersExcludingAdmin() {
        List<User> users = userService.getUsers();
        List<UserResponseDto> userResponseDtos = users.stream().map(user -> {
            UserResponseDto dto = new UserResponseDto();
            dto.setUserId(user.getUserId());
            dto.setEmail(user.getEmail());
            dto.setRole(user.getRole());
            dto.setFullName(user.getFullName());
            dto.setCreatedAt(user.getCreatedAt());
            dto.setUpdatedAt(user.getUpdatedAt());
            return dto;
        }).collect(Collectors.toList());
        return ResponseEntity.ok(userResponseDtos);
    }

    @PutMapping("/{userId}")
    public ResponseEntity<?> updateUser(@PathVariable Long userId, @RequestBody UserDto userDTO) {
        try {
            User updatedUser = userService.updateUser(userId, userDTO);
            return ResponseEntity.ok(updatedUser);
        } catch (AppException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
        }
    }
}