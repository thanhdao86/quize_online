package online_quizzes.service.impl;


import online_quizzes.entity.ClassStudent;
import online_quizzes.entity.Classes;
import online_quizzes.exception.ResourceNotFoundException;
import online_quizzes.repository.ClassRepository;
import online_quizzes.repository.ClassStudentRepository;
import online_quizzes.repository.SubjectRepository;
import online_quizzes.repository.UserRepository;
import online_quizzes.service.ClassStudentService;
import online_quizzes.utils.AppConstants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ClassStudentServiceImpl implements ClassStudentService {
    @Autowired
    private ClassStudentRepository classStudentRepository;

    @Autowired
    private ClassRepository classRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private SubjectRepository subjectRepository;

    @Override
    public void deleteMappingByClassId(Long classId) {
        Classes classes = classRepository.findById(classId).orElseThrow(() -> new ResourceNotFoundException(AppConstants.CLASSES, AppConstants.ID, classId));
        if (classes == null) {
            throw new IllegalArgumentException("Classs not found");
        }

        List<ClassStudent> classStudents = classStudentRepository.findByClassEntityIs(classes);
        if (classStudents == null) {
            throw new IllegalArgumentException("Subject not found");
        }
        for (ClassStudent classStudent : classStudents) {
            classStudentRepository.delete(classStudent);
        }
    }
}
