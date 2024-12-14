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

 Date: 14/12/2024 20:20:01
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of class_students
-- ----------------------------
BEGIN;
INSERT INTO `class_students` (`id`, `class_id`, `student_id`) VALUES (1, 3, 3);
INSERT INTO `class_students` (`id`, `class_id`, `student_id`) VALUES (2, 3, 4);
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
  KEY `FKcaops3x4cgf4peavqc3gh87k1` (`subject_id`),
  KEY `FK4tv5efpqhlo8xg8l8dpba8v75` (`teacher_id`),
  CONSTRAINT `FK4tv5efpqhlo8xg8l8dpba8v75` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `FKcaops3x4cgf4peavqc3gh87k1` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of classes
-- ----------------------------
BEGIN;
INSERT INTO `classes` (`class_id`, `class_name`, `subject_id`, `teacher_id`, `created_at`, `updated_at`) VALUES (3, 'Lop 2', 1, 3, '2024-12-11 20:19:51', '2024-12-11 20:19:51');
INSERT INTO `classes` (`class_id`, `class_name`, `subject_id`, `teacher_id`, `created_at`, `updated_at`) VALUES (4, 'Lop 2', 1, 3, '2024-12-11 22:36:10', '2024-12-11 22:36:10');
INSERT INTO `classes` (`class_id`, `class_name`, `subject_id`, `teacher_id`, `created_at`, `updated_at`) VALUES (5, 'Lop 2', 1, 3, '2024-12-14 15:59:07', '2024-12-14 15:59:07');
INSERT INTO `classes` (`class_id`, `class_name`, `subject_id`, `teacher_id`, `created_at`, `updated_at`) VALUES (6, 'Lop Moi', 1, 3, '2024-12-14 19:32:43', '2024-12-14 19:32:43');
COMMIT;

-- ----------------------------
-- Table structure for exam_questions
-- ----------------------------
DROP TABLE IF EXISTS `exam_questions`;
CREATE TABLE `exam_questions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `point` int NOT NULL,
  `exam_id` bigint NOT NULL,
  `question_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5cd6sjmccb11rrwpyabyc81c0` (`exam_id`),
  KEY `FKs0t1710in6q97whp93ggrs1wg` (`question_id`),
  CONSTRAINT `FK5cd6sjmccb11rrwpyabyc81c0` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`exam_id`),
  CONSTRAINT `FKs0t1710in6q97whp93ggrs1wg` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `result_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `exam_id` int NOT NULL,
  `score` int DEFAULT NULL,
  `submitted_at` datetime NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`result_id`) USING BTREE
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
  KEY `FKopre4n7j7fpxqbtbwpv8ywn1y` (`subject_id`),
  CONSTRAINT `FKa9pp7fvh0i6302peis1x76ots` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `FKkq9895f263nw6qxibikek0t40` FOREIGN KEY (`class_id`) REFERENCES `classes` (`class_id`),
  CONSTRAINT `FKopre4n7j7fpxqbtbwpv8ywn1y` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of exams
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for map_question_and_exam
-- ----------------------------
DROP TABLE IF EXISTS `map_question_and_exam`;
CREATE TABLE `map_question_and_exam` (
  `exam_id` int NOT NULL,
  `question_id` int NOT NULL,
  `point` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of map_question_and_exam
-- ----------------------------
BEGIN;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of question_banks
-- ----------------------------
BEGIN;
INSERT INTO `question_banks` (`question_bank_id`, `bank_name`, `created_at`, `is_public`, `created_by`) VALUES (1, 'Ngân hàng câu hỏi Toán', '2024-12-14 17:11:18.936110', b'1', 1);
INSERT INTO `question_banks` (`question_bank_id`, `bank_name`, `created_at`, `is_public`, `created_by`) VALUES (2, 'Ngân hàng câu hỏi Văn', '2024-12-14 17:13:40.807487', b'1', 1);
INSERT INTO `question_banks` (`question_bank_id`, `bank_name`, `created_at`, `is_public`, `created_by`) VALUES (3, 'Ngân hàng câu hỏi địa', '2024-12-14 17:21:02.517431', b'1', 1);
COMMIT;

-- ----------------------------
-- Table structure for questions
-- ----------------------------
DROP TABLE IF EXISTS `questions`;
CREATE TABLE `questions` (
  `question_id` bigint NOT NULL AUTO_INCREMENT,
  `question` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_general_ci COMMENT 'store json file',
  `correct_answer` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `question_bank_id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `question_content` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `bank_id` bigint NOT NULL,
  PRIMARY KEY (`question_id`),
  KEY `FKep9feemoosshrpb95idh0xw1q` (`bank_id`),
  CONSTRAINT `FKep9feemoosshrpb95idh0xw1q` FOREIGN KEY (`bank_id`) REFERENCES `question_banks` (`question_bank_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of questions
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of results
-- ----------------------------
BEGIN;
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
  `subject_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of subjects
-- ----------------------------
BEGIN;
INSERT INTO `subjects` (`subject_id`, `subject_name`, `description`, `created_at`, `updated_at`) VALUES (1, 'Mon 1', 'Asdasdad', '2024-12-10 20:20:48', '2024-12-10 20:20:53');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` (`user_id`, `email`, `password`, `role`, `full_name`, `created_at`, `updated_at`) VALUES (1, 'user@example.com', '$2a$10$0N2d.IDmBvPfZWti7lMB4OMO1nIiDIGL17ZSKZwdOFr6yhyga0io2', 'student', 'John Doe', '2024-12-06 20:08:11', NULL);
INSERT INTO `users` (`user_id`, `email`, `password`, `role`, `full_name`, `created_at`, `updated_at`) VALUES (3, 'user2@example.com', '$2a$10$3WtbJENJfIyBkowbrJkaT.xpTiK0EZI.bLm6kQInpaigR4jhGvnza', 'student', 'John Doe', '2024-12-06 20:09:03', NULL);
INSERT INTO `users` (`user_id`, `email`, `password`, `role`, `full_name`, `created_at`, `updated_at`) VALUES (4, 'user3@example.com', '$2a$10$T57rs1AOgP2B/Lk..aBb3uXMf3MetEgPuaaU6Loor9WxK4o/IXjXS', 'student', 'John Doe', '2024-12-06 22:01:11', NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
