package online_quizzes.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

public class SubjectDto {
    @JsonProperty("subject_name")
    private String subjectName;
    @JsonProperty("description")
    private String description;

    // Getters và Setters
    public String getSubjectName() {
        return subjectName;
    }

    public void setSubjectName(String subjectName) {
        this.subjectName = subjectName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setSubjectId(Long subjectId) {

    }
}
