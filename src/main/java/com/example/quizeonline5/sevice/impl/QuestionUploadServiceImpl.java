package com.example.quizeonline5.sevice.impl;

import com.example.quizeonline5.dto.QuestionItemDto;
import com.example.quizeonline5.dto.QuestionUploadDto;
import com.example.quizeonline5.entity.Question;
import com.example.quizeonline5.entity.QuestionBank;
import com.example.quizeonline5.entity.User;
import com.example.quizeonline5.repository.QuestionBankRepository;
import com.example.quizeonline5.repository.QuestionRepository;
import com.example.quizeonline5.repository.UserRepository;
import com.example.quizeonline5.sevice.QuestionUploadService;
import com.example.quizeonline5.utils.AppConstants;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.util.JSONPObject;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.ByteArrayInputStream;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.Map;

@Service
public class QuestionUploadServiceImpl implements QuestionUploadService {

    @Autowired
    private QuestionBankRepository questionBankRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private QuestionRepository questionRepository;

    private Map<Integer, String> ENTITY_MAP = Map.of(
            1, "A",
            2, "B",
            3, "C",
            4, "D"
    );

    @Override
    public void uploadQuestions(QuestionUploadDto uploadDto) {
        // validate user
        User user = userRepository.findById(uploadDto.getUserID())
                .orElseThrow(() -> new IllegalArgumentException("User not found"));

        if (user.getRole().equals("student")) {
            throw new IllegalArgumentException("Only Admin/Teacher can upload questions");
        }

        // Get the question bank
        QuestionBank questionBank = questionBankRepository.findById(uploadDto.getQuestionBankId())
                .orElseThrow(() -> new IllegalArgumentException("Question Bank not found"));

        // Decode base64 Excel content
        byte[] decodedBytes = Base64.getDecoder().decode(uploadDto.getBase64ExcelContent());

        try (Workbook workbook = new XSSFWorkbook(new ByteArrayInputStream(decodedBytes))) {
            Sheet sheet = workbook.getSheetAt(0); // Assume the first sheet contains the questions
            for (Row row : sheet) {
                if (row.getRowNum() == 0) {
                    // Skip the header row
                    continue;
                }

                // Parse question and answer from the Excel row
                String questionContent = row.getCell(0).getStringCellValue();
                if (questionContent.isEmpty()) {
                    // Skip empty question
                    continue;
                }

                List<QuestionItemDto> questionItems = new ArrayList<>();
                for (int i = 1; i <= 4; i++) {
                    String cellValue = "";
                    if (row.getCell(i) != null) {
                        switch (row.getCell(i).getCellType()) {
                            case STRING:
                                cellValue = row.getCell(i).getStringCellValue();
                                break;
                            case NUMERIC:
                                cellValue = String.valueOf(row.getCell(i).getNumericCellValue());
                                break;
                            case BOOLEAN:
                                cellValue = String.valueOf(row.getCell(i).getBooleanCellValue());
                                break;
                            case FORMULA:
                                cellValue = row.getCell(i).getCellFormula();
                                break;
                            default:
                                cellValue = "";
                        }
                    }
                    questionItems.add(new QuestionItemDto(ENTITY_MAP.get(i), cellValue));
                }

                ObjectMapper objectMapper = new ObjectMapper();
                String questionItemsJson = objectMapper.writeValueAsString(questionItems);

                String correctAnswer = row.getCell(5).getStringCellValue();

                // Create and save the question
                Question question = new Question();
                question.setQuestionContent(questionContent);
                question.setAnswer(questionItemsJson);
                question.setCorrectAnswer(correctAnswer);
                question.setQuestionBank(questionBank);
                question.setCreatedAt(java.time.LocalDateTime.now());
                question.setUpdatedAt(java.time.LocalDateTime.now());

                questionRepository.save(question);
            }
        } catch (Exception e) {
            throw new RuntimeException("Failed to parse Excel file: " + e.getMessage(), e);
        }
    }
}
