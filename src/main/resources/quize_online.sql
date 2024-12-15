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

 Date: 15/12/2024 11:37:36
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of class_students
-- ----------------------------
BEGIN;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of classes
-- ----------------------------
BEGIN;
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
  KEY `FK3312` (`subject_id`),
  CONSTRAINT `FK3312` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `created_at` datetime(6) DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `subject_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of subjects
-- ----------------------------
BEGIN;
INSERT INTO `subjects` (`subject_id`, `created_at`, `description`, `subject_name`, `updated_at`) VALUES (1, NULL, 'IT 2024', 'CNTT2 123123', '2024-12-15 11:36:04.395662');
INSERT INTO `subjects` (`subject_id`, `created_at`, `description`, `subject_name`, `updated_at`) VALUES (2, NULL, '123123123', 'CNTT 22123123123', '2024-12-15 11:36:11.949030');
INSERT INTO `subjects` (`subject_id`, `created_at`, `description`, `subject_name`, `updated_at`) VALUES (3, '2024-12-15 11:35:01.744690', 'OOPPPP', 'OOP', '2024-12-15 11:35:01.744705');
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` (`user_id`, `email`, `password`, `role`, `full_name`, `created_at`, `updated_at`) VALUES (1, 'user@example.com', '$2a$10$0N2d.IDmBvPfZWti7lMB4OMO1nIiDIGL17ZSKZwdOFr6yhyga0io2', 'student', 'John Doe 2', '2024-12-06 20:08:11', '2024-12-15 10:37:16');
INSERT INTO `users` (`user_id`, `email`, `password`, `role`, `full_name`, `created_at`, `updated_at`) VALUES (3, 'user2@example.com', '$2a$10$3WtbJENJfIyBkowbrJkaT.xpTiK0EZI.bLm6kQInpaigR4jhGvnza', 'student', 'John Doe 3', '2024-12-06 20:09:03', '2024-12-15 10:38:03');
INSERT INTO `users` (`user_id`, `email`, `password`, `role`, `full_name`, `created_at`, `updated_at`) VALUES (4, 'user3@example.com', '$2a$10$T57rs1AOgP2B/Lk..aBb3uXMf3MetEgPuaaU6Loor9WxK4o/IXjXS', 'student', 'peter', '2024-12-06 22:01:11', '2024-12-15 10:38:37');
INSERT INTO `users` (`user_id`, `email`, `password`, `role`, `full_name`, `created_at`, `updated_at`) VALUES (5, 'admin2@example.com', 'acf4b61ea50a85e5326b0649476dbc24:425a018ecdf2460c3334f55aec754a9c92ccdc54537a04a96ed17401fe8dc425', 'admin', 'Administrator', '2024-12-15 09:35:04', '2024-12-15 09:35:04');
INSERT INTO `users` (`user_id`, `email`, `password`, `role`, `full_name`, `created_at`, `updated_at`) VALUES (6, 'tk@example.com', '5cfda047b5444471d6e9b36b77daf33b:47d35763ef8e403bd1bdadc4bd506a63c488805e73a2c58be250c2759c8b01da', 'admin', 'TK', '2024-12-15 09:37:04', '2024-12-15 09:37:04');
INSERT INTO `users` (`user_id`, `email`, `password`, `role`, `full_name`, `created_at`, `updated_at`) VALUES (7, 'student1@zz.zz', '1f6ffdadc5db5e18d2d876e8be21cc08:58b25a2e18990f74c8578dd9fcd152cda16414aa647208f7aeba4d5b482be578', 'student', 'test', '2024-12-15 10:17:39', '2024-12-15 10:17:39');
INSERT INTO `users` (`user_id`, `email`, `password`, `role`, `full_name`, `created_at`, `updated_at`) VALUES (8, 'zz@zz.zzz', '65b124dadda2941edf7b717e4d385461:127a2a6d351fb40e47dc17a8e92ce05744d49c971ad5b08d77ae57d4bdf95006', 'student', 'test', '2024-12-15 10:22:45', '2024-12-15 10:22:45');
INSERT INTO `users` (`user_id`, `email`, `password`, `role`, `full_name`, `created_at`, `updated_at`) VALUES (9, 'test2@zz.zz', '1a79ba17b32c2991ee592f4c8ef85866:ec59a97ceb710369a58008117a48f46de3d84ebab011f29b56297a9271a85829', 'student', '213', '2024-12-15 10:27:47', '2024-12-15 10:27:47');
INSERT INTO `users` (`user_id`, `email`, `password`, `role`, `full_name`, `created_at`, `updated_at`) VALUES (10, 'hihih@zz.zzz', '4d14e27c0d45785b77d271f11213230a:fb7f7dc56b7eab4888e62ff454c82a4edf0e1454b40e788434df20da26595d90', 'teacher', 'teaher', '2024-12-15 10:29:52', '2024-12-15 10:29:52');
INSERT INTO `users` (`user_id`, `email`, `password`, `role`, `full_name`, `created_at`, `updated_at`) VALUES (11, 'hihii@mm.zzz', 'a14e2d2a30745b4b143272609dee9c93:cba1c30a53406777da266f18a205c0762d5bd20128ecff5970e1af65fe8ed056', 'student', 'Peter parker', '2024-12-15 10:50:25', '2024-12-15 10:50:43');
INSERT INTO `users` (`user_id`, `email`, `password`, `role`, `full_name`, `created_at`, `updated_at`) VALUES (12, 'hihih@zzz.xxzzz', '32ebd3b19de4212ab1ff33d2a911b3d5:70bdffe3d08634aed9a504670db576f3f26c9108f0a11bdd2bd17d23e67d185d', 'student', '123213 adadadadad', '2024-12-15 11:28:48', '2024-12-15 11:28:59');
INSERT INTO `users` (`user_id`, `email`, `password`, `role`, `full_name`, `created_at`, `updated_at`) VALUES (13, 'niuniu@zz.zshd', '4921c57dc27bceaa888db90382d17a19:e220f9d19b37e0b5a043ba6b2323d1e233635c5b1f9a12baeacfde7dd11c6dd6', 'student', '21342 adad', '2024-12-15 11:31:16', '2024-12-15 11:31:16');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
