package com.example.quizeonline5.controller;

import com.example.quizeonline5.dto.UserPrincipal;
import com.example.quizeonline5.dto.UserSummary;
import com.example.quizeonline5.entity.User;
import com.example.quizeonline5.security.CurrentUser;
import com.example.quizeonline5.sevice.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/users")
public class UserController {
    @Autowired
    private UserService userService;

    @GetMapping("/{email}")
    public ResponseEntity<User> getUserByEmail(@PathVariable String email) {
        User user = userService.getUserByEmail(email);

        return ResponseEntity.ok(user);
    }

    @GetMapping("/me")
    public ResponseEntity<UserSummary> getCurrentUser(@CurrentUser UserPrincipal currentUser) {
        UserSummary userSummary = userService.getCurrentUser(currentUser);
        return new ResponseEntity< >(userSummary, HttpStatus.OK);
    }
}
