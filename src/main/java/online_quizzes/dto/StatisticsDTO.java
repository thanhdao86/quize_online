package online_quizzes.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

public class StatisticsDTO {
    @JsonProperty("total_classes")
    private long totalClasses;

    @JsonProperty("total_teachers")
    private long totalTeachers;

    @JsonProperty("total_students")
    private long totalStudents;

    @JsonProperty("total_questions")
    private long totalQuestions;

    @JsonProperty("total_exams")
    private long totalExams;

    @JsonProperty("total_question_banks")
    private long totalQuestionBanks;

    // Constructor
    public StatisticsDTO(long totalClasses, long totalTeachers, long totalStudents,
                         long totalQuestions, long totalExams, long totalQuestionBanks) {
        this.totalClasses = totalClasses;
        this.totalTeachers = totalTeachers;
        this.totalStudents = totalStudents;
        this.totalQuestions = totalQuestions;
        this.totalExams = totalExams;
        this.totalQuestionBanks = totalQuestionBanks;
    }

    // Getters and Setters
    public long getTotalClasses() {
        return totalClasses;
    }

    public void setTotalClasses(long totalClasses) {
        this.totalClasses = totalClasses;
    }

    public long getTotalTeachers() {
        return totalTeachers;
    }

    public void setTotalTeachers(long totalTeachers) {
        this.totalTeachers = totalTeachers;
    }

    public long getTotalStudents() {
        return totalStudents;
    }

    public void setTotalStudents(long totalStudents) {
        this.totalStudents = totalStudents;
    }

    public long getTotalQuestions() {
        return totalQuestions;
    }

    public void setTotalQuestions(long totalQuestions) {
        this.totalQuestions = totalQuestions;
    }

    public long getTotalExams() {
        return totalExams;
    }

    public void setTotalExams(long totalExams) {
        this.totalExams = totalExams;
    }

    public long getTotalQuestionBanks() {
        return totalQuestionBanks;
    }

    public void setTotalQuestionBanks(long totalQuestionBanks) {
        this.totalQuestionBanks = totalQuestionBanks;
    }
}