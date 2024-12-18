package online_quizzes.controller;

import online_quizzes.dto.CommonResponse;
import online_quizzes.dto.UserDto;
import online_quizzes.dto.UserResponseDto;
import online_quizzes.entity.User;
import online_quizzes.exception.AppException;
import online_quizzes.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

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
            return new ResponseEntity<>(CommonResponse.success(registeredUser), HttpStatus.CREATED);
        } catch (AppException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(CommonResponse.error(e.getMessage()));
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
            responseDto.setCreatedAt(authenticatedUser.getCreatedAt());
            responseDto.setUpdatedAt(authenticatedUser.getUpdatedAt());
            return ResponseEntity.ok(CommonResponse.success(responseDto));
        } catch (AppException e) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(e.getMessage());
        }
    }

    // Get User by Email
    @GetMapping("/{email}")
    public ResponseEntity<?> getUserByEmail(@PathVariable String email) {
        User user = userService.getUserByEmail(email);
        return ResponseEntity.ok(CommonResponse.success(user));
    }

    @GetMapping("/me")
    public ResponseEntity<User> getCurrentUser(@RequestParam Long userId) {
        User user = userService.getUserById(userId);
        return ResponseEntity.ok(user);
    }

    @GetMapping("")
    public ResponseEntity<?> getUsersExcludingAdmin() {
        List<User> users = userService.getUsers();
        return ResponseEntity.ok(CommonResponse.success(users));
    }

    @PutMapping("/{userId}")
    public ResponseEntity<?> updateUser(@PathVariable Long userId, @RequestBody UserDto userDTO) {
        try {
            User updatedUser = userService.updateUser(userId, userDTO);
            return ResponseEntity.ok(CommonResponse.success(updatedUser));
        } catch (AppException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(CommonResponse.error(e.getMessage()));
        }
    }

    @GetMapping("/teachers")
    public ResponseEntity<?> getUsersWithRoleTeacher() {
        List<User> teachers = userService.getUsersByRole("teacher");
        return ResponseEntity.ok(CommonResponse.success(teachers));
    }

    @GetMapping("/students")
    public ResponseEntity<?> getUsersWithRoleStudent() {
        List<User> students = userService.getUsersByRole("student");
        return ResponseEntity.ok(CommonResponse.success(students));
    }
}