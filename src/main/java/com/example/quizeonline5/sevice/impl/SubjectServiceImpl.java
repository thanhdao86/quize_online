package com.example.quizeonline5.sevice.impl;

import com.example.quizeonline5.dto.SubjectDto;
import com.example.quizeonline5.entity.Subject;
import com.example.quizeonline5.repository.SubjectRepository;
import com.example.quizeonline5.sevice.SubjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

        subjectRepository.save(subject);
    }

    @Override
    public List<Subject> getAllSubjects() {
        return subjectRepository.findAll();
    }

    @Override
    public Subject getSubjectById(Long subjectId) {
        return subjectRepository.findById(subjectId)
                .orElseThrow(() -> new IllegalArgumentException("Subject not found"));
    }
}
