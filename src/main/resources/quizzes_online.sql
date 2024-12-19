/*
 Navicat Premium Data Transfer

 Source Server         : LocalHost
 Source Server Type    : MySQL
 Source Server Version : 80039 (8.0.39)
 Source Host           : 127.0.0.1:3306
 Source Schema         : quizzes_online

 Target Server Type    : MySQL
 Target Server Version : 80039 (8.0.39)
 File Encoding         : 65001

 Date: 19/12/2024 23:14:19
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
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of class_students
-- ----------------------------
BEGIN;
INSERT INTO `class_students` (`id`, `class_id`, `student_id`) VALUES (70, 11, 14);
INSERT INTO `class_students` (`id`, `class_id`, `student_id`) VALUES (71, 11, 15);
INSERT INTO `class_students` (`id`, `class_id`, `student_id`) VALUES (72, 11, 16);
INSERT INTO `class_students` (`id`, `class_id`, `student_id`) VALUES (73, 11, 18);
INSERT INTO `class_students` (`id`, `class_id`, `student_id`) VALUES (74, 11, 20);
INSERT INTO `class_students` (`id`, `class_id`, `student_id`) VALUES (75, 11, 23);
INSERT INTO `class_students` (`id`, `class_id`, `student_id`) VALUES (76, 11, 24);
INSERT INTO `class_students` (`id`, `class_id`, `student_id`) VALUES (77, 11, 25);
INSERT INTO `class_students` (`id`, `class_id`, `student_id`) VALUES (78, 11, 27);
INSERT INTO `class_students` (`id`, `class_id`, `student_id`) VALUES (79, 11, 28);
INSERT INTO `class_students` (`id`, `class_id`, `student_id`) VALUES (80, 11, 29);
INSERT INTO `class_students` (`id`, `class_id`, `student_id`) VALUES (81, 11, 30);
INSERT INTO `class_students` (`id`, `class_id`, `student_id`) VALUES (82, 11, 31);
INSERT INTO `class_students` (`id`, `class_id`, `student_id`) VALUES (83, 11, 32);
INSERT INTO `class_students` (`id`, `class_id`, `student_id`) VALUES (84, 11, 33);
INSERT INTO `class_students` (`id`, `class_id`, `student_id`) VALUES (85, 14, 14);
INSERT INTO `class_students` (`id`, `class_id`, `student_id`) VALUES (86, 14, 15);
INSERT INTO `class_students` (`id`, `class_id`, `student_id`) VALUES (87, 14, 16);
INSERT INTO `class_students` (`id`, `class_id`, `student_id`) VALUES (88, 14, 18);
INSERT INTO `class_students` (`id`, `class_id`, `student_id`) VALUES (89, 14, 20);
INSERT INTO `class_students` (`id`, `class_id`, `student_id`) VALUES (90, 14, 23);
INSERT INTO `class_students` (`id`, `class_id`, `student_id`) VALUES (91, 14, 24);
INSERT INTO `class_students` (`id`, `class_id`, `student_id`) VALUES (92, 14, 25);
INSERT INTO `class_students` (`id`, `class_id`, `student_id`) VALUES (93, 14, 27);
INSERT INTO `class_students` (`id`, `class_id`, `student_id`) VALUES (94, 14, 28);
INSERT INTO `class_students` (`id`, `class_id`, `student_id`) VALUES (95, 14, 29);
INSERT INTO `class_students` (`id`, `class_id`, `student_id`) VALUES (96, 14, 30);
INSERT INTO `class_students` (`id`, `class_id`, `student_id`) VALUES (97, 14, 31);
INSERT INTO `class_students` (`id`, `class_id`, `student_id`) VALUES (98, 14, 32);
INSERT INTO `class_students` (`id`, `class_id`, `student_id`) VALUES (99, 14, 33);
INSERT INTO `class_students` (`id`, `class_id`, `student_id`) VALUES (100, 14, 34);
INSERT INTO `class_students` (`id`, `class_id`, `student_id`) VALUES (101, 13, 32);
INSERT INTO `class_students` (`id`, `class_id`, `student_id`) VALUES (102, 13, 31);
INSERT INTO `class_students` (`id`, `class_id`, `student_id`) VALUES (103, 13, 30);
INSERT INTO `class_students` (`id`, `class_id`, `student_id`) VALUES (104, 13, 29);
INSERT INTO `class_students` (`id`, `class_id`, `student_id`) VALUES (105, 13, 28);
INSERT INTO `class_students` (`id`, `class_id`, `student_id`) VALUES (106, 12, 34);
INSERT INTO `class_students` (`id`, `class_id`, `student_id`) VALUES (107, 12, 33);
INSERT INTO `class_students` (`id`, `class_id`, `student_id`) VALUES (108, 12, 27);
INSERT INTO `class_students` (`id`, `class_id`, `student_id`) VALUES (109, 12, 25);
INSERT INTO `class_students` (`id`, `class_id`, `student_id`) VALUES (110, 12, 28);
INSERT INTO `class_students` (`id`, `class_id`, `student_id`) VALUES (111, 12, 24);
INSERT INTO `class_students` (`id`, `class_id`, `student_id`) VALUES (112, 12, 23);
INSERT INTO `class_students` (`id`, `class_id`, `student_id`) VALUES (113, 12, 20);
INSERT INTO `class_students` (`id`, `class_id`, `student_id`) VALUES (114, 12, 18);
INSERT INTO `class_students` (`id`, `class_id`, `student_id`) VALUES (115, 12, 16);
COMMIT;

-- ----------------------------
-- Table structure for classes
-- ----------------------------
DROP TABLE IF EXISTS `classes`;
CREATE TABLE `classes` (
  `class_id` bigint NOT NULL AUTO_INCREMENT,
  `class_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `subject_id` bigint NOT NULL,
  `teacher_id` bigint NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`class_id`),
  KEY `FK4tv5efpqhlo8xg8l8dpba8v75` (`teacher_id`),
  KEY `fk21232` (`subject_id`),
  CONSTRAINT `fk21232` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK4tv5efpqhlo8xg8l8dpba8v75` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of classes
-- ----------------------------
BEGIN;
INSERT INTO `classes` (`class_id`, `class_name`, `subject_id`, `teacher_id`, `created_at`, `updated_at`) VALUES (11, 'CNTT VHVL BS', 15, 21, '2024-12-19 19:19:56', '2024-12-19 19:40:07');
INSERT INTO `classes` (`class_id`, `class_name`, `subject_id`, `teacher_id`, `created_at`, `updated_at`) VALUES (12, 'QLKS', 16, 19, '2024-12-19 19:20:44', '2024-12-19 19:41:00');
INSERT INTO `classes` (`class_id`, `class_name`, `subject_id`, `teacher_id`, `created_at`, `updated_at`) VALUES (13, 'CNKT OTO', 14, 26, '2024-12-19 19:22:11', '2024-12-19 19:40:40');
INSERT INTO `classes` (`class_id`, `class_name`, `subject_id`, `teacher_id`, `created_at`, `updated_at`) VALUES (14, 'NHAP MON CNTT', 17, 21, '2024-12-19 19:22:41', '2024-12-19 19:40:15');
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
) ENGINE=InnoDB AUTO_INCREMENT=192 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of exam_questions
-- ----------------------------
BEGIN;
INSERT INTO `exam_questions` (`id`, `exam_id`, `question_id`) VALUES (103, 11, 138);
INSERT INTO `exam_questions` (`id`, `exam_id`, `question_id`) VALUES (104, 11, 139);
INSERT INTO `exam_questions` (`id`, `exam_id`, `question_id`) VALUES (105, 11, 136);
INSERT INTO `exam_questions` (`id`, `exam_id`, `question_id`) VALUES (106, 11, 148);
INSERT INTO `exam_questions` (`id`, `exam_id`, `question_id`) VALUES (107, 11, 144);
INSERT INTO `exam_questions` (`id`, `exam_id`, `question_id`) VALUES (108, 11, 141);
INSERT INTO `exam_questions` (`id`, `exam_id`, `question_id`) VALUES (109, 11, 142);
INSERT INTO `exam_questions` (`id`, `exam_id`, `question_id`) VALUES (110, 11, 147);
INSERT INTO `exam_questions` (`id`, `exam_id`, `question_id`) VALUES (111, 11, 134);
INSERT INTO `exam_questions` (`id`, `exam_id`, `question_id`) VALUES (112, 11, 137);
INSERT INTO `exam_questions` (`id`, `exam_id`, `question_id`) VALUES (113, 11, 133);
INSERT INTO `exam_questions` (`id`, `exam_id`, `question_id`) VALUES (114, 11, 145);
INSERT INTO `exam_questions` (`id`, `exam_id`, `question_id`) VALUES (115, 11, 129);
INSERT INTO `exam_questions` (`id`, `exam_id`, `question_id`) VALUES (116, 11, 131);
INSERT INTO `exam_questions` (`id`, `exam_id`, `question_id`) VALUES (117, 11, 132);
INSERT INTO `exam_questions` (`id`, `exam_id`, `question_id`) VALUES (168, 9, 104);
INSERT INTO `exam_questions` (`id`, `exam_id`, `question_id`) VALUES (169, 9, 99);
INSERT INTO `exam_questions` (`id`, `exam_id`, `question_id`) VALUES (170, 9, 113);
INSERT INTO `exam_questions` (`id`, `exam_id`, `question_id`) VALUES (171, 9, 103);
INSERT INTO `exam_questions` (`id`, `exam_id`, `question_id`) VALUES (172, 9, 107);
INSERT INTO `exam_questions` (`id`, `exam_id`, `question_id`) VALUES (173, 9, 102);
INSERT INTO `exam_questions` (`id`, `exam_id`, `question_id`) VALUES (174, 9, 112);
INSERT INTO `exam_questions` (`id`, `exam_id`, `question_id`) VALUES (175, 9, 110);
INSERT INTO `exam_questions` (`id`, `exam_id`, `question_id`) VALUES (176, 9, 105);
INSERT INTO `exam_questions` (`id`, `exam_id`, `question_id`) VALUES (177, 9, 109);
INSERT INTO `exam_questions` (`id`, `exam_id`, `question_id`) VALUES (178, 10, 114);
INSERT INTO `exam_questions` (`id`, `exam_id`, `question_id`) VALUES (179, 10, 115);
INSERT INTO `exam_questions` (`id`, `exam_id`, `question_id`) VALUES (180, 10, 116);
INSERT INTO `exam_questions` (`id`, `exam_id`, `question_id`) VALUES (181, 10, 117);
INSERT INTO `exam_questions` (`id`, `exam_id`, `question_id`) VALUES (182, 10, 118);
INSERT INTO `exam_questions` (`id`, `exam_id`, `question_id`) VALUES (183, 10, 119);
INSERT INTO `exam_questions` (`id`, `exam_id`, `question_id`) VALUES (184, 10, 120);
INSERT INTO `exam_questions` (`id`, `exam_id`, `question_id`) VALUES (185, 10, 121);
INSERT INTO `exam_questions` (`id`, `exam_id`, `question_id`) VALUES (186, 10, 122);
INSERT INTO `exam_questions` (`id`, `exam_id`, `question_id`) VALUES (187, 10, 123);
INSERT INTO `exam_questions` (`id`, `exam_id`, `question_id`) VALUES (190, 12, 149);
INSERT INTO `exam_questions` (`id`, `exam_id`, `question_id`) VALUES (191, 12, 150);
COMMIT;

-- ----------------------------
-- Table structure for exams
-- ----------------------------
DROP TABLE IF EXISTS `exams`;
CREATE TABLE `exams` (
  `exam_id` bigint NOT NULL AUTO_INCREMENT,
  `exam_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of exams
-- ----------------------------
BEGIN;
INSERT INTO `exams` (`exam_id`, `exam_name`, `subject_id`, `class_id`, `created_by`, `duration`, `created_at`, `updated_at`) VALUES (9, 'Kiểm tra nhập TA chuyên ngành', 15, 14, 35, 20, '2024-12-19 19:28:46', '2024-12-19 19:45:00');
INSERT INTO `exams` (`exam_id`, `exam_name`, `subject_id`, `class_id`, `created_by`, `duration`, `created_at`, `updated_at`) VALUES (10, 'Kiểm tra Pháp luật', 17, 14, 35, 25, '2024-12-19 19:34:56', '2024-12-19 20:18:12');
INSERT INTO `exams` (`exam_id`, `exam_name`, `subject_id`, `class_id`, `created_by`, `duration`, `created_at`, `updated_at`) VALUES (11, 'Kiểm tra BVMT', 14, 13, 35, 30, '2024-12-19 19:36:55', '2024-12-19 19:37:17');
INSERT INTO `exams` (`exam_id`, `exam_name`, `subject_id`, `class_id`, `created_by`, `duration`, `created_at`, `updated_at`) VALUES (12, 'Kiểm tra NMLT', 17, 14, 6, 30, '2024-12-19 22:45:56', '2024-12-19 22:57:46');
COMMIT;

-- ----------------------------
-- Table structure for question_banks
-- ----------------------------
DROP TABLE IF EXISTS `question_banks`;
CREATE TABLE `question_banks` (
  `question_bank_id` bigint NOT NULL AUTO_INCREMENT,
  `bank_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `is_public` bit(1) DEFAULT NULL,
  `created_by` bigint NOT NULL,
  PRIMARY KEY (`question_bank_id`),
  KEY `FKaoc8pganxt0sge51oqvc5oqcp` (`created_by`),
  CONSTRAINT `FKaoc8pganxt0sge51oqvc5oqcp` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of question_banks
-- ----------------------------
BEGIN;
INSERT INTO `question_banks` (`question_bank_id`, `bank_name`, `created_at`, `is_public`, `created_by`) VALUES (11, 'Ngân hàng câu hỏi BVMT', '2024-12-19 19:25:29.151541', b'0', 6);
INSERT INTO `question_banks` (`question_bank_id`, `bank_name`, `created_at`, `is_public`, `created_by`) VALUES (12, 'Ngân hàng câu hỏi Pháp Luật', '2024-12-19 19:25:39.245118', b'0', 6);
INSERT INTO `question_banks` (`question_bank_id`, `bank_name`, `created_at`, `is_public`, `created_by`) VALUES (13, 'Ngân hàng câu hỏi Nhập môn CNTT', '2024-12-19 19:25:48.153986', b'0', 6);
INSERT INTO `question_banks` (`question_bank_id`, `bank_name`, `created_at`, `is_public`, `created_by`) VALUES (14, 'Ngân hàng câu hỏi Nhập môn TA chuyên ngành', '2024-12-19 19:25:58.694583', b'0', 6);
COMMIT;

-- ----------------------------
-- Table structure for questions
-- ----------------------------
DROP TABLE IF EXISTS `questions`;
CREATE TABLE `questions` (
  `question_id` bigint NOT NULL AUTO_INCREMENT,
  `question_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `answer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `correct_answer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `question_bank_id` bigint NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`question_id`) USING BTREE,
  KEY `FK001` (`question_bank_id`),
  CONSTRAINT `FK001` FOREIGN KEY (`question_bank_id`) REFERENCES `question_banks` (`question_bank_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of questions
-- ----------------------------
BEGIN;
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (99, 'When I last saw him, he _____ in London.', '[{\"key\":\"A\",\"value\":\"has lived\"},{\"key\":\"B\",\"value\":\"is living\"},{\"key\":\"C\",\"value\":\"was living\"},{\"key\":\"D\",\"value\":\"has been living\"}]', 'C', 14, '2024-12-19 19:32:31', '2024-12-19 19:32:31');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (100, 'We _______ Dorothy since last Saturday.', '[{\"key\":\"A\",\"value\":\"don’t see\"},{\"key\":\"B\",\"value\":\"haven’t seen\"},{\"key\":\"C\",\"value\":\"didn’t see\"},{\"key\":\"D\",\"value\":\"hadn’t seen\"}]', 'B', 14, '2024-12-19 19:32:31', '2024-12-19 19:32:31');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (101, 'The train ______ half an hour ago.', '[{\"key\":\"A\",\"value\":\"has been leaving\"},{\"key\":\"B\",\"value\":\"left\"},{\"key\":\"C\",\"value\":\"has left\"},{\"key\":\"D\",\"value\":\"had left\"}]', 'B', 14, '2024-12-19 19:32:31', '2024-12-19 19:32:31');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (102, 'Jack ______ the door.', '[{\"key\":\"A\",\"value\":\"has just painted\"},{\"key\":\"B\",\"value\":\"paint\"},{\"key\":\"C\",\"value\":\"will have painted\"},{\"key\":\"D\",\"value\":\"painting\"}]', 'A', 14, '2024-12-19 19:32:31', '2024-12-19 19:32:31');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (103, 'My sister ________ for you since yesterday', '[{\"key\":\"A\",\"value\":\"is looking\"},{\"key\":\"B\",\"value\":\"was looking\"},{\"key\":\"C\",\"value\":\"has been looking\"},{\"key\":\"D\",\"value\":\"looked\"}]', 'C', 14, '2024-12-19 19:32:31', '2024-12-19 19:32:31');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (104, 'I ______ Texas State University now', '[{\"key\":\"A\",\"value\":\"am attending\"},{\"key\":\"B\",\"value\":\"attend\"},{\"key\":\"C\",\"value\":\"was attending\"},{\"key\":\"D\",\"value\":\"attended\"}]', 'A', 14, '2024-12-19 19:32:31', '2024-12-19 19:32:31');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (105, 'He has been selling motorbikes ________', '[{\"key\":\"A\",\"value\":\"ten years ago\"},{\"key\":\"B\",\"value\":\"since ten years\"},{\"key\":\"C\",\"value\":\"for ten years ago\"},{\"key\":\"D\",\"value\":\"for ten years\"}]', 'D', 14, '2024-12-19 19:32:31', '2024-12-19 19:32:31');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (106, 'Christopher Columbus _______ American more than 500 years ago', '[{\"key\":\"A\",\"value\":\"discovered\"},{\"key\":\"B\",\"value\":\"has discovered\"},{\"key\":\"C\",\"value\":\"had discovered\"},{\"key\":\"D\",\"value\":\"had been discovering\"}]', 'A', 14, '2024-12-19 19:32:31', '2024-12-19 19:32:31');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (107, 'He fell down when he ______ towards the church', '[{\"key\":\"A\",\"value\":\"run\"},{\"key\":\"B\",\"value\":\"runs\"},{\"key\":\"C\",\"value\":\"was running\"},{\"key\":\"D\",\"value\":\"had run\"}]', 'C', 14, '2024-12-19 19:32:31', '2024-12-19 19:32:31');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (108, 'We _______ there when our father died', '[{\"key\":\"A\",\"value\":\"still lived\"},{\"key\":\"B\",\"value\":\"lived still\"},{\"key\":\"C\",\"value\":\"was still lived\"},{\"key\":\"D\",\"value\":\"was still living\"}]', 'A', 14, '2024-12-19 19:32:31', '2024-12-19 19:32:31');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (109, 'They ______ table tennis when their father comes back home', '[{\"key\":\"A\",\"value\":\"will play\"},{\"key\":\"B\",\"value\":\"will be playing\"},{\"key\":\"C\",\"value\":\"play\"},{\"key\":\"D\",\"value\":\"would play\"}]', 'B', 14, '2024-12-19 19:32:31', '2024-12-19 19:32:31');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (110, 'By Christmas, I _______ for Mr. Smith for six years', '[{\"key\":\"A\",\"value\":\"will have been working\"},{\"key\":\"B\",\"value\":\"will work\"},{\"key\":\"C\",\"value\":\"have been working\"},{\"key\":\"D\",\"value\":\"will be working\"}]', 'A', 14, '2024-12-19 19:32:31', '2024-12-19 19:32:31');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (111, 'I _______ in the room right now', '[{\"key\":\"A\",\"value\":\"am being\"},{\"key\":\"B\",\"value\":\"was being\"},{\"key\":\"C\",\"value\":\"have been being\"},{\"key\":\"D\",\"value\":\"am\"}]', 'D', 14, '2024-12-19 19:32:31', '2024-12-19 19:32:31');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (112, 'I ______ to New York three times this year', '[{\"key\":\"A\",\"value\":\"have been\"},{\"key\":\"B\",\"value\":\"was\"},{\"key\":\"C\",\"value\":\"were\"},{\"key\":\"D\",\"value\":\"had been\"}]', 'A', 14, '2024-12-19 19:32:31', '2024-12-19 19:32:31');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (113, 'I’ll come and see you before I _______ for the States', '[{\"key\":\"A\",\"value\":\"leave\"},{\"key\":\"B\",\"value\":\"will leave\"},{\"key\":\"C\",\"value\":\"have left\"},{\"key\":\"D\",\"value\":\"shall leave\"}]', 'A', 14, '2024-12-19 19:32:31', '2024-12-19 19:32:31');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (114, 'Câu 1: Cơ quan nào do Chính phủ thành lập và quản lý', '[{\"key\":\"A\",\"value\":\"Bộ Chính trị\"},{\"key\":\"B\",\"value\":\"Bộ tài nguyên và môi trường\"},{\"key\":\"C\",\"value\":\"Đài truyền hình Việt Nam\"},{\"key\":\"D\",\"value\":\"Đài truyền hình Việt Nam; Bộ tài nguyên và môi trường\"}]', 'C', 12, '2024-12-19 19:34:22', '2024-12-19 19:34:22');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (115, 'Câu 2: Đối tượng điều chỉnh của ngành luật dân sự là?', '[{\"key\":\"A\",\"value\":\"Quan hệ pháp luật giữa các chủ thể liên quan đến quyền nhân thân\"},{\"key\":\"B\",\"value\":\"Quan hệ pháp luật giữa các chủ thể liên quan đến tài sản\"},{\"key\":\"C\",\"value\":\"Quan hệ pháp luật giữa các chủ thể liên quan đến việc xác lập quyền sở hữu\"},{\"key\":\"D\",\"value\":\"Cả 3 đáp án đều đúng\"}]', 'D', 12, '2024-12-19 19:34:22', '2024-12-19 19:34:22');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (116, 'Câu 3: Năng lực chủ thể bao gồm:', '[{\"key\":\"A\",\"value\":\"Năng lực pháp luật và năng lực hành vi\"},{\"key\":\"B\",\"value\":\"Năng lực pháp luật và năng lực nhận thức\"},{\"key\":\"C\",\"value\":\"Năng lực pháp luật và năng lực công dân\"},{\"key\":\"D\",\"value\":\"Năng lực hành vi và năng lực nhận thức\"}]', 'A', 12, '2024-12-19 19:34:22', '2024-12-19 19:34:22');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (117, 'Câu 4: Quy phạm nào sau đây là quy phạm pháp luật:', '[{\"key\":\"A\",\"value\":\"Các quy định trong Nghị quyết của Đảng cộng sản Việt Nam\"},{\"key\":\"B\",\"value\":\"Các quy định trong Nghị quyết của Quốc hội\"},{\"key\":\"C\",\"value\":\"Các quy định trong điều lệ của Hội liên hiệp Phụ nữ Việt Nam\"},{\"key\":\"D\",\"value\":\"Các quy định trong điều lệ của Hội đồng hương Hải Phòng\"}]', 'B', 12, '2024-12-19 19:34:22', '2024-12-19 19:34:22');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (118, 'Câu 5: Điểm nào sau đây không phải là đặc điểm của quan hệ pháp luật là:', '[{\"key\":\"A\",\"value\":\"Xuất hiện trên cơ sở các quy phạm pháp luật\"},{\"key\":\"B\",\"value\":\"Không mang tính ý chí\"},{\"key\":\"C\",\"value\":\"Là quan hệ xã hội\"},{\"key\":\"D\",\"value\":\"Được bảo đảm thực hiện bằng các biện pháp cưỡng chế nhà nước\"}]', 'B', 12, '2024-12-19 19:34:22', '2024-12-19 19:34:22');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (119, 'Câu 6: Các quan hệ xã hội là đối tượng điều chỉnh của ngành luật hành chính có đặc điểm gì?', '[{\"key\":\"A\",\"value\":\"Là quan hệ mang tính chất bình đẳng\"},{\"key\":\"B\",\"value\":\"Là quan hệ mang tính chất chấp hành điều hành\"},{\"key\":\"C\",\"value\":\"Là quan hệ mang tính chất thoả thuận, bình đẳng\"},{\"key\":\"D\",\"value\":\"Cả 3 phương án trên\"}]', 'B', 12, '2024-12-19 19:34:22', '2024-12-19 19:34:22');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (120, 'Câu 7: Nhà nước Cộng hòa XHCN Việt Nam không thể hiện bản chất nào dưới đây?', '[{\"key\":\"A\",\"value\":\"Giai cấp\"},{\"key\":\"B\",\"value\":\"Pháp quyền XHCN\"},{\"key\":\"C\",\"value\":\"Xã hội\"},{\"key\":\"D\",\"value\":\" Tôn giáo\"}]', 'D', 12, '2024-12-19 19:34:22', '2024-12-19 19:34:22');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (121, 'Câu 8: Thời điểm mở thừa kế là:', '[{\"key\":\"A\",\"value\":\"Thời điểm các người hưởng thừa kế thỏa thuận\"},{\"key\":\"B\",\"value\":\"Thời điểm người để lại tài sản chết\"},{\"key\":\"C\",\"value\":\"Thời điểm phân chia tài sản\"},{\"key\":\"D\",\"value\":\"Thời điểm người chưa thành niên hưởng thừa kế đủ 18 tuổi\"}]', 'B', 12, '2024-12-19 19:34:22', '2024-12-19 19:34:22');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (122, 'Câu 9: Điểm khác biệt giữa bồi thường thiệt hại ngoài hợp đồng và phạt vi phạm hợp đồng:', '[{\"key\":\"A\",\"value\":\"Thiệt hại ngoài hợp đồng có mức độ nghiêm trọng lớn hơn\"},{\"key\":\"B\",\"value\":\"Thiệt hại ngoài hợp đồng có mức độ nghiêm trọng ít hơn\"},{\"key\":\"C\",\"value\":\"Phạt vi phạm được thỏa thuận trước trong hợp đồng, bồi thường thiệt hại ngoài hợp đồng không nhất thiết phải thỏa thuận trước\"},{\"key\":\"D\",\"value\":\"Bồi thường thiệt hại ngoài hợp đồng được thỏa thuận trước trong hợp đồng, phạt vi phạm không nhất thiết phải thỏa thuận trước\"}]', 'C', 12, '2024-12-19 19:34:22', '2024-12-19 19:34:22');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (123, 'Câu 10: Một người 15 tuổi, đã cố ý vi phạm hành chính, có thể bị áp dụng hình thức trách nhiệm pháp lý nào dưới đây ?', '[{\"key\":\"A\",\"value\":\"Cảnh cáo\"},{\"key\":\"B\",\"value\":\"Bồi thường thiệt hại\"},{\"key\":\"C\",\"value\":\"Cải tạo không giam giữ\"},{\"key\":\"D\",\"value\":\"Phạt tiền\"}]', 'A', 12, '2024-12-19 19:34:22', '2024-12-19 19:34:22');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (124, 'Câu 11: Nhà nước CHXHCN Việt Nam mới thành lập tên gì?', '[{\"key\":\"A\",\"value\":\"Nam Việt\"},{\"key\":\"B\",\"value\":\"Việt Nam dân chủ cộng hòa\"},{\"key\":\"C\",\"value\":\"Việt Nam cộng hòa\"},{\"key\":\"D\",\"value\":\"Việt Nam\"}]', 'B', 12, '2024-12-19 19:34:22', '2024-12-19 19:34:22');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (125, 'Câu 12: Theo Hiến pháp năm 2013, Chủ tịch nước ban hành loại văn bản nào để thực hiện nhiệm vụ, quyền hạn của mình?', '[{\"key\":\"A\",\"value\":\"Nghị quyết và quyết định\"},{\"key\":\"B\",\"value\":\"Lệnh và pháp lệnh\"},{\"key\":\"C\",\"value\":\"Pháp lệnh và quyết định\"},{\"key\":\"D\",\"value\":\"Lệnh và quyết định\"}]', 'D', 12, '2024-12-19 19:34:22', '2024-12-19 19:34:22');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (126, 'Câu 13: Quan hệ nào sau đây là quan hệ pháp luật hành chính?', '[{\"key\":\"A\",\"value\":\"Quan hệ giữa Bộ Tài chính với Bộ Tư pháp trong việc kiểm tra việc sử dụng ngân sách nhà nước của Bộ Tư pháp\"},{\"key\":\"B\",\"value\":\"Quan hệ bồi thường thiệt hại giữa Công ty cổ phần X với hộ gia đình bị thiệt hại\"},{\"key\":\"C\",\"value\":\"Quan hệ giữa Công ty TNHH B với Nguyễn Thị C là nhân viên kế toán của công ty\"},{\"key\":\"D\",\"value\":\"Quan hệ giữa Luật sư bào chữa với thân chủ của mình\"}]', 'A', 12, '2024-12-19 19:34:22', '2024-12-19 19:34:22');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (127, 'Câu 14: Người lập di chúc có quyền nào dưới đây?', '[{\"key\":\"A\",\"value\":\"Dành một phần khối di sản để thờ cúng\"},{\"key\":\"B\",\"value\":\"Chỉ định người thừa kế\"},{\"key\":\"C\",\"value\":\"Tất cả đáp án đều đúng\"},{\"key\":\"D\",\"value\":\"Giao nghĩa vụ cho người thừa kế\"}]', 'C', 12, '2024-12-19 19:34:22', '2024-12-19 19:34:22');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (128, 'Câu 15: Phương pháp điều chỉnh chủ yếu của ngành luật hành chính là gì?', '[{\"key\":\"A\",\"value\":\"Phương pháp tự định đoạt\"},{\"key\":\"B\",\"value\":\"Phương pháp mệnh lệnh\"},{\"key\":\"C\",\"value\":\"Phương pháp bình đẳng thỏa thuận\"},{\"key\":\"D\",\"value\":\"Không có đáp án đúng\"}]', 'B', 12, '2024-12-19 19:34:22', '2024-12-19 19:34:22');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (129, 'Phát triển không bền vững là gì?', '[{\"key\":\"A\",\"value\":\"Sự tăng trưởng kinh tế không cùng nhịp với tiến bộ và sự phát triển xã hội.\"},{\"key\":\"B\",\"value\":\" Sự tăng trưởng kinh tế không cùng nhịp với tiến bộ và sự phát triển giáo dục.\"},{\"key\":\"C\",\"value\":\"Sự tăng trưởng không cùng nhịp giữa giáo dục, xã hội và môi trường.\"},{\"key\":\"D\",\"value\":\"Sự tăng trưởng không đồng đều giữa môi trường và xã hội.\"}]', 'A', 11, '2024-12-19 19:36:34', '2024-12-19 19:36:34');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (130, 'Phát triển không bền vững về xã hội là gì?', '[{\"key\":\"A\",\"value\":\"Tăng trưởng kinh tế nhưng không có sự tiến bộ và công bằng xã hội; văn hóa, đạo đức bị suy đồi; sự phân hóa giàu nghèo dẫn tới sự bất ổn trong xã hội.\"},{\"key\":\"B\",\"value\":\" Tăng trưởng kinh tế nhưng không có sự tiến bộ văn hóa và công bằng xã hội, môi trường, dẫn đến sự phân hóa giàu nghèo dẫn tới sự bất ổn trong xã hội.\"},{\"key\":\"C\",\"value\":\"Tăng trưởng kinh tế nhưng không có sự tiến bộ văn hóa, đạo đức bị suy đồi, phân hóa giàu nghèo dẫn tới sự bất ổn trong xã hội.\"},{\"key\":\"D\",\"value\":\" Tăng trưởng kinh tế nhưng không có sự tiến bộ và công bằng xã hội dẫn đến sự phân hóa giàu nghèo dẫn tới sự bất ổn trong xã hội.\"}]', 'A', 11, '2024-12-19 19:36:34', '2024-12-19 19:36:34');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (131, 'Khái niệm phát triển bền vững do Uỷ ban Liên hợp quốc về Môi trường và Phát triển (UNCED) đưa ra năm 1987 là?', '[{\"key\":\"A\",\"value\":\" Phát triển bền vững thoả mãn lợi ích của hiện tại nhưng không làm giảm lợi ích của thế hệ sau.\"},{\"key\":\"B\",\"value\":\"    Phát triển bền vững thoả mãn những nhu cầu của hiện tại nhưng không làm giảm lợi ích của các thế hệ mai sau.\"},{\"key\":\"C\",\"value\":\"Phát triển bền vững thoả mãn những nhu cầu của hiện tại nhưng không làm giảm khả năng thoả mãn nhu cầu của các thế hệ mai sau.\"},{\"key\":\"D\",\"value\":\"Phát triển bền vững thoả mãn những nhu cầu kinh tế, xã hội hiện tại nhưng không làm giảm khả nhu cầu kinh tế, xã hội của các thế hệ mai sau.\"}]', 'C', 11, '2024-12-19 19:36:34', '2024-12-19 19:36:34');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (132, 'Mô hình phát triển bền vững là?', '[{\"key\":\"A\",\"value\":\"Sự hoà nhập, đan xen và thoả hiệp của ba hệ thống tương tác lẫn nhau là kinh tế, xã hội và môi trường.\"},{\"key\":\"B\",\"value\":\"Sự hoà nhập, đan xen, thoả hiệp, tương tác giữa hai hệ thống kinh tế và môi trường.\"},{\"key\":\"C\",\"value\":\"  Sự hoà nhập, đan xen, thoả hiệp, tương tác giữa hai hệ thống kinh tế và xã hội.\"},{\"key\":\"D\",\"value\":\"Sự hoà nhập, đan xen và thoả hiệp của ba hệ thống tương tác lẫn nhau là kinh tế, văn hóa, xã hội.\"}]', 'A', 11, '2024-12-19 19:36:34', '2024-12-19 19:36:34');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (133, 'Phát triển bền vững về kinh tế là gì?', '[{\"key\":\"A\",\"value\":\" Phát triển nhanh và toàn diện.\"},{\"key\":\"B\",\"value\":\"Phát triển chất lượng và toàn diện. \"},{\"key\":\"C\",\"value\":\" Phát triển nhanh an toàn và chất lượng. \"},{\"key\":\"D\",\"value\":\"Phát triển an toàn và chất lượng\"}]', 'C', 11, '2024-12-19 19:36:34', '2024-12-19 19:36:34');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (134, 'Phát triển bền vững về môi trường là gì?', '[{\"key\":\"A\",\"value\":\" Sự cân bằng giữa sử dụng các yếu tố tự nhiên, nhân tạo, chất lượng môi trường sống của con người phải được bảo đảm. \"},{\"key\":\"B\",\"value\":\" Duy trì sự cân bằng giữa việc phát triển kinh tế, khai thác tài nguyên thiên nhiên và bảo vệ môi trường.\"},{\"key\":\"C\",\"value\":\" Duy trì sự khai thác nguồn tài nguyên thiên nhiên phục vụ lợi ích con người, phát triển kinh tế.\"},{\"key\":\"D\",\"value\":\" Duy trì sự cân bằng giữa bảo vệ môi trường tự nhiên với sự khai thác nguồn tài nguyên thiên nhiên phục vụ lợi ích con người.\"}]', 'D', 11, '2024-12-19 19:36:34', '2024-12-19 19:36:34');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (135, 'Luật bảo vệ môi trường được Quốc hội ban hành lần đầu tiên vào năm?', '[{\"key\":\"A\",\"value\":\"2014.0\"},{\"key\":\"B\",\"value\":\"2015.0\"},{\"key\":\"C\",\"value\":\"2016.0\"},{\"key\":\"D\",\"value\":\"2017.0\"}]', 'A', 11, '2024-12-19 19:36:34', '2024-12-19 19:36:34');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (136, 'Khái niệm nền kinh tế xanh là?', '[{\"key\":\"A\",\"value\":\"Nền kinh tế có mức phát thải ổn định, khai thác, sử dụng tối đa tài nguyên thiên nhiên tái tạo và không tái tạo.\"},{\"key\":\"B\",\"value\":\"Nền kinh tế có mức phát thải thấp, sử dụng hiệu quả tài nguyên và hướng tới công bằng xã hội. \"},{\"key\":\"C\",\"value\":\" Nền kinh tế mà hoạt động sản xuất của con người gắn liền với khai thác và sử dụng tài nguyên thiên nhiên.\"},{\"key\":\"D\",\"value\":\" Nền kinh tế có hoạt động sản xuất của con người đi liền với việc tái sử dụng, tái chế. \"}]', 'B', 11, '2024-12-19 19:36:34', '2024-12-19 19:36:34');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (137, 'Nền kinh tế nâu là?', '[{\"key\":\"A\",\"value\":\"  Nền kinh tế tiêu tốn nhiều tài nguyên thiên nhiên, gây tổn hại tới môi trường. \"},{\"key\":\"B\",\"value\":\"  Nền kinh tế tiêu tốn nhiều chi phí cho việc khai thác, sử dụng tài nguyên thiên nhiên.\"},{\"key\":\"C\",\"value\":\"  Nền kinh tế có hoạt động sản xuất của con người đi liền với việc tái sử dụng, tái chế. \"},{\"key\":\"D\",\"value\":\" Nền kinh tế nâng cao đời sống của con người, công bằng xã hội, giảm thiểu những rủi ro môi trường. \"}]', 'A', 11, '2024-12-19 19:36:34', '2024-12-19 19:36:34');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (138, 'Các đặc điểm xanh chính trong ngành xây dựng xanh là?', '[{\"key\":\"A\",\"value\":\" Giảm rác thải trong quá trình xây dựng và vận hành, tái chế cấu trúc và vật liệu xây dựng, giảm thiểu tiêu thụ năng lượng.\"},{\"key\":\"B\",\"value\":\" Mái nhà xanh nhằm tiết kiệm năng lượng tiêu thụ cũng như phát triển năng lượng tái tạo, ưu tiên sử dụng vật liệu từ thiên nhiên. \"},{\"key\":\"C\",\"value\":\"Sử dụng năng lượng tái tạo thay cho năng lượng không tái tạo, tái sử dụng vật liệu xây dựng.\"},{\"key\":\"D\",\"value\":\"  Bảo vệ sức khỏe của người cư trú và cải thiện năng suất của người lao động, hạn chế các rủi ro tai nạn lao động. \"}]', 'A', 11, '2024-12-19 19:36:34', '2024-12-19 19:36:34');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (139, ' Hoạt động nào dưới đây nhằm làm giảm mức năng lượng tiêu thụ cũng như lượng khí thải gây ô nhiễm ra môi trường?', '[{\"key\":\"A\",\"value\":\" Phát triển các loại vận tải công cộng tiết kiệm năng lượng, sử dụng năng lượng sạch với lượng phát thải thấp. Kiểm soát số lượng xe hơi và xe máy của mỗi cá nhân. \"},{\"key\":\"B\",\"value\":\"Ban hành, triển khai bộ tiêu chuẩn về quản lý nhiên liệu, phát thải phương tiện vận tải. Sử dụng năng lượng tái tạo, nhiên liệu phát thải ít khí nhà kính hơn trong vận tải.\"},{\"key\":\"C\",\"value\":\" Kiểm soát ô nhiễm môi trường trong vận tải, phát thải từ xe hơi và xe máy. Kiểm soát số lượng xe hơi và xe máy của mỗi cá nhân. \"},{\"key\":\"D\",\"value\":\"Sử dụng năng lượng tái tạo, nhiên liệu phát thải ít khí nhà kính hơn trong vận tải. nghiêm cấm các phương tiện không đáp ứng tiêu chuẩn phát thải vận hành.\"}]', 'B', 11, '2024-12-19 19:36:34', '2024-12-19 19:36:34');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (140, ' Bảo vệ môi trường trong phát triển bền vững là?', '[{\"key\":\"A\",\"value\":\"  Giảm tác động của các hoạt động sản xuất đến môi trường thông qua quá trình, giảm thiểu sản xuất, thu gom, vận chuyển, tái sử dụng, tái chế và xử lý chất thải và hóa chất độc hại. \"},{\"key\":\"B\",\"value\":\"Giảm tác động của các hoạt động xã hội thông qua quá trình, giảm thiểu sản xuất, thu gom, vận chuyển, tái sử dụng, tái chế và xử lý chất thải và hóa chất độc hại. \"},{\"key\":\"C\",\"value\":\" Giảm tác động của các hoạt động sản xuất đến môi trường thông qua quá trình phòng ngừa, giảm thiểu, giám sát, phân loại, thu gom, vận chuyển, tái sử dụng, tái chế, xử lý chất thải và hóa chất độc hại. \"},{\"key\":\"D\",\"value\":\" Giảm tác động của các hoạt động văn hóa, giáo dục thông qua quá trình phòng ngừa, giảm thiểu, giám sát, phân loại, thu gom, vận chuyển, tái sử dụng, tái chế và xử lý chất thải và hóa chất độc hại. \"}]', 'C', 11, '2024-12-19 19:36:34', '2024-12-19 19:36:34');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (141, 'Theo khoản 18, 19 Điều 3 Luật Bảo vệ môi trường 2020 Chất thải là?', '[{\"key\":\"A\",\"value\":\" Tất cả vật chất phát sinh do các hoạt động sản xuất, kinh doanh, dịch vụ, sinh hoạt của con người tồn tại ở các dạng lỏng, được thải bỏ khi không còn hữu dụng hay khi không muốn dùng nữa.\"},{\"key\":\"B\",\"value\":\" Tất cả vật chất phát sinh do các hoạt động sản xuất, kinh doanh, dịch vụ, sinh hoạt của con người tồn tại ở dạng rắn, được thải bỏ khi không còn hữu dụng hay khi không muốn dùng nữa.\"},{\"key\":\"C\",\"value\":\"Tất cả vật chất phát sinh do các hoạt động sản xuất, kinh doanh, dịch vụ, sinh hoạt của con người, được thải bỏ khi không còn tái sử dụng, tái chế được nữa hay khi không muốn dùng nữa.\"},{\"key\":\"D\",\"value\":\" Chất thải là vật chất ở thể rắn, lỏng, khí hoặc ở dạng khác được thải ra từ hoạt động sản xuất, kinh doanh, dịch vụ, sinh hoạt hoặc hoạt động khác. \"}]', 'D', 11, '2024-12-19 19:36:34', '2024-12-19 19:36:34');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (142, 'Phân loại chất thải theo nguồn gốc phát sinh?', '[{\"key\":\"A\",\"value\":\" Chất thải rắn sinh hoạt, dịch vụ, chất thải xây dựng, chất thải công nghiệp, chất thải y tế. \"},{\"key\":\"B\",\"value\":\" Chất thải thực phẩm từ hộ gia đình, chất thải xây dựng, chất thải công nghiệp, chất thải y tế.\"},{\"key\":\"C\",\"value\":\"Chất thải từ các cơ sở công cộng, dịch vụ; chất thải xây dựng; chất thải công nghiệp; chất thải y tế.  \"},{\"key\":\"D\",\"value\":\" Chất thải nguy hại, chất thải xây dựng và chất thải không nguy hại.\"}]', 'A', 11, '2024-12-19 19:36:34', '2024-12-19 19:36:34');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (143, ' Phân loại rác thải tại nguồn?', '[{\"key\":\"A\",\"value\":\" Rác hữu cơ, rác vô cơ, rác tái chế.\"},{\"key\":\"B\",\"value\":\"Rác hữu cơ, rác tái chế, rác tái sử dụng.\"},{\"key\":\"C\",\"value\":\"  Rác thải nguy hại, rác thải hữu cơ, rác thải vô cơ.\"},{\"key\":\"D\",\"value\":\" Rác thải nguy hại, rác thải không nguy hại, rác tái chế.\"}]', 'A', 11, '2024-12-19 19:36:34', '2024-12-19 19:36:34');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (144, ' Luật hóa chất 2007 đưa ra khái niệm hóa chất nguy hiểm là?', '[{\"key\":\"A\",\"value\":\" Hóa chất có tất cả các đặc tính nguy hiểm: dễ cháy nổ, ô xy hóa cao, độc hại, ăn mòn hoặc gây tổn hại tới môi trường… \"},{\"key\":\"B\",\"value\":\" Hóa chất có đặc tính nguy hiểm: dễ cháy nổ, độc hại, ăn mòn hoặc gây tổn hại tới môi trường…\"},{\"key\":\"C\",\"value\":\"   Hóa chất được bộ y tế cảnh báo là nguy hiểm, độc hại đối với con người và môi trường sinh thái…\"},{\"key\":\"D\",\"value\":\" Hóa chất có một hoặc một số đặc tính nguy hiểm: dễ cháy nổ, ô xy hóa cao, độc hại, ăn mòn hoặc gây tổn hại tới môi trường… \"}]', 'D', 11, '2024-12-19 19:36:34', '2024-12-19 19:36:34');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (145, ' Hình ảnh bên dưới thể hiện đặc tính gì?', '[{\"key\":\"A\",\"value\":\" Chất dễ cháy.\"},{\"key\":\"B\",\"value\":\" Chất ô xy hóa.\"},{\"key\":\"C\",\"value\":\" Chất tự phản ứng.\"},{\"key\":\"D\",\"value\":\" Chất tự cháy, tự dẫn lửa.\"}]', 'B', 11, '2024-12-19 19:36:34', '2024-12-19 19:36:34');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (146, '  Hình ảnh bên dưới thể hiện đặc tính gì?', '[{\"key\":\"A\",\"value\":\" Chất ô xy hóa, Peroxit hữu cơ.\"},{\"key\":\"B\",\"value\":\"Chất ô xy hóa, chất có khả năng gây nổ.\"},{\"key\":\"C\",\"value\":\" Chất dễ cháy, Peroxit hữu cơ.\"},{\"key\":\"D\",\"value\":\" Chất dễ cháy, chất ô xy hóa.\"}]', 'C', 11, '2024-12-19 19:36:34', '2024-12-19 19:36:34');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (147, ' Ý nghĩa cốt lõi của kinh tế xanh là?', '[{\"key\":\"A\",\"value\":\" Tăng trưởng kinh tế đảm bảo đồng thời hai mục tiêu là bảo vệ môi trường sống trong sạch và bền vững.\"},{\"key\":\"B\",\"value\":\"  Tăng trưởng kinh tế đảm bảo không khai thác tài nguyên thiên nhiên, sử dụng năng lượng thay thế.\"},{\"key\":\"C\",\"value\":\"  Hạn chế tối thiểu phát thải vào môi trường, cân bằng lượng khí thải các ngành nghề.\"},{\"key\":\"D\",\"value\":\" Tăng trưởng kinh tế đồng đều tất cả các ngành nghề, đảm bảo đạt chỉ tiêu đặt ra hàng năm.\"}]', 'A', 11, '2024-12-19 19:36:34', '2024-12-19 19:36:34');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (148, ' Việt Nam bắt đầu làm quen với xu hướng phát triển kinh tế xanh của thế giới từ năm bao nhiêu?', '[{\"key\":\"A\",\"value\":\"   1999\"},{\"key\":\"B\",\"value\":\"  2000\"},{\"key\":\"C\",\"value\":\"  2001\"},{\"key\":\"D\",\"value\":\"  2010\"}]', 'B', 11, '2024-12-19 19:36:34', '2024-12-19 19:36:34');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (149, 'Ngôn ngữ lập trình C được Dennish phát triển dựa trên ngôn ngữ lập trình nào', '[{\"key\":\"A\",\"value\":\"Ngôn ngữ B\"},{\"key\":\"B\",\"value\":\"Ngôn ngữ BCPL\"},{\"key\":\"C\",\"value\":\"Ngôn ngữ DEC PDP\"},{\"key\":\"D\",\"value\":\"Ngôn ngữ B và BCPL\"}]', 'D', 13, '2024-12-19 22:49:29', '2024-12-19 22:49:29');
INSERT INTO `questions` (`question_id`, `question_content`, `answer`, `correct_answer`, `question_bank_id`, `created_at`, `updated_at`) VALUES (150, 'Ngôn ngữ lập trình được Dennish đưa ra vào năm nào', '[{\"key\":\"A\",\"value\":\"1967\"},{\"key\":\"B\",\"value\":\"1972\"},{\"key\":\"C\",\"value\":\"1970\"},{\"key\":\"D\",\"value\":\"1976\"}]', 'B', 13, '2024-12-19 22:57:17', '2024-12-19 22:57:17');
COMMIT;

-- ----------------------------
-- Table structure for result_answers
-- ----------------------------
DROP TABLE IF EXISTS `result_answers`;
CREATE TABLE `result_answers` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `is_correct` bit(1) NOT NULL,
  `student_answer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `question_id` bigint NOT NULL,
  `result_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqaieyg9kc7p3wdjd3x8fberwq` (`question_id`),
  KEY `FKuutyw4sxufhj2y5m7xp3grpv` (`result_id`),
  CONSTRAINT `FKqaieyg9kc7p3wdjd3x8fberwq` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`),
  CONSTRAINT `FKuutyw4sxufhj2y5m7xp3grpv` FOREIGN KEY (`result_id`) REFERENCES `results` (`result_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of result_answers
-- ----------------------------
BEGIN;
INSERT INTO `result_answers` (`id`, `is_correct`, `student_answer`, `question_id`, `result_id`) VALUES (20, b'0', 'B', 99, 9);
INSERT INTO `result_answers` (`id`, `is_correct`, `student_answer`, `question_id`, `result_id`) VALUES (21, b'0', 'C', 102, 9);
INSERT INTO `result_answers` (`id`, `is_correct`, `student_answer`, `question_id`, `result_id`) VALUES (22, b'1', 'C', 103, 9);
INSERT INTO `result_answers` (`id`, `is_correct`, `student_answer`, `question_id`, `result_id`) VALUES (23, b'1', 'A', 104, 9);
INSERT INTO `result_answers` (`id`, `is_correct`, `student_answer`, `question_id`, `result_id`) VALUES (24, b'0', 'C', 105, 9);
INSERT INTO `result_answers` (`id`, `is_correct`, `student_answer`, `question_id`, `result_id`) VALUES (25, b'0', 'A', 107, 9);
INSERT INTO `result_answers` (`id`, `is_correct`, `student_answer`, `question_id`, `result_id`) VALUES (26, b'0', 'A', 109, 9);
INSERT INTO `result_answers` (`id`, `is_correct`, `student_answer`, `question_id`, `result_id`) VALUES (27, b'0', 'C', 110, 9);
INSERT INTO `result_answers` (`id`, `is_correct`, `student_answer`, `question_id`, `result_id`) VALUES (28, b'0', 'C', 112, 9);
INSERT INTO `result_answers` (`id`, `is_correct`, `student_answer`, `question_id`, `result_id`) VALUES (29, b'0', 'B', 113, 9);
INSERT INTO `result_answers` (`id`, `is_correct`, `student_answer`, `question_id`, `result_id`) VALUES (30, b'0', 'B', 99, 10);
INSERT INTO `result_answers` (`id`, `is_correct`, `student_answer`, `question_id`, `result_id`) VALUES (31, b'0', 'B', 102, 10);
INSERT INTO `result_answers` (`id`, `is_correct`, `student_answer`, `question_id`, `result_id`) VALUES (32, b'0', 'A', 103, 10);
INSERT INTO `result_answers` (`id`, `is_correct`, `student_answer`, `question_id`, `result_id`) VALUES (33, b'0', 'C', 104, 10);
INSERT INTO `result_answers` (`id`, `is_correct`, `student_answer`, `question_id`, `result_id`) VALUES (34, b'0', 'A', 105, 10);
INSERT INTO `result_answers` (`id`, `is_correct`, `student_answer`, `question_id`, `result_id`) VALUES (35, b'1', 'C', 107, 10);
INSERT INTO `result_answers` (`id`, `is_correct`, `student_answer`, `question_id`, `result_id`) VALUES (36, b'0', 'A', 109, 10);
INSERT INTO `result_answers` (`id`, `is_correct`, `student_answer`, `question_id`, `result_id`) VALUES (37, b'0', 'D', 110, 10);
INSERT INTO `result_answers` (`id`, `is_correct`, `student_answer`, `question_id`, `result_id`) VALUES (38, b'0', 'B', 112, 10);
INSERT INTO `result_answers` (`id`, `is_correct`, `student_answer`, `question_id`, `result_id`) VALUES (39, b'0', 'C', 113, 10);
INSERT INTO `result_answers` (`id`, `is_correct`, `student_answer`, `question_id`, `result_id`) VALUES (40, b'1', 'D', 149, 11);
INSERT INTO `result_answers` (`id`, `is_correct`, `student_answer`, `question_id`, `result_id`) VALUES (41, b'1', 'D', 149, 12);
INSERT INTO `result_answers` (`id`, `is_correct`, `student_answer`, `question_id`, `result_id`) VALUES (42, b'0', 'C', 150, 12);
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of results
-- ----------------------------
BEGIN;
INSERT INTO `results` (`result_id`, `score`, `submitted_at`, `exam_id`, `user_id`, `total_correct`, `total_question`) VALUES (9, 0, '2024-12-19 19:48:26.122175', 9, 30, 2, 10);
INSERT INTO `results` (`result_id`, `score`, `submitted_at`, `exam_id`, `user_id`, `total_correct`, `total_question`) VALUES (10, 0, '2024-12-19 20:15:57.027234', 9, 15, 1, 10);
INSERT INTO `results` (`result_id`, `score`, `submitted_at`, `exam_id`, `user_id`, `total_correct`, `total_question`) VALUES (11, 0, '2024-12-19 22:53:19.645531', 12, 34, 1, 1);
INSERT INTO `results` (`result_id`, `score`, `submitted_at`, `exam_id`, `user_id`, `total_correct`, `total_question`) VALUES (12, 0, '2024-12-19 23:01:38.084225', 12, 32, 1, 2);
COMMIT;

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKgdlljajjmqywje8kdxft3auoy` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of roles
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for subjects
-- ----------------------------
DROP TABLE IF EXISTS `subjects`;
CREATE TABLE `subjects` (
  `subject_id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `subject_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of subjects
-- ----------------------------
BEGIN;
INSERT INTO `subjects` (`subject_id`, `created_at`, `description`, `subject_name`, `updated_at`) VALUES (14, '2024-12-19 19:13:23.341916', 'BMT11412301', 'Bảo vệ môi trường', '2024-12-19 19:13:23.341970');
INSERT INTO `subjects` (`subject_id`, `created_at`, `description`, `subject_name`, `updated_at`) VALUES (15, '2024-12-19 19:14:04.944565', 'MTA16115001', 'Tiếng anh chuyên ngành', '2024-12-19 19:14:04.944702');
INSERT INTO `subjects` (`subject_id`, `created_at`, `description`, `subject_name`, `updated_at`) VALUES (16, '2024-12-19 19:14:35.524453', 'MPL90080001', 'Pháp luật', '2024-12-19 19:14:35.524599');
INSERT INTO `subjects` (`subject_id`, `created_at`, `description`, `subject_name`, `updated_at`) VALUES (17, '2024-12-19 19:23:27.921908', 'MCN54517802', 'Nhập môn CNTT', '2024-12-19 19:23:27.922096');
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `full_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` (`user_id`, `email`, `password`, `role`, `full_name`, `created_at`, `updated_at`) VALUES (6, 'tk@example.com', 'f044b41f7a21e4e19cb39a1468d92f9c:07b6cae8e112fb0f08d877fdd6d5a0d911adac00195ed5e1a0be0347adaa800a', 'admin', 'Administrator', '2024-12-15 09:37:04', '2024-12-19 22:46:44');
INSERT INTO `users` (`user_id`, `email`, `password`, `role`, `full_name`, `created_at`, `updated_at`) VALUES (10, 'voxuanthe@gmail.com', '4d14e27c0d45785b77d271f11213230a:fb7f7dc56b7eab4888e62ff454c82a4edf0e1454b40e788434df20da26595d90', 'teacher', 'Võ Xuân Thể', '2024-12-15 10:29:52', '2024-12-19 15:51:29');
INSERT INTO `users` (`user_id`, `email`, `password`, `role`, `full_name`, `created_at`, `updated_at`) VALUES (14, '23810014@gmail.com', '17ce8748638e5cd25bf2120a0a402edb:f18581c8a6717aeeebd58b3f0d869e827b54780d1538e0d50b4aa17be3a294df', 'student', 'Lê Xuân Hoàng', '2024-12-15 23:18:47', '2024-12-19 15:55:25');
INSERT INTO `users` (`user_id`, `email`, `password`, `role`, `full_name`, `created_at`, `updated_at`) VALUES (15, '23810034@gmail.com', 'c797519506f1bdcf2dc25debcbda0f82:108c8965b8a54df069a703ac97f785a859a4e9c5a20bdd2ba9453a57ba15b821', 'student', 'Mai Thành Phát', '2024-12-15 23:18:56', '2024-12-19 15:55:01');
INSERT INTO `users` (`user_id`, `email`, `password`, `role`, `full_name`, `created_at`, `updated_at`) VALUES (16, '23810053@gmail.com', '27662988a48a6efb341f2e8f404cdd2a:103e08c6c3cf1c8bb49a5a0f4fc5a13c82dc53c07e1905727d1a293a28fb616e', 'student', 'Đào Thị Uyên', '2024-12-15 23:19:07', '2024-12-19 15:53:15');
INSERT INTO `users` (`user_id`, `email`, `password`, `role`, `full_name`, `created_at`, `updated_at`) VALUES (17, 'lekimvu@gmail.com', '514e36c9b229207fb432f9f7cc581205:91eb5ba66111d984ade583b165e20423ae21d51f694fa5bc5cd5e11e9f2ea154', 'teacher', 'Lê Kim Vũ', '2024-12-16 20:02:27', '2024-12-19 15:50:30');
INSERT INTO `users` (`user_id`, `email`, `password`, `role`, `full_name`, `created_at`, `updated_at`) VALUES (18, '23810041@gmail.com', '9654a642a78c59c126cf70918439e523:88d9c5debcfd755ef8856d89cdc0fb980d7eded20cc4a3824b7f5783694b10ea', 'student', 'Nguyễn Quang Sơn', '2024-12-16 22:38:49', '2024-12-19 15:53:44');
INSERT INTO `users` (`user_id`, `email`, `password`, `role`, `full_name`, `created_at`, `updated_at`) VALUES (19, 'caotuankhoi@gmail.com', '8b5b93d25ef8671beb1c9e0d2e9607df:f8df2dd7189aac92840f81cde00cec87eaf6e0b88912af399151bf2140e67aef', 'teacher', 'Cao Tuấn Khôi', '2024-12-16 22:42:04', '2024-12-19 15:49:10');
INSERT INTO `users` (`user_id`, `email`, `password`, `role`, `full_name`, `created_at`, `updated_at`) VALUES (20, '23810037@gmail.com', '5da8c7ffb50ab3c20960815d3f95374f:524a675fd5a09a11d5f3ef9e3517ac677873354dda78a03ad76bc96d66a093d7', 'student', 'Phạm Duy Phước', '2024-12-16 22:43:37', '2024-12-19 15:56:02');
INSERT INTO `users` (`user_id`, `email`, `password`, `role`, `full_name`, `created_at`, `updated_at`) VALUES (21, 'giaovien1@gmail.com', 'c0c6e174ce07188cf07d19ef495cf27a:98e9baa4ff6efc02e5cc4f5c428970df5b850d49aa76b329999d9e0732c75c5c', 'teacher', 'Giáo Viên 1', '2024-12-16 22:45:40', '2024-12-19 15:57:07');
INSERT INTO `users` (`user_id`, `email`, `password`, `role`, `full_name`, `created_at`, `updated_at`) VALUES (22, 'leanhnguyet@gmail.com', '6922016a516379ab3a2a42885fe65e7c:c7fbb8f0c7a6725fbe9fdc153d0c1c54900df7963dc404840afcfdd49604a22f', 'teacher', 'Lê Ánh Nguyệt', '2024-12-17 23:22:39', '2024-12-19 15:48:48');
INSERT INTO `users` (`user_id`, `email`, `password`, `role`, `full_name`, `created_at`, `updated_at`) VALUES (23, '23810010@gmail.com', '4bb9c3d5a24cc7aa06331da2b7424eea:8b997126d71b49a652bc082cdde320f085e654a44f18cb5a190230a184fc7497', 'student', 'Đỗ Trường Giang', '2024-12-17 23:22:57', '2024-12-19 15:55:39');
INSERT INTO `users` (`user_id`, `email`, `password`, `role`, `full_name`, `created_at`, `updated_at`) VALUES (24, '23810052@gmail.com', 'd6303919c2ae42e9d475b3da9aa14bf4:4ce287e3b69eaf75c667e64b8a6cb3e7210cef05e39da085c3425f6447057a48', 'student', 'Nguyễn Thị Thanh Tuyền', '2024-12-17 23:23:07', '2024-12-19 15:45:08');
INSERT INTO `users` (`user_id`, `email`, `password`, `role`, `full_name`, `created_at`, `updated_at`) VALUES (25, '23810028@gmail.com', '4aa01b58b5dba00d9b3a81222028888f:c922153e55ae21b7870fa000bb6b29f37b16ec2085d2b7daf4f0e47fec493d98', 'student', 'Trương Trọng Nhân', '2024-12-17 23:23:18', '2024-12-19 15:44:19');
INSERT INTO `users` (`user_id`, `email`, `password`, `role`, `full_name`, `created_at`, `updated_at`) VALUES (26, 'nguyentaman@gmail.com', '6b0630b805f8f2feab67c8968c3e849a:aff654d4a7131c951c81ea7d4481be7f2e29304b0403efa3040720aaae7385fe', 'teacher', 'Nguyễn Tâm An', '2024-12-18 19:19:07', '2024-12-19 15:48:25');
INSERT INTO `users` (`user_id`, `email`, `password`, `role`, `full_name`, `created_at`, `updated_at`) VALUES (27, '23610001@gmail.com', '8b8936cf4b7ec3356688226ecdccf729:87915573048dbc5caf071189c95f3a0a83d9f69493031cd14992ae36759582b5', 'student', 'Hà Ngọc Anh', '2024-12-18 19:20:01', '2024-12-19 15:44:10');
INSERT INTO `users` (`user_id`, `email`, `password`, `role`, `full_name`, `created_at`, `updated_at`) VALUES (28, '23810021@gmail.com', '128e81971915587207a9de3b921b9950:6fd27227cc4974f412f840fcac57db104d5cb2d5b12a6f7efdae2fd419fc8bca', 'student', 'Chu Tuấn Linh', '2024-12-18 19:20:34', '2024-12-19 15:44:00');
INSERT INTO `users` (`user_id`, `email`, `password`, `role`, `full_name`, `created_at`, `updated_at`) VALUES (29, '23810046@gmail.com', '0903542fde03882635c1333ae7312012:76e15385a76114fcfd1d1e98a79f2e16e5569a5189f3c6aaff9c93456b9a0e7f', 'student', 'Võ Đức Thắng', '2024-12-18 19:23:06', '2024-12-19 15:57:01');
INSERT INTO `users` (`user_id`, `email`, `password`, `role`, `full_name`, `created_at`, `updated_at`) VALUES (30, '23810026@gmail.com', '3e3602033f58ec492a6d10e1ab4d9643:ee4b3f922f8ddd97789bed8e1b0934270a7171abf2e78fb53ac65e0432377766', 'student', 'Trần Phong Nhã', '2024-12-18 20:06:23', '2024-12-19 15:43:54');
INSERT INTO `users` (`user_id`, `email`, `password`, `role`, `full_name`, `created_at`, `updated_at`) VALUES (31, '23610008@gmail.com', '06002dcb9cee5ca1b0f7aa98dbfee391:456b479b91221291da705263f448e31b074d13c167ee777928ecf652b1698315', 'student', 'Đào Xuân Thành', '2024-12-18 20:20:49', '2024-12-19 15:43:42');
INSERT INTO `users` (`user_id`, `email`, `password`, `role`, `full_name`, `created_at`, `updated_at`) VALUES (32, '23610012@gmail.com', 'd3809e4f07af4c3327b6c7d8ad283697:0503726edd13a49d42849df37a8e6a4ff8054fee2564d2a10eb2ae2c021e46e3', 'student', 'Phạm Thanh Tùng', '2024-12-19 15:39:20', '2024-12-19 15:43:29');
INSERT INTO `users` (`user_id`, `email`, `password`, `role`, `full_name`, `created_at`, `updated_at`) VALUES (33, '23810042@gmail.com', 'c6c938f811f34bf782a40406b9f8817b:f08dadf5f0e6e24fd37354941e772a400bf08181a34812b76f481937eeecfe50', 'student', 'Bùi Tấn Tài', '2024-12-19 15:40:59', '2024-12-19 15:45:41');
INSERT INTO `users` (`user_id`, `email`, `password`, `role`, `full_name`, `created_at`, `updated_at`) VALUES (34, '23810023@gmail.com', '52b15879604b585bbeb6a1a299ef5c6a:1080b25744b282b938ed25adc30a8b60b968287035772ac642e3a00f5472f454', 'student', 'Phan Hải My', '2024-12-19 15:46:38', '2024-12-19 15:46:38');
INSERT INTO `users` (`user_id`, `email`, `password`, `role`, `full_name`, `created_at`, `updated_at`) VALUES (35, 'admin@hcmute.edu.vn', '69434598639a286ad7d20348ee3f4a58:4f5cdd80043b94747ecf855dedcd5e6eb4db57756319e7c3a5ac4a33a9807395', 'admin', 'Administrator', '2024-12-19 19:25:46', '2024-12-19 12:26:11');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
