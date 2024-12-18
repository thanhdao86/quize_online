/*
 Navicat Premium Data Transfer

 Source Server         : LocalHost
 Source Server Type    : MySQL
 Source Server Version : 80039 (8.0.39)
 Source Host           : 127.0.0.1:3306
 Source Schema         : quize_online

 Target Server Type    : MySQL
 Target Server Version : 80039 (8.0.39)
 File Encoding         : 65001

 Date: 17/12/2024 22:26:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for class_students
-- ----------------------------
DROP TABLE IF EXISTS `class_students`;
CREATE TABLE `class_students` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `class_id` bigint NOT NULL,
  `student_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKjuh9br5vimkw71ko8qyswp3ci` (`class_id`),
  KEY `FKi67hsuppqm0qnfgn2x8d7v2lj` (`student_id`),
  CONSTRAINT `FKi67hsuppqm0qnfgn2x8d7v2lj` FOREIGN KEY (`student_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `FKjuh9br5vimkw71ko8qyswp3ci` FOREIGN KEY (`class_id`) REFERENCES `classes` (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of class_students
-- ----------------------------
BEGIN;
INSERT INTO `class_students` (`id`, `class_id`, `student_id`) VALUES (34, 1, 15);
INSERT INTO `class_students` (`id`, `class_id`, `student_id`) VALUES (35, 1, 14);
INSERT INTO `class_students` (`id`, `class_id`, `student_id`) VALUES (36, 1, 16);
INSERT INTO `class_students` (`id`, `class_id`, `student_id`) VALUES (38, 3, 16);
INSERT INTO `class_students` (`id`, `class_id`, `student_id`) VALUES (39, 6, 18);
INSERT INTO `class_students` (`id`, `class_id`, `student_id`) VALUES (40, 6, 20);
INSERT INTO `class_students` (`id`, `class_id`, `student_id`) VALUES (41, 2, 16);
COMMIT;

-- ----------------------------
-- Table structure for classes
-- ----------------------------
DROP TABLE IF EXISTS `classes`;
CREATE TABLE `classes` (
  `class_id` bigint NOT NULL AUTO_INCREMENT,
  `class_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `subject_id` bigint NOT NULL,
  `teacher_id` bigint NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`class_id`),
  KEY `FK4tv5efpqhlo8xg8l8dpba8v75` (`teacher_id`),
  KEY `fk21232` (`subject_id`),
  CONSTRAINT `fk21232` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK4tv5efpqhlo8xg8l8dpba8v75` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of classes
-- ----------------------------
BEGIN;
INSERT INTO `classes` (`class_id`, `class_name`, `subject_id`, `teacher_id`, `created_at`, `updated_at`) VALUES (1, '11A1 222B', 6, 17, '2024-12-15 21:00:36', '2024-12-16 22:27:10');
INSERT INTO `classes` (`class_id`, `class_name`, `subject_id`, `teacher_id`, `created_at`, `updated_at`) VALUES (2, '11A2', 3, 21, '2024-12-15 21:13:18', '2024-12-17 20:11:32');
INSERT INTO `classes` (`class_id`, `class_name`, `subject_id`, `teacher_id`, `created_at`, `updated_at`) VALUES (3, '11A3', 4, 10, '2024-12-15 21:13:25', '2024-12-16 22:27:19');
INSERT INTO `classes` (`class_id`, `class_name`, `subject_id`, `teacher_id`, `created_at`, `updated_at`) VALUES (4, '12B2', 1, 10, '2024-12-16 22:07:11', '2024-12-16 22:07:11');
INSERT INTO `classes` (`class_id`, `class_name`, `subject_id`, `teacher_id`, `created_at`, `updated_at`) VALUES (5, 'Lop Moi toanh 123123', 4, 10, '2024-12-16 22:16:56', '2024-12-16 22:26:59');
INSERT INTO `classes` (`class_id`, `class_name`, `subject_id`, `teacher_id`, `created_at`, `updated_at`) VALUES (6, 'Hoa dai cuong 1', 8, 19, '2024-12-16 22:46:06', '2024-12-16 22:49:23');
COMMIT;

-- ----------------------------
-- Table structure for exam_questions
-- ----------------------------
DROP TABLE IF EXISTS `exam_questions`;
CREATE TABLE `exam_questions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `exam_id` bigint NOT NULL,
  `question_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5cd6sjmccb11rrwpyabyc81c0` (`exam_id`),
  KEY `FKs0t1710in6q97whp93ggrs1wg` (`question_id`),
  CONSTRAINT `FK5cd6sjmccb11rrwpyabyc81c0` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`exam_id`),
  CONSTRAINT `FKs0t1710in6q97whp93ggrs1wg` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of exam_questions
-- ----------------------------
BEGIN;
INSERT INTO `exam_questions` (`id`, `exam_id`, `question_id`) VALUES (42, 3, 83);
INSERT INTO `exam_questions` (`id`, `exam_id`, `question_id`) VALUES (43, 3, 84);
COMMIT;

-- ----------------------------
-- Table structure for exams
-- ----------------------------
DROP TABLE IF EXISTS `exams`;
CREATE TABLE `exams` (
  `exam_id` bigint NOT NULL AUTO_INCREMENT,
  `exam_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `subject_id` bigint NOT NULL,
  `class_id` bigint NOT NULL,
  `created_by` bigint NOT NULL,
  `duration` int DEFAULT NULL COMMENT 'MINUTES',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`exam_id`),
  KEY `FKkq9895f263nw6qxibikek0t40` (`class_id`),
  KEY `FKa9pp7fvh0i6302peis1x76ots` (`created_by`),
  KEY `FK3312` (`subject_id`),
  CONSTRAINT `FK3312` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKa9pp7fvh0i6302peis1x76ots` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `FKkq9895f263nw6qxibikek0t40` FOREIGN KEY (`class_id`) REFERENCES `classes` (`class_id`),
  CONSTRAINT `FKopre4n7j7fpxqbtbwpv8ywn1y` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of exams
-- ----------------------------
BEGIN;
INSERT INTO `exams` (`exam_id`, `exam_name`, `subject_id`, `class_id`, `created_by`, `duration`, `created_at`, `updated_at`) VALUES (1, 'exam 12', 3, 2, 6, 1, '2024-12-15 21:27:43', '2024-12-17 20:24:37');
INSERT INTO `exams` (`exam_id`, `exam_name`, `subject_id`, `class_id`, `created_by`, `duration`, `created_at`, `updated_at`) VALUES (2, 'Bai thi 1', 4, 1, 6, 30, '2024-12-15 22:10:45', '2024-12-16 19:59:59');
INSERT INTO `exams` (`exam_id`, `exam_name`, `subject_id`, `class_id`, `created_by`, `duration`, `created_at`, `updated_at`) VALUES (3, 'TK Exam', 9, 2, 6, 30, '2024-12-16 22:51:47', '2024-12-17 20:18:18');
INSERT INTO `exams` (`exam_id`, `exam_name`, `subject_id`, `class_id`, `created_by`, `duration`, `created_at`, `updated_at`) VALUES (4, 'Kiem tra hoa', 8, 6, 6, 1, '2024-12-16 22:55:56', '2024-12-16 22:58:18');
COMMIT;

-- ----------------------------
-- Table structure for question_banks
-- ----------------------------
DROP TABLE IF EXISTS `question_banks`;
CREATE TABLE `question_banks` (
  `question_bank_id` bigint NOT NULL AUTO_INCREMENT,
  `bank_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `is_public` bit(1) DEFAULT NULL,
  `created_by` bigint NOT NULL,
  PRIMARY KEY (`question_bank_id`),
  KEY `FKaoc8pganxt0sge51oqvc5oqcp` (`created_by`),
  CONSTRAINT `FKaoc8pganxt0sge51oqvc5oqcp` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of question_banks
-- ----------------------------
BEGIN;
INSERT INTO `question_banks` (`question_bank_id`, `bank_name`, `created_at`, `is_public`, `created_by`) VALUES (1, 'Ngân hàng câu hỏi Toán', '2024-12-14 17:11:18.936110', b'1', 6);
INSERT INTO `question_banks` (`question_bank_id`, `bank_name`, `created_at`, `is_public`, `created_by`) VALUES (2, 'Ngân hàng câu hỏi Văn', '2024-12-14 17:13:40.807487', b'1', 6);
INSERT INTO `question_banks` (`question_bank_id`, `bank_name`, `created_at`, `is_public`, `created_by`) VALUES (3, 'Ngân hàng câu hỏi địa', '2024-12-14 17:21:02.517431', b'1', 6);
INSERT INTO `question_banks` (`question_bank_id`, `bank_name`, `created_at`, `is_public`, `created_by`) VALUES (4, 'niu', '2024-12-15 21:01:20.754973', b'0', 6);
INSERT INTO `question_banks` (`question_bank_id`, `bank_name`, `created_at`, `is_public`, `created_by`) VALUES (7, 'Ngân hàng câu hỏi Hoá', '2024-12-16 22:46:31.246793', b'0', 6);
INSERT INTO `question_banks` (`question_bank_id`, `bank_name`, `created_at`, `is_public`, `created_by`) VALUES (8, 'Teacher BANK', '2024-12-17 20:06:53.301539', b'0', 21);
COMMIT;

-- ----------------------------
-- Table structure for questions
-- ----------------------------
DROP TABLE IF EXISTS `questions`;
CREATE TABLE `questions` (
  `question_id` bigint NOT NULL AUTO_INCREMENT,
  `question_content` text COLLATE utf8mb4_general_ci,
  `answer` text COLLATE utf8mb4_general_ci NOT NULL,
  `correct_answer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `question_bank_id` bigint NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`question_id`) USING BTREE,
  KEY `FK001` (`question_bank_id`),
  CONSTRAINT `FK001` FOREIGN KEY (`question_bank_id`) REFERENCES `question_banks` (`question_bank_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of questions
-- ----------------------------
BEGIN;
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (34, 'When I last saw him, he _____ in London.', '[{\"key\":\"A\",\"value\":\"has lived\"},{\"key\":\"B\",\"value\":\"is living\"},{\"key\":\"C\",\"value\":\"was living\"},{\"key\":\"D\",\"value\":\"has been living\"}]', 'C', 7, '2024-12-17 00:10:54', '2024-12-17 00:10:54');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (35, 'We _______ Dorothy since last Saturday.', '[{\"key\":\"A\",\"value\":\"don’t see\"},{\"key\":\"B\",\"value\":\"haven’t seen\"},{\"key\":\"C\",\"value\":\"didn’t see\"},{\"key\":\"D\",\"value\":\"hadn’t seen\"}]', 'B', 7, '2024-12-17 00:12:02', '2024-12-17 00:12:02');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (36, 'The train ______ half an hour ago.', '[{\"key\":\"A\",\"value\":\"has been leaving\"},{\"key\":\"B\",\"value\":\"left\"},{\"key\":\"C\",\"value\":\"has left\"},{\"key\":\"D\",\"value\":\"had left\"}]', 'B', 7, '2024-12-17 00:12:10', '2024-12-17 00:12:10');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (37, 'Jack ______ the door.', '[{\"key\":\"A\",\"value\":\"has just painted\"},{\"key\":\"B\",\"value\":\"paint\"},{\"key\":\"C\",\"value\":\"will have painted\"},{\"key\":\"D\",\"value\":\"painting\"}]', 'A', 7, '2024-12-17 00:12:10', '2024-12-17 00:12:10');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (38, 'My sister ________ for you since yesterday', '[{\"key\":\"A\",\"value\":\"is looking\"},{\"key\":\"B\",\"value\":\"was looking\"},{\"key\":\"C\",\"value\":\"has been looking\"},{\"key\":\"D\",\"value\":\"looked\"}]', 'C', 7, '2024-12-17 00:12:10', '2024-12-17 00:12:10');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (39, 'I ______ Texas State University now', '[{\"key\":\"A\",\"value\":\"am attending\"},{\"key\":\"B\",\"value\":\"attend\"},{\"key\":\"C\",\"value\":\"was attending\"},{\"key\":\"D\",\"value\":\"attended\"}]', 'A', 7, '2024-12-17 00:12:10', '2024-12-17 00:12:10');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (40, 'He has been selling motorbikes ________', '[{\"key\":\"A\",\"value\":\"ten years ago\"},{\"key\":\"B\",\"value\":\"since ten years\"},{\"key\":\"C\",\"value\":\"for ten years ago\"},{\"key\":\"D\",\"value\":\"for ten years\"}]', 'D', 7, '2024-12-17 00:12:10', '2024-12-17 00:12:10');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (41, 'Christopher Columbus _______ American more than 500 years ago', '[{\"key\":\"A\",\"value\":\"discovered\"},{\"key\":\"B\",\"value\":\"has discovered\"},{\"key\":\"C\",\"value\":\"had discovered\"},{\"key\":\"D\",\"value\":\"had been discovering\"}]', 'A', 7, '2024-12-17 00:12:10', '2024-12-17 00:12:10');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (42, 'He fell down when he ______ towards the church', '[{\"key\":\"A\",\"value\":\"run\"},{\"key\":\"B\",\"value\":\"runs\"},{\"key\":\"C\",\"value\":\"was running\"},{\"key\":\"D\",\"value\":\"had run\"}]', 'C', 7, '2024-12-17 00:12:10', '2024-12-17 00:12:10');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (43, 'We _______ there when our father died', '[{\"key\":\"A\",\"value\":\"still lived\"},{\"key\":\"B\",\"value\":\"lived still\"},{\"key\":\"C\",\"value\":\"was still lived\"},{\"key\":\"D\",\"value\":\"was still living\"}]', 'A', 7, '2024-12-17 00:12:10', '2024-12-17 00:12:10');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (44, 'They ______ table tennis when their father comes back home', '[{\"key\":\"A\",\"value\":\"will play\"},{\"key\":\"B\",\"value\":\"will be playing\"},{\"key\":\"C\",\"value\":\"play\"},{\"key\":\"D\",\"value\":\"would play\"}]', 'B', 7, '2024-12-17 00:12:10', '2024-12-17 00:12:10');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (45, 'By Christmas, I _______ for Mr. Smith for six years', '[{\"key\":\"A\",\"value\":\"will have been working\"},{\"key\":\"B\",\"value\":\"will work\"},{\"key\":\"C\",\"value\":\"have been working\"},{\"key\":\"D\",\"value\":\"will be working\"}]', 'A', 7, '2024-12-17 00:12:10', '2024-12-17 00:12:10');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (46, 'I _______ in the room right now', '[{\"key\":\"A\",\"value\":\"am being\"},{\"key\":\"B\",\"value\":\"was being\"},{\"key\":\"C\",\"value\":\"have been being\"},{\"key\":\"D\",\"value\":\"am\"}]', 'D', 7, '2024-12-17 00:12:10', '2024-12-17 00:12:10');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (47, 'I ______ to New York three times this year', '[{\"key\":\"A\",\"value\":\"have been\"},{\"key\":\"B\",\"value\":\"was\"},{\"key\":\"C\",\"value\":\"were\"},{\"key\":\"D\",\"value\":\"had been\"}]', 'A', 7, '2024-12-17 00:12:10', '2024-12-17 00:12:10');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (48, 'I’ll come and see you before I _______ for the States', '[{\"key\":\"A\",\"value\":\"leave\"},{\"key\":\"B\",\"value\":\"will leave\"},{\"key\":\"C\",\"value\":\"have left\"},{\"key\":\"D\",\"value\":\"shall leave\"}]', 'A', 7, '2024-12-17 00:12:10', '2024-12-17 00:12:10');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (49, '1 + 1 = ?', '[{\"key\":\"A\",\"value\":\"2\"},{\"key\":\"B\",\"value\":\"3\"},{\"key\":\"C\",\"value\":\"4\"},{\"key\":\"D\",\"value\":\"1\"}]', 'A', 1, '2024-12-17 19:42:32', '2024-12-17 19:42:32');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (56, 'HOHOHOHOHO', '[{\"key\":\"A\",\"value\":\"AB\"},{\"key\":\"B\",\"value\":\"AC\"},{\"key\":\"C\",\"value\":\"AD\"},{\"key\":\"D\",\"value\":\"AE\"}]', 'C', 1, '2024-12-17 19:59:42', '2024-12-17 19:59:42');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (57, 'Phát triển không bền vững là gì?', '[{\"key\":\"A\",\"value\":\"Sự tăng trưởng kinh tế không cùng nhịp với tiến bộ và sự phát triển xã hội.\"},{\"key\":\"B\",\"value\":\" Sự tăng trưởng kinh tế không cùng nhịp với tiến bộ và sự phát triển giáo dục.\"},{\"key\":\"C\",\"value\":\"Sự tăng trưởng không cùng nhịp giữa giáo dục, xã hội và môi trường.\"},{\"key\":\"D\",\"value\":\"Sự tăng trưởng không đồng đều giữa môi trường và xã hội.\"}]', 'A', 1, '2024-12-17 20:00:02', '2024-12-17 20:00:02');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (58, 'Phát triển không bền vững về xã hội là gì?', '[{\"key\":\"A\",\"value\":\"Tăng trưởng kinh tế nhưng không có sự tiến bộ và công bằng xã hội; văn hóa, đạo đức bị suy đồi; sự phân hóa giàu nghèo dẫn tới sự bất ổn trong xã hội.\"},{\"key\":\"B\",\"value\":\" Tăng trưởng kinh tế nhưng không có sự tiến bộ văn hóa và công bằng xã hội, môi trường, dẫn đến sự phân hóa giàu nghèo dẫn tới sự bất ổn trong xã hội.\"},{\"key\":\"C\",\"value\":\"Tăng trưởng kinh tế nhưng không có sự tiến bộ văn hóa, đạo đức bị suy đồi, phân hóa giàu nghèo dẫn tới sự bất ổn trong xã hội.\"},{\"key\":\"D\",\"value\":\" Tăng trưởng kinh tế nhưng không có sự tiến bộ và công bằng xã hội dẫn đến sự phân hóa giàu nghèo dẫn tới sự bất ổn trong xã hội.\"}]', 'A', 1, '2024-12-17 20:00:02', '2024-12-17 20:00:02');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (59, 'Khái niệm phát triển bền vững do Uỷ ban Liên hợp quốc về Môi trường và Phát triển (UNCED) đưa ra năm 1987 là?', '[{\"key\":\"A\",\"value\":\" Phát triển bền vững thoả mãn lợi ích của hiện tại nhưng không làm giảm lợi ích của thế hệ sau.\"},{\"key\":\"B\",\"value\":\"    Phát triển bền vững thoả mãn những nhu cầu của hiện tại nhưng không làm giảm lợi ích của các thế hệ mai sau.\"},{\"key\":\"C\",\"value\":\"Phát triển bền vững thoả mãn những nhu cầu của hiện tại nhưng không làm giảm khả năng thoả mãn nhu cầu của các thế hệ mai sau.\"},{\"key\":\"D\",\"value\":\"Phát triển bền vững thoả mãn những nhu cầu kinh tế, xã hội hiện tại nhưng không làm giảm khả nhu cầu kinh tế, xã hội của các thế hệ mai sau.\"}]', 'C', 1, '2024-12-17 20:00:02', '2024-12-17 20:00:02');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (60, 'Mô hình phát triển bền vững là?', '[{\"key\":\"A\",\"value\":\"Sự hoà nhập, đan xen và thoả hiệp của ba hệ thống tương tác lẫn nhau là kinh tế, xã hội và môi trường.\"},{\"key\":\"B\",\"value\":\"Sự hoà nhập, đan xen, thoả hiệp, tương tác giữa hai hệ thống kinh tế và môi trường.\"},{\"key\":\"C\",\"value\":\"  Sự hoà nhập, đan xen, thoả hiệp, tương tác giữa hai hệ thống kinh tế và xã hội.\"},{\"key\":\"D\",\"value\":\"Sự hoà nhập, đan xen và thoả hiệp của ba hệ thống tương tác lẫn nhau là kinh tế, văn hóa, xã hội.\"}]', 'A', 1, '2024-12-17 20:00:02', '2024-12-17 20:00:02');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (61, 'Phát triển bền vững về kinh tế là gì?', '[{\"key\":\"A\",\"value\":\" Phát triển nhanh và toàn diện.\"},{\"key\":\"B\",\"value\":\"Phát triển chất lượng và toàn diện. \"},{\"key\":\"C\",\"value\":\" Phát triển nhanh an toàn và chất lượng. \"},{\"key\":\"D\",\"value\":\"Phát triển an toàn và chất lượng\"}]', 'C', 1, '2024-12-17 20:00:02', '2024-12-17 20:00:02');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (62, 'Phát triển bền vững về môi trường là gì?', '[{\"key\":\"A\",\"value\":\" Sự cân bằng giữa sử dụng các yếu tố tự nhiên, nhân tạo, chất lượng môi trường sống của con người phải được bảo đảm. \"},{\"key\":\"B\",\"value\":\" Duy trì sự cân bằng giữa việc phát triển kinh tế, khai thác tài nguyên thiên nhiên và bảo vệ môi trường.\"},{\"key\":\"C\",\"value\":\" Duy trì sự khai thác nguồn tài nguyên thiên nhiên phục vụ lợi ích con người, phát triển kinh tế.\"},{\"key\":\"D\",\"value\":\" Duy trì sự cân bằng giữa bảo vệ môi trường tự nhiên với sự khai thác nguồn tài nguyên thiên nhiên phục vụ lợi ích con người.\"}]', 'D', 1, '2024-12-17 20:00:02', '2024-12-17 20:00:02');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (63, 'Phát triển không bền vững là gì?', '[{\"key\":\"A\",\"value\":\"Sự tăng trưởng kinh tế không cùng nhịp với tiến bộ và sự phát triển xã hội.\"},{\"key\":\"B\",\"value\":\" Sự tăng trưởng kinh tế không cùng nhịp với tiến bộ và sự phát triển giáo dục.\"},{\"key\":\"C\",\"value\":\"Sự tăng trưởng không cùng nhịp giữa giáo dục, xã hội và môi trường.\"},{\"key\":\"D\",\"value\":\"Sự tăng trưởng không đồng đều giữa môi trường và xã hội.\"}]', 'A', 1, '2024-12-17 20:05:40', '2024-12-17 20:05:40');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (64, 'Phát triển không bền vững về xã hội là gì?', '[{\"key\":\"A\",\"value\":\"Tăng trưởng kinh tế nhưng không có sự tiến bộ và công bằng xã hội; văn hóa, đạo đức bị suy đồi; sự phân hóa giàu nghèo dẫn tới sự bất ổn trong xã hội.\"},{\"key\":\"B\",\"value\":\" Tăng trưởng kinh tế nhưng không có sự tiến bộ văn hóa và công bằng xã hội, môi trường, dẫn đến sự phân hóa giàu nghèo dẫn tới sự bất ổn trong xã hội.\"},{\"key\":\"C\",\"value\":\"Tăng trưởng kinh tế nhưng không có sự tiến bộ văn hóa, đạo đức bị suy đồi, phân hóa giàu nghèo dẫn tới sự bất ổn trong xã hội.\"},{\"key\":\"D\",\"value\":\" Tăng trưởng kinh tế nhưng không có sự tiến bộ và công bằng xã hội dẫn đến sự phân hóa giàu nghèo dẫn tới sự bất ổn trong xã hội.\"}]', 'A', 1, '2024-12-17 20:05:40', '2024-12-17 20:05:40');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (65, 'Khái niệm phát triển bền vững do Uỷ ban Liên hợp quốc về Môi trường và Phát triển (UNCED) đưa ra năm 1987 là?', '[{\"key\":\"A\",\"value\":\" Phát triển bền vững thoả mãn lợi ích của hiện tại nhưng không làm giảm lợi ích của thế hệ sau.\"},{\"key\":\"B\",\"value\":\"    Phát triển bền vững thoả mãn những nhu cầu của hiện tại nhưng không làm giảm lợi ích của các thế hệ mai sau.\"},{\"key\":\"C\",\"value\":\"Phát triển bền vững thoả mãn những nhu cầu của hiện tại nhưng không làm giảm khả năng thoả mãn nhu cầu của các thế hệ mai sau.\"},{\"key\":\"D\",\"value\":\"Phát triển bền vững thoả mãn những nhu cầu kinh tế, xã hội hiện tại nhưng không làm giảm khả nhu cầu kinh tế, xã hội của các thế hệ mai sau.\"}]', 'C', 1, '2024-12-17 20:05:40', '2024-12-17 20:05:40');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (66, 'Mô hình phát triển bền vững là?', '[{\"key\":\"A\",\"value\":\"Sự hoà nhập, đan xen và thoả hiệp của ba hệ thống tương tác lẫn nhau là kinh tế, xã hội và môi trường.\"},{\"key\":\"B\",\"value\":\"Sự hoà nhập, đan xen, thoả hiệp, tương tác giữa hai hệ thống kinh tế và môi trường.\"},{\"key\":\"C\",\"value\":\"  Sự hoà nhập, đan xen, thoả hiệp, tương tác giữa hai hệ thống kinh tế và xã hội.\"},{\"key\":\"D\",\"value\":\"Sự hoà nhập, đan xen và thoả hiệp của ba hệ thống tương tác lẫn nhau là kinh tế, văn hóa, xã hội.\"}]', 'A', 1, '2024-12-17 20:05:40', '2024-12-17 20:05:40');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (67, 'Phát triển bền vững về kinh tế là gì?', '[{\"key\":\"A\",\"value\":\" Phát triển nhanh và toàn diện.\"},{\"key\":\"B\",\"value\":\"Phát triển chất lượng và toàn diện. \"},{\"key\":\"C\",\"value\":\" Phát triển nhanh an toàn và chất lượng. \"},{\"key\":\"D\",\"value\":\"Phát triển an toàn và chất lượng\"}]', 'C', 1, '2024-12-17 20:05:40', '2024-12-17 20:05:40');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (68, 'Phát triển bền vững về môi trường là gì?', '[{\"key\":\"A\",\"value\":\" Sự cân bằng giữa sử dụng các yếu tố tự nhiên, nhân tạo, chất lượng môi trường sống của con người phải được bảo đảm. \"},{\"key\":\"B\",\"value\":\" Duy trì sự cân bằng giữa việc phát triển kinh tế, khai thác tài nguyên thiên nhiên và bảo vệ môi trường.\"},{\"key\":\"C\",\"value\":\" Duy trì sự khai thác nguồn tài nguyên thiên nhiên phục vụ lợi ích con người, phát triển kinh tế.\"},{\"key\":\"D\",\"value\":\" Duy trì sự cân bằng giữa bảo vệ môi trường tự nhiên với sự khai thác nguồn tài nguyên thiên nhiên phục vụ lợi ích con người.\"}]', 'D', 1, '2024-12-17 20:05:40', '2024-12-17 20:05:40');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (69, 'Luật bảo vệ môi trường được Quốc hội ban hành lần đầu tiên vào năm?', '[{\"key\":\"A\",\"value\":\"2014.0\"},{\"key\":\"B\",\"value\":\"2015.0\"},{\"key\":\"C\",\"value\":\"2016.0\"},{\"key\":\"D\",\"value\":\"2017.0\"}]', 'A', 1, '2024-12-17 20:05:40', '2024-12-17 20:05:40');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (70, 'Khái niệm nền kinh tế xanh là?', '[{\"key\":\"A\",\"value\":\"Nền kinh tế có mức phát thải ổn định, khai thác, sử dụng tối đa tài nguyên thiên nhiên tái tạo và không tái tạo.\"},{\"key\":\"B\",\"value\":\"Nền kinh tế có mức phát thải thấp, sử dụng hiệu quả tài nguyên và hướng tới công bằng xã hội. \"},{\"key\":\"C\",\"value\":\" Nền kinh tế mà hoạt động sản xuất của con người gắn liền với khai thác và sử dụng tài nguyên thiên nhiên.\"},{\"key\":\"D\",\"value\":\" Nền kinh tế có hoạt động sản xuất của con người đi liền với việc tái sử dụng, tái chế. \"}]', 'B', 1, '2024-12-17 20:05:40', '2024-12-17 20:05:40');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (71, 'Nền kinh tế nâu là?', '[{\"key\":\"A\",\"value\":\"  Nền kinh tế tiêu tốn nhiều tài nguyên thiên nhiên, gây tổn hại tới môi trường. \"},{\"key\":\"B\",\"value\":\"  Nền kinh tế tiêu tốn nhiều chi phí cho việc khai thác, sử dụng tài nguyên thiên nhiên.\"},{\"key\":\"C\",\"value\":\"  Nền kinh tế có hoạt động sản xuất của con người đi liền với việc tái sử dụng, tái chế. \"},{\"key\":\"D\",\"value\":\" Nền kinh tế nâng cao đời sống của con người, công bằng xã hội, giảm thiểu những rủi ro môi trường. \"}]', 'A', 1, '2024-12-17 20:05:40', '2024-12-17 20:05:40');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (72, 'Các đặc điểm xanh chính trong ngành xây dựng xanh là?', '[{\"key\":\"A\",\"value\":\" Giảm rác thải trong quá trình xây dựng và vận hành, tái chế cấu trúc và vật liệu xây dựng, giảm thiểu tiêu thụ năng lượng.\"},{\"key\":\"B\",\"value\":\" Mái nhà xanh nhằm tiết kiệm năng lượng tiêu thụ cũng như phát triển năng lượng tái tạo, ưu tiên sử dụng vật liệu từ thiên nhiên. \"},{\"key\":\"C\",\"value\":\"Sử dụng năng lượng tái tạo thay cho năng lượng không tái tạo, tái sử dụng vật liệu xây dựng.\"},{\"key\":\"D\",\"value\":\"  Bảo vệ sức khỏe của người cư trú và cải thiện năng suất của người lao động, hạn chế các rủi ro tai nạn lao động. \"}]', 'A', 1, '2024-12-17 20:05:40', '2024-12-17 20:05:40');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (73, ' Hoạt động nào dưới đây nhằm làm giảm mức năng lượng tiêu thụ cũng như lượng khí thải gây ô nhiễm ra môi trường?', '[{\"key\":\"A\",\"value\":\" Phát triển các loại vận tải công cộng tiết kiệm năng lượng, sử dụng năng lượng sạch với lượng phát thải thấp. Kiểm soát số lượng xe hơi và xe máy của mỗi cá nhân. \"},{\"key\":\"B\",\"value\":\"Ban hành, triển khai bộ tiêu chuẩn về quản lý nhiên liệu, phát thải phương tiện vận tải. Sử dụng năng lượng tái tạo, nhiên liệu phát thải ít khí nhà kính hơn trong vận tải.\"},{\"key\":\"C\",\"value\":\" Kiểm soát ô nhiễm môi trường trong vận tải, phát thải từ xe hơi và xe máy. Kiểm soát số lượng xe hơi và xe máy của mỗi cá nhân. \"},{\"key\":\"D\",\"value\":\"Sử dụng năng lượng tái tạo, nhiên liệu phát thải ít khí nhà kính hơn trong vận tải. nghiêm cấm các phương tiện không đáp ứng tiêu chuẩn phát thải vận hành.\"}]', 'B', 1, '2024-12-17 20:05:40', '2024-12-17 20:05:40');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (74, ' Bảo vệ môi trường trong phát triển bền vững là?', '[{\"key\":\"A\",\"value\":\"  Giảm tác động của các hoạt động sản xuất đến môi trường thông qua quá trình, giảm thiểu sản xuất, thu gom, vận chuyển, tái sử dụng, tái chế và xử lý chất thải và hóa chất độc hại. \"},{\"key\":\"B\",\"value\":\"Giảm tác động của các hoạt động xã hội thông qua quá trình, giảm thiểu sản xuất, thu gom, vận chuyển, tái sử dụng, tái chế và xử lý chất thải và hóa chất độc hại. \"},{\"key\":\"C\",\"value\":\" Giảm tác động của các hoạt động sản xuất đến môi trường thông qua quá trình phòng ngừa, giảm thiểu, giám sát, phân loại, thu gom, vận chuyển, tái sử dụng, tái chế, xử lý chất thải và hóa chất độc hại. \"},{\"key\":\"D\",\"value\":\" Giảm tác động của các hoạt động văn hóa, giáo dục thông qua quá trình phòng ngừa, giảm thiểu, giám sát, phân loại, thu gom, vận chuyển, tái sử dụng, tái chế và xử lý chất thải và hóa chất độc hại. \"}]', 'C', 1, '2024-12-17 20:05:40', '2024-12-17 20:05:40');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (75, 'Theo khoản 18, 19 Điều 3 Luật Bảo vệ môi trường 2020 Chất thải là?', '[{\"key\":\"A\",\"value\":\" Tất cả vật chất phát sinh do các hoạt động sản xuất, kinh doanh, dịch vụ, sinh hoạt của con người tồn tại ở các dạng lỏng, được thải bỏ khi không còn hữu dụng hay khi không muốn dùng nữa.\"},{\"key\":\"B\",\"value\":\" Tất cả vật chất phát sinh do các hoạt động sản xuất, kinh doanh, dịch vụ, sinh hoạt của con người tồn tại ở dạng rắn, được thải bỏ khi không còn hữu dụng hay khi không muốn dùng nữa.\"},{\"key\":\"C\",\"value\":\"Tất cả vật chất phát sinh do các hoạt động sản xuất, kinh doanh, dịch vụ, sinh hoạt của con người, được thải bỏ khi không còn tái sử dụng, tái chế được nữa hay khi không muốn dùng nữa.\"},{\"key\":\"D\",\"value\":\" Chất thải là vật chất ở thể rắn, lỏng, khí hoặc ở dạng khác được thải ra từ hoạt động sản xuất, kinh doanh, dịch vụ, sinh hoạt hoặc hoạt động khác. \"}]', 'D', 1, '2024-12-17 20:05:40', '2024-12-17 20:05:40');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (76, 'Phân loại chất thải theo nguồn gốc phát sinh?', '[{\"key\":\"A\",\"value\":\" Chất thải rắn sinh hoạt, dịch vụ, chất thải xây dựng, chất thải công nghiệp, chất thải y tế. \"},{\"key\":\"B\",\"value\":\" Chất thải thực phẩm từ hộ gia đình, chất thải xây dựng, chất thải công nghiệp, chất thải y tế.\"},{\"key\":\"C\",\"value\":\"Chất thải từ các cơ sở công cộng, dịch vụ; chất thải xây dựng; chất thải công nghiệp; chất thải y tế.  \"},{\"key\":\"D\",\"value\":\" Chất thải nguy hại, chất thải xây dựng và chất thải không nguy hại.\"}]', 'A', 1, '2024-12-17 20:05:40', '2024-12-17 20:05:40');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (77, ' Phân loại rác thải tại nguồn?', '[{\"key\":\"A\",\"value\":\" Rác hữu cơ, rác vô cơ, rác tái chế.\"},{\"key\":\"B\",\"value\":\"Rác hữu cơ, rác tái chế, rác tái sử dụng.\"},{\"key\":\"C\",\"value\":\"  Rác thải nguy hại, rác thải hữu cơ, rác thải vô cơ.\"},{\"key\":\"D\",\"value\":\" Rác thải nguy hại, rác thải không nguy hại, rác tái chế.\"}]', 'A', 1, '2024-12-17 20:05:40', '2024-12-17 20:05:40');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (78, ' Luật hóa chất 2007 đưa ra khái niệm hóa chất nguy hiểm là?', '[{\"key\":\"A\",\"value\":\" Hóa chất có tất cả các đặc tính nguy hiểm: dễ cháy nổ, ô xy hóa cao, độc hại, ăn mòn hoặc gây tổn hại tới môi trường… \"},{\"key\":\"B\",\"value\":\" Hóa chất có đặc tính nguy hiểm: dễ cháy nổ, độc hại, ăn mòn hoặc gây tổn hại tới môi trường…\"},{\"key\":\"C\",\"value\":\"   Hóa chất được bộ y tế cảnh báo là nguy hiểm, độc hại đối với con người và môi trường sinh thái…\"},{\"key\":\"D\",\"value\":\" Hóa chất có một hoặc một số đặc tính nguy hiểm: dễ cháy nổ, ô xy hóa cao, độc hại, ăn mòn hoặc gây tổn hại tới môi trường… \"}]', 'D', 1, '2024-12-17 20:05:40', '2024-12-17 20:05:40');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (79, ' Hình ảnh bên dưới thể hiện đặc tính gì?', '[{\"key\":\"A\",\"value\":\" Chất dễ cháy.\"},{\"key\":\"B\",\"value\":\" Chất ô xy hóa.\"},{\"key\":\"C\",\"value\":\" Chất tự phản ứng.\"},{\"key\":\"D\",\"value\":\" Chất tự cháy, tự dẫn lửa.\"}]', 'B', 1, '2024-12-17 20:05:40', '2024-12-17 20:05:40');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (80, '  Hình ảnh bên dưới thể hiện đặc tính gì?', '[{\"key\":\"A\",\"value\":\" Chất ô xy hóa, Peroxit hữu cơ.\"},{\"key\":\"B\",\"value\":\"Chất ô xy hóa, chất có khả năng gây nổ.\"},{\"key\":\"C\",\"value\":\" Chất dễ cháy, Peroxit hữu cơ.\"},{\"key\":\"D\",\"value\":\" Chất dễ cháy, chất ô xy hóa.\"}]', 'C', 1, '2024-12-17 20:05:40', '2024-12-17 20:05:40');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (81, ' Ý nghĩa cốt lõi của kinh tế xanh là?', '[{\"key\":\"A\",\"value\":\" Tăng trưởng kinh tế đảm bảo đồng thời hai mục tiêu là bảo vệ môi trường sống trong sạch và bền vững.\"},{\"key\":\"B\",\"value\":\"  Tăng trưởng kinh tế đảm bảo không khai thác tài nguyên thiên nhiên, sử dụng năng lượng thay thế.\"},{\"key\":\"C\",\"value\":\"  Hạn chế tối thiểu phát thải vào môi trường, cân bằng lượng khí thải các ngành nghề.\"},{\"key\":\"D\",\"value\":\" Tăng trưởng kinh tế đồng đều tất cả các ngành nghề, đảm bảo đạt chỉ tiêu đặt ra hàng năm.\"}]', 'A', 1, '2024-12-17 20:05:40', '2024-12-17 20:05:40');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (82, ' Việt Nam bắt đầu làm quen với xu hướng phát triển kinh tế xanh của thế giới từ năm bao nhiêu?', '[{\"key\":\"A\",\"value\":\"   1999\"},{\"key\":\"B\",\"value\":\"  2000\"},{\"key\":\"C\",\"value\":\"  2001\"},{\"key\":\"D\",\"value\":\"  2010\"}]', 'B', 1, '2024-12-17 20:05:40', '2024-12-17 20:05:40');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (83, '2 + 2 = ?', '[{\"key\":\"A\",\"value\":\"2.0\"},{\"key\":\"B\",\"value\":\"3.0\"},{\"key\":\"C\",\"value\":\"4.0\"},{\"key\":\"D\",\"value\":\"5.0\"}]', 'C', 4, '2024-12-17 20:18:06', '2024-12-17 20:18:06');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (84, '3 + 3 = ?', '[{\"key\":\"A\",\"value\":\"4.0\"},{\"key\":\"B\",\"value\":\"5.0\"},{\"key\":\"C\",\"value\":\"6.0\"},{\"key\":\"D\",\"value\":\"7.0\"}]', 'C', 4, '2024-12-17 20:18:06', '2024-12-17 20:18:06');
COMMIT;

-- ----------------------------
-- Table structure for result_answers
-- ----------------------------
DROP TABLE IF EXISTS `result_answers`;
CREATE TABLE `result_answers` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `is_correct` bit(1) NOT NULL,
  `student_answer` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `question_id` bigint NOT NULL,
  `result_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqaieyg9kc7p3wdjd3x8fberwq` (`question_id`),
  KEY `FKuutyw4sxufhj2y5m7xp3grpv` (`result_id`),
  CONSTRAINT `FKqaieyg9kc7p3wdjd3x8fberwq` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`),
  CONSTRAINT `FKuutyw4sxufhj2y5m7xp3grpv` FOREIGN KEY (`result_id`) REFERENCES `results` (`result_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of result_answers
-- ----------------------------
BEGIN;
INSERT INTO `result_answers` (`id`, `is_correct`, `student_answer`, `question_id`, `result_id`) VALUES (1, b'1', 'C', 83, 1);
INSERT INTO `result_answers` (`id`, `is_correct`, `student_answer`, `question_id`, `result_id`) VALUES (2, b'1', 'C', 84, 1);
COMMIT;

-- ----------------------------
-- Table structure for results
-- ----------------------------
DROP TABLE IF EXISTS `results`;
CREATE TABLE `results` (
  `result_id` bigint NOT NULL AUTO_INCREMENT,
  `score` double NOT NULL,
  `submitted_at` datetime(6) DEFAULT NULL,
  `exam_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `total_correct` double DEFAULT NULL,
  `total_question` double DEFAULT NULL,
  PRIMARY KEY (`result_id`),
  KEY `FKeow9kom5hrbhv6jhq82bqe68k` (`exam_id`),
  KEY `FKxtl9ahma532if6r68yvgo7ck` (`user_id`),
  CONSTRAINT `FKeow9kom5hrbhv6jhq82bqe68k` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`exam_id`),
  CONSTRAINT `FKxtl9ahma532if6r68yvgo7ck` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of results
-- ----------------------------
BEGIN;
INSERT INTO `results` (`result_id`, `score`, `submitted_at`, `exam_id`, `user_id`, `total_correct`, `total_question`) VALUES (1, 0, '2024-12-17 20:35:57.825975', 3, 16, 2, 2);
COMMIT;

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKgdlljajjmqywje8kdxft3auoy` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of roles
-- ----------------------------
BEGIN;
INSERT INTO `roles` (`id`, `name`) VALUES (1, 'Admin');
INSERT INTO `roles` (`id`, `name`) VALUES (3, 'Student');
INSERT INTO `roles` (`id`, `name`) VALUES (2, 'Teacher');
COMMIT;

-- ----------------------------
-- Table structure for subjects
-- ----------------------------
DROP TABLE IF EXISTS `subjects`;
CREATE TABLE `subjects` (
  `subject_id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `subject_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of subjects
-- ----------------------------
BEGIN;
INSERT INTO `subjects` (`subject_id`, `created_at`, `description`, `subject_name`, `updated_at`) VALUES (1, NULL, 'IT 2024', 'CNTT', '2024-12-16 20:00:22.659812');
INSERT INTO `subjects` (`subject_id`, `created_at`, `description`, `subject_name`, `updated_at`) VALUES (2, NULL, '123123123', 'Toan 2', '2024-12-16 20:00:27.383951');
INSERT INTO `subjects` (`subject_id`, `created_at`, `description`, `subject_name`, `updated_at`) VALUES (3, '2024-12-15 11:35:01.744690', 'OOPPPP', 'OOP', '2024-12-15 11:35:01.744705');
INSERT INTO `subjects` (`subject_id`, `created_at`, `description`, `subject_name`, `updated_at`) VALUES (4, '2024-12-15 21:09:23.034334', 'Môn Toán', 'Toán', '2024-12-15 21:09:23.034352');
INSERT INTO `subjects` (`subject_id`, `created_at`, `description`, `subject_name`, `updated_at`) VALUES (5, '2024-12-15 21:09:49.365559', 'Môn Văn', 'Văn', '2024-12-15 21:09:49.365593');
INSERT INTO `subjects` (`subject_id`, `created_at`, `description`, `subject_name`, `updated_at`) VALUES (6, '2024-12-15 22:31:23.365211', 'Lý 2024', 'Lý ĐC', '2024-12-15 22:31:23.365231');
INSERT INTO `subjects` (`subject_id`, `created_at`, `description`, `subject_name`, `updated_at`) VALUES (8, '2024-12-16 22:45:47.785099', 'Hoa hoc dai cuong', 'Hoa ', '2024-12-16 22:45:47.785117');
INSERT INTO `subjects` (`subject_id`, `created_at`, `description`, `subject_name`, `updated_at`) VALUES (9, '2024-12-16 22:46:58.460364', 'TK Description', 'TK Subject', '2024-12-16 22:46:58.460492');
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` (`user_id`, `email`, `password`, `role`, `full_name`, `created_at`, `updated_at`) VALUES (6, 'tk@example.com', '5cfda047b5444471d6e9b36b77daf33b:47d35763ef8e403bd1bdadc4bd506a63c488805e73a2c58be250c2759c8b01da', 'admin', 'TK', '2024-12-15 09:37:04', '2024-12-15 09:37:04');
INSERT INTO `users` (`user_id`, `email`, `password`, `role`, `full_name`, `created_at`, `updated_at`) VALUES (10, 'hihih@zz.zzz', '4d14e27c0d45785b77d271f11213230a:fb7f7dc56b7eab4888e62ff454c82a4edf0e1454b40e788434df20da26595d90', 'teacher', 'teacher 12', '2024-12-15 10:29:52', '2024-12-15 23:19:34');
INSERT INTO `users` (`user_id`, `email`, `password`, `role`, `full_name`, `created_at`, `updated_at`) VALUES (14, 's1@zz.zz', '17ce8748638e5cd25bf2120a0a402edb:f18581c8a6717aeeebd58b3f0d869e827b54780d1538e0d50b4aa17be3a294df', 'student', 'S1', '2024-12-15 23:18:47', '2024-12-15 23:18:47');
INSERT INTO `users` (`user_id`, `email`, `password`, `role`, `full_name`, `created_at`, `updated_at`) VALUES (15, 's2@zz.zz', 'c797519506f1bdcf2dc25debcbda0f82:108c8965b8a54df069a703ac97f785a859a4e9c5a20bdd2ba9453a57ba15b821', 'student', 'S2', '2024-12-15 23:18:56', '2024-12-15 23:18:56');
INSERT INTO `users` (`user_id`, `email`, `password`, `role`, `full_name`, `created_at`, `updated_at`) VALUES (16, 's3@zz.zz', '27662988a48a6efb341f2e8f404cdd2a:103e08c6c3cf1c8bb49a5a0f4fc5a13c82dc53c07e1905727d1a293a28fb616e', 'student', 'S3', '2024-12-15 23:19:07', '2024-12-15 23:19:07');
INSERT INTO `users` (`user_id`, `email`, `password`, `role`, `full_name`, `created_at`, `updated_at`) VALUES (17, 'teacherdz@zz.zz', '514e36c9b229207fb432f9f7cc581205:91eb5ba66111d984ade583b165e20423ae21d51f694fa5bc5cd5e11e9f2ea154', 'teacher', 'Teacher 2023', '2024-12-16 20:02:27', '2024-12-16 22:38:24');
INSERT INTO `users` (`user_id`, `email`, `password`, `role`, `full_name`, `created_at`, `updated_at`) VALUES (18, 'tung@ac.com', '9654a642a78c59c126cf70918439e523:88d9c5debcfd755ef8856d89cdc0fb980d7eded20cc4a3824b7f5783694b10ea', 'student', 'phamj thanh tung', '2024-12-16 22:38:49', '2024-12-16 22:39:45');
INSERT INTO `users` (`user_id`, `email`, `password`, `role`, `full_name`, `created_at`, `updated_at`) VALUES (19, 'hoa@gmail.com', '8b5b93d25ef8671beb1c9e0d2e9607df:f8df2dd7189aac92840f81cde00cec87eaf6e0b88912af399151bf2140e67aef', 'teacher', 'hoa hoc ', '2024-12-16 22:42:04', '2024-12-16 22:43:00');
INSERT INTO `users` (`user_id`, `email`, `password`, `role`, `full_name`, `created_at`, `updated_at`) VALUES (20, 'tung@gmail.com', '5da8c7ffb50ab3c20960815d3f95374f:524a675fd5a09a11d5f3ef9e3517ac677873354dda78a03ad76bc96d66a093d7', 'student', 'phamj thanh ', '2024-12-16 22:43:37', '2024-12-16 22:43:47');
INSERT INTO `users` (`user_id`, `email`, `password`, `role`, `full_name`, `created_at`, `updated_at`) VALUES (21, 'tk_1@gmail.com', 'c0c6e174ce07188cf07d19ef495cf27a:98e9baa4ff6efc02e5cc4f5c428970df5b850d49aa76b329999d9e0732c75c5c', 'teacher', 'TK Teacher', '2024-12-16 22:45:40', '2024-12-16 22:45:40');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
