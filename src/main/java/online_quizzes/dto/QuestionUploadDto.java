package online_quizzes.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

@Data
public class QuestionUploadDto {
    @JsonProperty("user_id")
    private Long userID; // ID of the question bank
    @JsonProperty("question_bank_id")
    private Long questionBankId; // ID of the question bank
    @JsonProperty("question")
    private String base64ExcelContent; // Base64 string of the Excel file
}
