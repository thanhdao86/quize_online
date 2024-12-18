package online_quizzes.service;

import online_quizzes.dto.QuestionUploadDto;

public interface QuestionUploadService {
    void uploadQuestions(QuestionUploadDto uploadDto);
}
