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

 Date: 17/12/2024 00:14:03
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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of class_students
-- ----------------------------
BEGIN;
INSERT INTO `class_students` (`id`, `class_id`, `student_id`) VALUES (34, 1, 15);
INSERT INTO `class_students` (`id`, `class_id`, `student_id`) VALUES (35, 1, 14);
INSERT INTO `class_students` (`id`, `class_id`, `student_id`) VALUES (36, 1, 16);
INSERT INTO `class_students` (`id`, `class_id`, `student_id`) VALUES (37, 2, 16);
INSERT INTO `class_students` (`id`, `class_id`, `student_id`) VALUES (38, 3, 16);
INSERT INTO `class_students` (`id`, `class_id`, `student_id`) VALUES (39, 6, 18);
INSERT INTO `class_students` (`id`, `class_id`, `student_id`) VALUES (40, 6, 20);
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
INSERT INTO `classes` (`class_id`, `class_name`, `subject_id`, `teacher_id`, `created_at`, `updated_at`) VALUES (2, '11A2', 3, 10, '2024-12-15 21:13:18', '2024-12-16 22:27:14');
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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of exam_questions
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for exam_results
-- ----------------------------
DROP TABLE IF EXISTS `exam_results`;
CREATE TABLE `exam_results` (
  `result_id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `exam_id` bigint NOT NULL,
  `score` int DEFAULT NULL,
  `submitted_at` datetime NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`result_id`) USING BTREE,
  KEY `FKtf85ht7yquiorwjx2xbdx3fxw` (`exam_id`),
  KEY `FKt2jcn29o332cpiv7s7h3o877e` (`user_id`),
  CONSTRAINT `FKt2jcn29o332cpiv7s7h3o877e` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `FKtf85ht7yquiorwjx2xbdx3fxw` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`exam_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of exam_results
-- ----------------------------
BEGIN;
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
INSERT INTO `exams` (`exam_id`, `exam_name`, `subject_id`, `class_id`, `created_by`, `duration`, `created_at`, `updated_at`) VALUES (1, 'exam 12', 3, 1, 6, 1, '2024-12-15 21:27:43', '2024-12-16 20:35:27');
INSERT INTO `exams` (`exam_id`, `exam_name`, `subject_id`, `class_id`, `created_by`, `duration`, `created_at`, `updated_at`) VALUES (2, 'Bai thi 1', 4, 1, 6, 30, '2024-12-15 22:10:45', '2024-12-16 19:59:59');
INSERT INTO `exams` (`exam_id`, `exam_name`, `subject_id`, `class_id`, `created_by`, `duration`, `created_at`, `updated_at`) VALUES (3, 'TK Exam', 9, 2, 6, 30, '2024-12-16 22:51:47', '2024-12-16 22:51:47');
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of question_banks
-- ----------------------------
BEGIN;
INSERT INTO `question_banks` (`question_bank_id`, `bank_name`, `created_at`, `is_public`, `created_by`) VALUES (1, 'Ngân hàng câu hỏi Toán', '2024-12-14 17:11:18.936110', b'1', 6);
INSERT INTO `question_banks` (`question_bank_id`, `bank_name`, `created_at`, `is_public`, `created_by`) VALUES (2, 'Ngân hàng câu hỏi Văn', '2024-12-14 17:13:40.807487', b'1', 6);
INSERT INTO `question_banks` (`question_bank_id`, `bank_name`, `created_at`, `is_public`, `created_by`) VALUES (3, 'Ngân hàng câu hỏi địa', '2024-12-14 17:21:02.517431', b'1', 6);
INSERT INTO `question_banks` (`question_bank_id`, `bank_name`, `created_at`, `is_public`, `created_by`) VALUES (4, 'niu', '2024-12-15 21:01:20.754973', b'0', 6);
INSERT INTO `question_banks` (`question_bank_id`, `bank_name`, `created_at`, `is_public`, `created_by`) VALUES (7, 'Ngân hàng câu hỏi Hoá', '2024-12-16 22:46:31.246793', b'0', 6);
COMMIT;

-- ----------------------------
-- Table structure for questions
-- ----------------------------
DROP TABLE IF EXISTS `questions`;
CREATE TABLE `questions` (
  `question_id` bigint NOT NULL AUTO_INCREMENT,
  `question_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `answer` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `correct_answer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `question_bank_id` bigint NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`question_id`) USING BTREE,
  KEY `FK001` (`question_bank_id`),
  CONSTRAINT `FK001` FOREIGN KEY (`question_bank_id`) REFERENCES `question_banks` (`question_bank_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of result_answers
-- ----------------------------
BEGIN;
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
  PRIMARY KEY (`result_id`),
  KEY `FKeow9kom5hrbhv6jhq82bqe68k` (`exam_id`),
  KEY `FKxtl9ahma532if6r68yvgo7ck` (`user_id`),
  CONSTRAINT `FKeow9kom5hrbhv6jhq82bqe68k` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`exam_id`),
  CONSTRAINT `FKxtl9ahma532if6r68yvgo7ck` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of results
-- ----------------------------
BEGIN;
INSERT INTO `results` (`result_id`, `score`, `submitted_at`, `exam_id`, `user_id`) VALUES (1, 2, '2024-12-16 20:37:21.642446', 1, 16);
INSERT INTO `results` (`result_id`, `score`, `submitted_at`, `exam_id`, `user_id`) VALUES (2, 0, '2024-12-16 22:08:04.782756', 1, 16);
INSERT INTO `results` (`result_id`, `score`, `submitted_at`, `exam_id`, `user_id`) VALUES (3, 1, '2024-12-16 22:58:29.507500', 4, 20);
INSERT INTO `results` (`result_id`, `score`, `submitted_at`, `exam_id`, `user_id`) VALUES (4, 1, '2024-12-16 22:58:39.218650', 4, 20);
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
