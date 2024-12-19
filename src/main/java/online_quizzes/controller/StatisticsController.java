package online_quizzes.controller;

import online_quizzes.dto.CommonResponse;
import online_quizzes.dto.StatisticsDTO;
import online_quizzes.service.StatisticsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/statistics")
public class StatisticsController {

    @Autowired
    private StatisticsService statisticsService;

    @GetMapping
    public ResponseEntity<CommonResponse> getSystemStatistics() {
        StatisticsDTO statistics = statisticsService.getSystemStatistics();
        return new ResponseEntity< >(CommonResponse.success(statistics), HttpStatus.OK);
    }
}