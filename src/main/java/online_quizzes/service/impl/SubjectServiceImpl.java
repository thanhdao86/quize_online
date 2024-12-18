package online_quizzes.service.impl;

import online_quizzes.dto.SubjectDto;
import online_quizzes.entity.Subject;
import online_quizzes.repository.SubjectRepository;
import online_quizzes.service.SubjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class SubjectServiceImpl implements SubjectService {
    @Autowired
    private SubjectRepository subjectRepository;

    @Override
    public Long createSubject(SubjectDto subjectDto) {
        Subject subject = new Subject();
        subject.setSubjectName(subjectDto.getSubjectName());
        subject.setDescription(subjectDto.getDescription());
        subject.setCreatedAt(LocalDateTime.now());
        subject.setUpdatedAt(LocalDateTime.now());
        subject = subjectRepository.save(subject);
        return subject.getSubjectId();
    }

    @Override
    public void deleteSubject(Long subjectId) {
        if (!subjectRepository.existsById(subjectId)) {
            throw new IllegalArgumentException("Subject not found");
        }
        subjectRepository.deleteById(subjectId);
    }

    @Override
    public void updateSubject(Long subjectId, SubjectDto subjectDto) {
        Subject subject = subjectRepository.findById(subjectId)
                .orElseThrow(() -> new IllegalArgumentException("Subject not found"));

        subject.setSubjectName(subjectDto.getSubjectName());
        subject.setDescription(subjectDto.getDescription());
        subject.setUpdatedAt(LocalDateTime.now());
        subjectRepository.save(subject);
    }

    @Override
    public List<Subject> getAllSubjects() {
        return subjectRepository.findAll()
                .stream()
                .sorted((s1, s2) -> s2.getCreatedAt().compareTo(s1.getCreatedAt()))
                .toList();
    }

    @Override
    public Subject getSubjectById(Long subjectId) {
        return subjectRepository.findById(subjectId)
                .orElseThrow(() -> new IllegalArgumentException("Subject not found"));
    }
}
