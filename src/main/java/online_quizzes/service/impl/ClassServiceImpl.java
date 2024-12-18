package online_quizzes.service.impl;


import online_quizzes.dto.*;
import online_quizzes.entity.ClassStudent;
import online_quizzes.entity.Classes;
import online_quizzes.entity.Subject;
import online_quizzes.entity.User;
import online_quizzes.exception.ResourceNotFoundException;
import online_quizzes.repository.ClassRepository;
import online_quizzes.repository.ClassStudentRepository;
import online_quizzes.repository.SubjectRepository;
import online_quizzes.repository.UserRepository;
import online_quizzes.service.ClassService;
import online_quizzes.utils.AppConstants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.*;
import java.util.stream.Collectors;

@Service
public class ClassServiceImpl implements ClassService {
    @Autowired
    private ClassRepository classRepository;

    @Autowired
    private ClassStudentRepository classStudentRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private SubjectRepository subjectRepository;

    @Override
    public ApiResponse createClass(ClassDto classDto) {

        if (classDto.getTeacherId() == null) {
            throw new IllegalArgumentException("Teacher ID must not be null");
        }
        if (classDto.getSubjectId() == null) {
            throw new IllegalArgumentException("Subject ID must not be null");
        }
        User teacher = userRepository.findById(classDto.getTeacherId())
                .orElseThrow(() -> new IllegalArgumentException("Teacher not found"));

        Subject subject = subjectRepository.findById(classDto.getSubjectId())
                .orElseThrow(() -> new IllegalArgumentException("Subject not found"));

        Classes classEntity = new Classes();
        classEntity.setClassName(classDto.getClassName());
        classEntity.setTeacher(teacher);
        classEntity.setSubject(subject);
        classEntity.setCreatedAt(LocalDateTime.now());
        classEntity.setUpdatedAt(LocalDateTime.now());
        Long id =  classRepository.save(classEntity).getClassId();
        if (id != null) {
            return new ApiResponse(true, "Class created successfully with ID: " + id);
        } else {
            return new ApiResponse(false, "Class not created");
        }
    }

    @Override
    public ApiResponse deleteClass(Long classId) {
        Classes classes = classRepository.findById(classId).orElseThrow(() -> new ResourceNotFoundException(AppConstants.CLASSES, AppConstants.ID, classId));
        if (classes == null) {
            return new ApiResponse(Boolean.FALSE, "Class not found");
        }
        classRepository.deleteById(classId);
        return new ApiResponse(Boolean.TRUE, "Class deleted successfully");
    }

    @Override
    public ApiResponse updateClass(Long classId, ClassDto classDto) {
        Classes classEntity = classRepository.findById(classId)
                .orElseThrow(() -> new IllegalArgumentException("Class not found"));

        User teacher = userRepository.findById(classDto.getTeacherId())
                .orElseThrow(() -> new IllegalArgumentException("Teacher not found"));

        Subject subject = subjectRepository.findById(classDto.getSubjectId())
                .orElseThrow(() -> new IllegalArgumentException("Subject not found"));

        classEntity.setClassName(classDto.getClassName());
        classEntity.setTeacher(teacher);
        classEntity.setUpdatedAt(java.time.LocalDateTime.now());
        classEntity.setSubject(subject);
        classRepository.save(classEntity);

        // clear all students in class
        List<ClassStudent> classStudents = classStudentRepository.findByClassEntityIs(classEntity);
        if (classStudents != null) {
            for (ClassStudent classStudent : classStudents) {
                classStudentRepository.delete(classStudent);
            }
        }

        // add new students to class
        if (classDto.getStudents() != null) {
            for (StudentDto std : classDto.getStudents()) {
                Optional student = userRepository.findById(std.getStudentId());
                if (student.isPresent()) {
                    ClassStudent classStudent = new ClassStudent();
                    classStudent.setClassEntity(classEntity);
                    classStudent.setStudent((User) student.get());
                    classStudentRepository.save(classStudent);
                }
            }
        }
        return new ApiResponse(Boolean.TRUE, "Update class success");
    }

    @Override
    public List<Map<String, Object>> getAllClasses() {
        return classRepository.findAll().stream().map(classEntity -> {
            Map<String, Object> map = new HashMap<>();
            map.put("class_id", classEntity.getClassId());
            map.put("class_name", classEntity.getClassName());
            map.put("subject_id", classEntity.getSubject().getSubjectId());
            map.put("subject_name", classEntity.getSubject().getSubjectName());
            map.put("teacher_id", classEntity.getTeacher().getUserId());
            map.put("teacher_name", classEntity.getTeacher().getFullName());
            return map;
        }).collect(Collectors.toList());
    }

    @Override
    public List<Map<String, Object>> getStudentsInClass(Long classId) {
        Classes classEntity = classRepository.findById(classId)
                .orElseThrow(() -> new IllegalArgumentException("Class not found"));

        return classEntity.getStudents().stream().map(classStudent -> {
            Map<String, Object> map = new HashMap<>();
            map.put("student_id", classStudent.getUserId());
            map.put("full_name", classStudent.getFullName());
            map.put("email", classStudent.getEmail());
            return map;
        }).collect(Collectors.toList());
    }

