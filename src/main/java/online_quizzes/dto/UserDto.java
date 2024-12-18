package online_quizzes.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

@Data
public class UserDto {
    @JsonProperty("user_id")
    private Long userId;
    private String email;
    private String password;
    @JsonProperty("full_name")
    private String fullName;
    private String role;
}