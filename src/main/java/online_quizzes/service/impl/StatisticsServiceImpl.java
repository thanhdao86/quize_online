package online_quizzes.service.impl;

import online_quizzes.dto.StatisticsDTO;
import online_quizzes.repository.*;
import online_quizzes.service.StatisticsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StatisticsServiceImpl implements StatisticsService {

    @Autowired
    private ClassRepository classesRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private QuestionRepository questionRepository;

    @Autowired
    private ExamRepository examRepository;

    @Autowired
    private QuestionBankRepository questionBankRepository;

    @Override
    public StatisticsDTO getSystemStatistics() {
        long totalClasses = classesRepository.count();
        long totalTeachers = userRepository.countByRole("TEACHER");
        long totalStudents = userRepository.countByRole("STUDENT");
        long totalQuestions = questionRepository.count();
        long totalExams = examRepository.count();
        long totalQuestionBanks = questionBankRepository.count();

        return new StatisticsDTO(
                totalClasses,
                totalTeachers,
                totalStudents,
                totalQuestions,
                totalExams,
                totalQuestionBanks
        );
    }
}