    @Override
    public Map<String, Object> getTeacherInClass(Long classId) {
        Classes classEntity = classRepository.findById(classId)
                .orElseThrow(() -> new IllegalArgumentException("Class not found"));

        User teacher = classEntity.getTeacher();
        return Map.of(
                "teacher_id", teacher.getUserId(),
                "full_name", teacher.getFullName(),
                "email", teacher.getEmail(),
                "subject_name", classEntity.getSubject().getSubjectName()
        );
    }

    @Override
    public List<Map<String, Object>> getClassesByTeacher(Long teacherId) {
        User teacher = userRepository.findById(teacherId)
                .orElseThrow(() -> new IllegalArgumentException("Teacher not found"));

        List<Classes> classes = classRepository.findByTeacher(teacher);

        return classes.stream().map(classEntity -> {
            Map<String, Object> map = new HashMap<>();

            // get all student in class
            List<Map<String, Object>> students = classEntity.getStudents().stream().map(classStudent -> {
                Map<String, Object> studentMap = new HashMap<>();
                studentMap.put("student_id", classStudent.getUserId());
                studentMap.put("full_name", classStudent.getFullName());
                studentMap.put("email", classStudent.getEmail());
                return studentMap;
            }).collect(Collectors.toList());

            map.put("class_id", classEntity.getClassId());
            map.put("class_name", classEntity.getClassName());
            map.put("subject_id", classEntity.getSubject().getSubjectId());
            map.put("subject_name", classEntity.getSubject().getSubjectName());
            map.put("students", students);
            return map;
        }).collect(Collectors.toList());
    }

    @Override
    public ClassDto getClassById(Long classId) {
        Classes classEntity = classRepository.findById(classId)
                .orElseThrow(() -> new IllegalArgumentException("Class not found"));

        ClassDto classDto = new ClassDto();
        classDto.setClassId(classEntity.getClassId());
        classDto.setClassName(classEntity.getClassName());

        // Map teacher
        UserDto teacherDto = new UserDto();
        teacherDto.setUserId(classEntity.getTeacher().getUserId());
        teacherDto.setFullName(classEntity.getTeacher().getFullName());
        teacherDto.setEmail(classEntity.getTeacher().getEmail());
        classDto.setTeacher(teacherDto);

        // Map subject
        SubjectDto subjectDto = new SubjectDto();
        subjectDto.setSubjectId(classEntity.getSubject().getSubjectId());
        subjectDto.setSubjectName(classEntity.getSubject().getSubjectName());
        classDto.setSubject(subjectDto);

        // Map students carefully
        List<StudentDto> studentDtos = classEntity.getStudents().stream()
                .map(student -> {
                    StudentDto studentDto = new StudentDto();
                    studentDto.setStudentId(student.getUserId());
                    studentDto.setFullName(student.getFullName());
                    studentDto.setEmail(student.getEmail());
                    return studentDto;
                })
                .collect(Collectors.toList());

        classDto.setStudents(studentDtos);
        classDto.setCreatedAt(classEntity.getCreatedAt());
        classDto.setSubjectId(classEntity.getSubject().getSubjectId());
        classDto.setTeacherId(classEntity.getTeacher().getUserId());

        return classDto;
    }

    @Override
    public ApiResponse addStudentToClass(Long classId, StudentDto studentDto) {
        Classes classEntity = classRepository.findById(classId)
                .orElseThrow(() -> new ResourceNotFoundException(AppConstants.CLASSES, AppConstants.ID, classId));

        User student = userRepository.findById(studentDto.getStudentId())
                .orElseThrow(() -> new ResourceNotFoundException(AppConstants.USER, AppConstants.ID, studentDto.getStudentId()));

        classEntity.getStudents().add(student);
        classRepository.save(classEntity);

        return new ApiResponse(true, "Student added to class successfully");
    }

    @Override
    public List<ClassDto> getEnrolledClassByStudent(Long studentId) {
        User student = userRepository.findById(studentId)
                .orElseThrow(() -> new IllegalArgumentException("Student not found"));

        List<Classes> availableClasses = classRepository.findAll().stream()
                .filter(classEntity -> classEntity.getStudents().contains(student))
                .collect(Collectors.toList());

        return availableClasses.stream()
                .map(classEntity -> {
                    ClassDto classDto = new ClassDto();
                    classDto.setClassId(classEntity.getClassId());
                    classDto.setClassName(classEntity.getClassName());
                    classDto.setSubjectId(classEntity.getSubject().getSubjectId());
                    classDto.setCreatedAt(classEntity.getCreatedAt());

                    UserDto userDto = new UserDto();
                    userDto.setUserId(classEntity.getTeacher().getUserId());
                    userDto.setFullName(classEntity.getTeacher().getFullName());
                    userDto.setEmail(classEntity.getTeacher().getEmail());
                    classDto.setTeacher(userDto);

                    SubjectDto subjectDto = new SubjectDto();
                    subjectDto.setSubjectName(classEntity.getSubject().getSubjectName());
                    subjectDto.setDescription(classEntity.getSubject().getDescription());
                    classDto.setSubject(subjectDto);
                    return classDto;
                })
                .collect(Collectors.toList());
    }
}
