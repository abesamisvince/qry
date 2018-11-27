-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 21, 2018 at 09:21 AM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 5.6.36

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `qry_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `questionnaires`
--

CREATE TABLE `questionnaires` (
  `id` int(11) NOT NULL,
  `questionnaire` varchar(256) NOT NULL,
  `program` varchar(256) NOT NULL,
  `for_` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `curr_school` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `questionnaires`
--

INSERT INTO `questionnaires` (`id`, `questionnaire`, `program`, `for_`, `status`, `curr_school`) VALUES
(1, 'TEACHNOLOGY MID-YEAR EVALUATIONS\r\n(Students)', 'Teachnology', 'Teachnology', 1, ''),
(2, 'TEACHNOLOGY MID-YEAR EVALUATIONS\r\n(Teachers)', 'Teachnology', 'Teachnology', 1, ''),
(3, 'HUB/NGS MID-YEAR EVALUATIONS\r\n(Students)', 'NGS/HUB', 'NGS/HUB', 1, ''),
(4, 'HUB/NGS MID-YEAR EVALUATIONS\r\n(Teachers)', 'NGS/HUB', 'NGS/HUB', 1, ''),
(5, 'HUB/NGS MID-YEAR EVALUATIONS\r\n(Teachers) (Without CLE Online)', 'NGS/HUB', 'NGS/HUB', 1, ''),
(6, 'HUB/NGS MID-YEAR EVALUATIONS\r\n(Students) (Without CLE Online)', 'NGS/HUB', 'NGS/HUB', 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `question_type`
--

CREATE TABLE `question_type` (
  `id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `type_` varchar(100) NOT NULL,
  `has_choices` tinyint(1) NOT NULL,
  `response_tbl` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question_type`
--

INSERT INTO `question_type` (`id`, `type_id`, `type_`, `has_choices`, `response_tbl`) VALUES
(1, 1, 'Yes/No', 0, 'response_bool'),
(2, 2, 'Text Box', 0, 'response_text'),
(3, 3, 'Radio Buttons', 1, 'resp_single'),
(4, 4, 'Check Boxes', 1, 'resp_multiple'),
(5, 5, 'Dropdown Box', 1, 'resp_single'),
(6, 6, 'Rate (scale 1..5)', 1, 'response_rank'),
(7, 7, 'Numeric', 0, 'response_text'),
(8, 8, 'Section Text', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `quest_dependency`
--

CREATE TABLE `quest_dependency` (
  `id` bigint(10) NOT NULL,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `surveyid` bigint(10) NOT NULL,
  `dependquestionid` bigint(10) NOT NULL DEFAULT '0',
  `dependchoiceid` bigint(10) NOT NULL DEFAULT '0',
  `dependlogic` tinyint(2) NOT NULL DEFAULT '0',
  `dependandor` varchar(4) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Holds the combined dependencies per question to navigate in ' ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `quest_dependency`
--

INSERT INTO `quest_dependency` (`id`, `questionid`, `surveyid`, `dependquestionid`, `dependchoiceid`, `dependlogic`, `dependandor`) VALUES
(1, 20, 2, 12, 1, 0, ''),
(2, 20, 2, 12, 2, 0, ''),
(3, 21, 2, 13, 1, 0, ''),
(4, 21, 2, 13, 2, 0, ''),
(5, 22, 2, 14, 1, 0, ''),
(6, 22, 2, 14, 2, 0, ''),
(7, 23, 2, 15, 1, 0, ''),
(8, 23, 2, 15, 2, 0, ''),
(9, 24, 2, 16, 1, 0, ''),
(10, 24, 2, 16, 2, 0, ''),
(11, 25, 2, 17, 1, 0, ''),
(12, 25, 2, 17, 2, 0, ''),
(13, 26, 2, 18, 1, 0, ''),
(14, 26, 2, 18, 2, 0, ''),
(15, 27, 2, 19, 1, 0, ''),
(16, 27, 2, 19, 2, 0, ''),
(17, 28, 2, 12, 3, 0, ''),
(18, 28, 2, 12, 4, 0, ''),
(19, 28, 2, 12, 5, 0, ''),
(20, 29, 2, 13, 3, 0, ''),
(21, 29, 2, 13, 4, 0, ''),
(22, 29, 2, 13, 5, 0, ''),
(23, 30, 2, 14, 3, 0, ''),
(24, 30, 2, 14, 4, 0, ''),
(25, 30, 2, 14, 5, 0, ''),
(26, 31, 2, 15, 3, 0, ''),
(27, 31, 2, 15, 4, 0, ''),
(28, 31, 2, 15, 5, 0, ''),
(29, 32, 2, 16, 3, 0, ''),
(30, 32, 2, 16, 4, 0, ''),
(31, 32, 2, 16, 5, 0, ''),
(32, 33, 2, 17, 3, 0, ''),
(33, 33, 2, 17, 4, 0, ''),
(34, 33, 2, 17, 5, 0, ''),
(35, 34, 2, 18, 3, 0, ''),
(36, 34, 2, 18, 4, 0, ''),
(37, 34, 2, 18, 5, 0, ''),
(38, 35, 2, 19, 3, 0, ''),
(39, 35, 2, 19, 4, 0, ''),
(40, 35, 2, 19, 5, 0, ''),
(41, 36, 2, 28, 1, 0, ''),
(42, 36, 2, 28, 2, 0, ''),
(43, 37, 2, 29, 1, 0, ''),
(44, 37, 2, 29, 2, 0, ''),
(45, 38, 2, 30, 1, 0, ''),
(46, 38, 2, 30, 2, 0, ''),
(47, 39, 2, 31, 1, 0, ''),
(48, 39, 2, 31, 2, 0, ''),
(49, 40, 2, 32, 1, 0, ''),
(50, 40, 2, 32, 2, 0, ''),
(51, 41, 2, 33, 1, 0, ''),
(52, 41, 2, 33, 2, 0, ''),
(53, 42, 2, 34, 1, 0, ''),
(54, 42, 2, 34, 2, 0, ''),
(55, 43, 2, 35, 1, 0, ''),
(56, 43, 2, 35, 2, 0, ''),
(57, 82, 2, 81, 1, 0, ''),
(58, 83, 2, 81, 2, 0, ''),
(59, 85, 2, 84, 1, 0, ''),
(61, 122, 3, 121, 1, 0, ''),
(62, 122, 3, 121, 2, 0, ''),
(63, 122, 3, 121, 3, 0, ''),
(64, 122, 3, 121, 4, 0, ''),
(65, 122, 3, 121, 5, 0, ''),
(66, 122, 3, 121, 6, 0, ''),
(67, 123, 3, 121, 2, 0, ''),
(68, 123, 3, 121, 3, 0, ''),
(69, 123, 3, 121, 4, 0, ''),
(70, 123, 3, 121, 5, 0, ''),
(71, 123, 3, 121, 6, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `quest_question`
--

CREATE TABLE `quest_question` (
  `id` int(11) NOT NULL,
  `quest_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type_id` int(11) NOT NULL,
  `question` varchar(255) NOT NULL,
  `required` tinyint(1) NOT NULL,
  `position` int(11) NOT NULL,
  `min` int(11) NOT NULL,
  `max` int(11) NOT NULL,
  `status_` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quest_question`
--

INSERT INTO `quest_question` (`id`, `quest_id`, `name`, `type_id`, `question`, `required`, `position`, `min`, `max`, `status_`) VALUES
(1, 1, 'Grade Level', 3, 'Grade Level', 1, 1, 1, 1, 1),
(2, 1, 'Which of the following learning materials  do you like your teachers to use more often in class? (Choose 5)', 4, 'Which of the following learning materials  do you like your teachers to use more often in class? (Choose 5)', 1, 2, 5, 5, 1),
(3, 1, 'Rate how helpful the following learning materials are in understanding your lessons better.', 6, 'Rate how helpful the following learning materials are in understanding your lessons better.', 1, 3, 0, 0, 1),
(4, 1, 'When my teacher uses the TV to project instructional materials, I...', 6, 'When my teacher uses the TV to project instructional materials, I...', 1, 4, 0, 0, 1),
(5, 1, 'As a student, I use the television in our classroom to...', 6, 'As a student, I use the television in our classroom to...', 1, 5, 0, 0, 1),
(6, 1, 'From where I am seated...', 6, 'From where I am seated...', 1, 6, 0, 0, 1),
(7, 1, 'Commendations (What is/are commendable about the Aralinks Teachnology program?)', 2, 'Commendations (What is/are commendable about the Aralinks Teachnology program?)', 1, 7, 0, 0, 1),
(8, 1, 'Recommendations  (What do you think will improve your experience in using the Aralinks Teachnology program?)', 2, 'Recommendations (What do you think will improve your experience in using the Aralinks Teachnology program?)', 1, 8, 0, 0, 1),
(9, 2, 'Grade Level', 4, 'Grade Level', 1, 1, 1, 14, 1),
(10, 2, 'Which subject/s do you teach this school year?', 4, 'Which subject/s do you teach this school year?', 1, 2, 1, 20, 1),
(11, 2, 'Years in Using the Program 0-1-2', 3, 'Years in Using the Program', 1, 3, 0, 0, 1),
(12, 2, 'How often were you able to use the following?', 3, 'TV', 1, 4, 0, 0, 1),
(13, 2, 'How often were you able to use the following?', 3, 'Netbook', 1, 5, 0, 0, 1),
(14, 2, 'How often were you able to use the following?', 3, 'iSpeak (Bluetooth Speaker and Mic)', 1, 6, 0, 0, 1),
(15, 2, 'How often were you able to use the following?', 3, 'TeachLab (networked desktop computers)', 1, 7, 0, 0, 1),
(16, 2, 'How often were you able to use the following?', 3, 'Network-Attached Storage (NAS)', 1, 8, 0, 0, 1),
(17, 2, 'How often were you able to use the following?', 3, 'Teachnology Authoring Tools (TATs)', 1, 9, 0, 0, 1),
(18, 2, 'How often were you able to use the following?', 3, 'Images', 1, 10, 0, 0, 1),
(19, 2, 'How often were you able to use the following?', 3, 'Interactive Activities and Assessments', 1, 11, 0, 0, 1),
(20, 2, '1a If Rarely/Never Why did you rarely/never use the following:', 4, 'TV', 1, 12, 1, 50, 1),
(21, 2, '1a If Rarely/Never Why did you rarely/never use the following:', 4, 'Netbook', 1, 13, 1, 50, 1),
(22, 2, '1a If Rarely/Never Why did you rarely/never use the following:', 4, 'iSpeak (Bluetooth Speaker and Mic)', 1, 14, 1, 50, 1),
(23, 2, '1a If Rarely/Never Why did you rarely/never use the following:', 4, 'TeachLab (networked desktop computers)', 1, 15, 1, 50, 1),
(24, 2, '1a If Rarely/Never Why did you rarely/never use the following:', 4, 'Network-Attached Storage (NAS)', 1, 16, 1, 50, 1),
(25, 2, '1a If Rarely/Never Why did you rarely/never use the following:', 4, 'Teachnology Authoring Tools (TATs)', 1, 17, 1, 50, 1),
(26, 2, '1a If Rarely/Never Why did you rarely/never use the following:', 4, 'Images', 1, 18, 1, 50, 1),
(27, 2, '1a If Rarely/Never Why did you rarely/never use the following:', 4, 'Interactive Activities and Assessments', 1, 19, 1, 50, 1),
(28, 2, 'Sometimes-Always Rate your level of satisfaction in using the following:', 3, 'TV', 1, 12, 0, 0, 1),
(29, 2, 'Sometimes-Always Rate your level of satisfaction in using the following:', 3, 'Netbook', 1, 13, 0, 0, 1),
(30, 2, 'Sometimes-Always Rate your level of satisfaction in using the following:', 3, 'iSpeak (Bluetooth Speaker and Mic)', 1, 14, 0, 0, 1),
(31, 2, 'Sometimes-Always Rate your level of satisfaction in using the following:', 3, 'TeachLab (networked desktop computers)', 1, 15, 0, 0, 1),
(32, 2, 'Sometimes-Always Rate your level of satisfaction in using the following:', 3, 'Network-Attached Storage (NAS)', 1, 16, 0, 0, 1),
(33, 2, 'Sometimes-Always Rate your level of satisfaction in using the following:', 3, 'Teachnology Authoring Tools (TATs)', 1, 17, 0, 0, 1),
(34, 2, 'Sometimes-Always Rate your level of satisfaction in using the following:', 3, 'Images', 1, 18, 0, 0, 1),
(35, 2, 'Sometimes-Always Rate your level of satisfaction in using the following:', 3, 'Interactive Activities and Assessments', 1, 19, 0, 0, 1),
(36, 2, 'For VD and D Why are you dissatisfied/very dissatisfied in using the following:', 4, 'TV', 1, 20, 1, 20, 1),
(37, 2, 'For VD and D Why are you dissatisfied/very dissatisfied in using the following:', 4, 'Netbook', 1, 21, 1, 20, 1),
(38, 2, 'For VD and D Why are you dissatisfied/very dissatisfied in using the following:', 4, 'iSpeak (Bluetooth Speaker and Mic)', 1, 22, 1, 20, 1),
(39, 2, 'For VD and D Why are you dissatisfied/very dissatisfied in using the following:', 4, 'TeachLab (networked desktop computers)', 1, 23, 1, 20, 1),
(40, 2, 'For VD and D Why are you dissatisfied/very dissatisfied in using the following:', 4, 'Network-Attached Storage (NAS)', 1, 24, 1, 20, 1),
(41, 2, 'For VD and D Why are you dissatisfied/very dissatisfied in using the following:', 4, 'Teachnology Authoring Tools (TATs)	', 1, 25, 1, 20, 1),
(42, 2, 'For VD and D Why are you dissatisfied/very dissatisfied in using the following:', 4, 'Images', 1, 26, 1, 20, 1),
(43, 2, 'For VD and D Why are you dissatisfied/very dissatisfied in using the following:', 4, 'Interactive Activities and Assessments', 1, 27, 1, 20, 1),
(44, 2, 'For 1', 8, 'How often were you able to use the following?', 0, 12, 0, 0, 1),
(45, 2, 'For 1', 8, 'How often were you able to use the following?', 0, 13, 0, 0, 1),
(46, 2, 'For 1', 8, 'How often were you able to use the following?', 0, 14, 0, 0, 1),
(47, 2, 'For 1', 8, 'How often were you able to use the following?', 0, 15, 0, 0, 1),
(48, 2, 'For 1', 8, 'How often were you able to use the following?', 0, 16, 0, 0, 1),
(49, 2, 'For 1', 8, 'How often were you able to use the following?', 0, 17, 0, 0, 1),
(50, 2, 'For 1', 8, 'How often were you able to use the following?', 0, 18, 0, 0, 1),
(51, 2, 'For 1', 8, 'How often were you able to use the following?', 0, 19, 0, 0, 1),
(52, 2, 'For 2', 8, 'Why did you rarely/never use the following:', 0, 20, 0, 0, 1),
(53, 2, 'For 2', 8, 'Why did you rarely/never use the following:', 0, 21, 0, 0, 1),
(54, 2, 'For 2', 8, 'Why did you rarely/never use the following:', 0, 22, 0, 0, 1),
(55, 2, 'For 2', 8, 'Why did you rarely/never use the following:', 0, 23, 0, 0, 1),
(56, 2, 'For 2', 8, 'Why did you rarely/never use the following:', 0, 24, 0, 0, 1),
(57, 2, 'For 2', 8, 'Why did you rarely/never use the following:', 0, 25, 0, 0, 1),
(58, 2, 'For 2', 8, 'Why did you rarely/never use the following:', 0, 26, 0, 0, 1),
(59, 2, 'For 2', 8, 'Why did you rarely/never use the following:', 0, 27, 0, 0, 1),
(60, 2, 'For 2B', 8, 'Rate your level of satisfaction in using the following:', 0, 28, 0, 0, 1),
(61, 2, 'For 2B', 8, 'Rate your level of satisfaction in using the following:', 0, 29, 0, 0, 1),
(62, 2, 'For 2B', 8, 'Rate your level of satisfaction in using the following:', 0, 30, 0, 0, 1),
(63, 2, 'For 2B', 8, 'Rate your level of satisfaction in using the following:', 0, 31, 0, 0, 1),
(64, 2, 'For 2B', 8, 'Rate your level of satisfaction in using the following:', 0, 32, 0, 0, 1),
(65, 2, 'For 2B', 8, 'Rate your level of satisfaction in using the following:', 0, 33, 0, 0, 1),
(66, 2, 'For 2B', 8, 'Rate your level of satisfaction in using the following:', 0, 34, 0, 0, 1),
(67, 2, 'For 2B', 8, 'Rate your level of satisfaction in using the following:', 0, 35, 0, 0, 1),
(68, 2, 'For 3', 8, 'Why are you dissatisfied/very dissatisfied in using the following:', 0, 36, 0, 0, 1),
(69, 2, 'For 3', 8, 'Why are you dissatisfied/very dissatisfied in using the following:', 0, 37, 0, 0, 1),
(70, 2, 'For 3', 8, 'Why are you dissatisfied/very dissatisfied in using the following:', 0, 38, 0, 0, 1),
(71, 2, 'For 3', 8, 'Why are you dissatisfied/very dissatisfied in using the following:', 0, 39, 0, 0, 1),
(72, 2, 'For 3', 8, 'Why are you dissatisfied/very dissatisfied in using the following:', 0, 40, 0, 0, 1),
(73, 2, 'For 3', 8, 'Why are you dissatisfied/very dissatisfied in using the following:', 0, 41, 0, 0, 1),
(74, 2, 'For 3', 8, 'Why are you dissatisfied/very dissatisfied in using the following:', 0, 42, 0, 0, 1),
(75, 2, 'For 3', 8, 'Why are you dissatisfied/very dissatisfied in using the following:', 0, 43, 0, 0, 1),
(76, 2, 'When I use the Teachnology tv and/or netbook in class,', 6, 'When I use the Teachnology tv and/or netbook in class,', 1, 28, 0, 0, 1),
(77, 2, 'When I use the Teachnology resources (authoring tools, images, activities, and assessments)', 6, 'When I use the Teachnology resources (authoring tools, images, activities, and assessments)...', 1, 29, 0, 0, 1),
(78, 2, 'When I use the NAS,', 6, 'When I use the NAS,', 1, 30, 0, 0, 1),
(79, 2, 'When I use the Teachnology tv, netbook, and resources in class, my students... ', 6, 'When I use the Teachnology tv, netbook, and resources in class, my students... ', 1, 31, 0, 0, 1),
(80, 2, 'CMS Rate the following about the Aralinks Content Management System:', 6, 'CMS: Rate the following about the Aralinks Content Management System:', 1, 32, 0, 0, 1),
(81, 2, 'Do you connect to the Aralinks Teachnology Wi-fi (wireless access)?', 3, 'Network: Do you connect to the Aralinks Teachnology Wi-fi (wireless access)?', 1, 33, 0, 0, 1),
(82, 2, 'Rate your network experience.', 6, 'Network: Rate your network experience.', 1, 34, 0, 0, 1),
(83, 2, 'Select the reason/s why you did not connect.', 4, 'Network: Select the reason/s why you did not connect.', 1, 34, 1, 6, 1),
(84, 2, 'Outside the Aralinks Faculty Training, have you met an Aralinks staff that assisted you with Teachnology concerns? ', 3, 'Support: Outside the Aralinks Faculty Training, have you met an Aralinks staff that assisted you with Teachnology concerns? ', 1, 35, 0, 0, 1),
(85, 2, 'Rate your experience of the following Alagang Phoenix support:', 6, 'Rate your experience of the following Alagang Phoenix support:', 1, 36, 0, 0, 1),
(86, 2, 'Commendations What is/are commendable about the Aralinks Teachnology program?', 2, 'Commendations: What is/are commendable about the Aralinks Teachnology program?', 1, 37, 0, 0, 1),
(87, 2, 'Recommendations What do you think will improve your experience in using the Aralinks Teachnology program?', 2, 'Recommendations: What do you think will improve your experience in using the Aralinks Teachnology program?', 1, 38, 0, 0, 1),
(105, 4, 'Grade Level', 4, 'Grade Level', 1, 1, 1, 20, 1),
(106, 4, 'Which subject/s do you teach this school year? ', 4, 'Which subject/s do you teach this school year? ', 1, 2, 1, 30, 1),
(107, 4, 'Years in Using the Program', 3, 'Years in Using the Program', 1, 3, 0, 0, 1),
(108, 4, 'When I use the CLE and tablets in class, ', 6, 'When I use the CLE and tablets in class,', 1, 4, 0, 0, 1),
(109, 4, 'When I use the CLE and tablets in class, my students... ', 6, 'When I use the CLE and tablets in class, my students... ', 1, 5, 0, 0, 1),
(110, 4, 'When I use the Aralinks tablet in class,', 6, 'When I use the Aralinks tablet in class,', 1, 6, 0, 0, 1),
(111, 4, 'Aralinks Collaborative Learning Environment (CLE) Rate the following about the Aralinks CLE:', 6, 'Aralinks Collaborative Learning Environment (CLE) (Rate the following about the Aralinks CLE)', 1, 7, 0, 0, 1),
(112, 4, 'Local Access to the Aralinks CLE Rate the following about the access to the Aralinks CLE:', 6, 'Local Access to the Aralinks CLE (Rate the following about the access to the Aralinks CLE):', 1, 8, 0, 0, 1),
(113, 3, 'Grade Level', 3, 'Grade Level', 1, 1, 0, 0, 1),
(114, 3, 'Which of the following learning materials do you like your teachers to use more often in class? Choose 5.', 4, 'Which of the following learning materials do you like your teachers to use more often in class? Choose 5.', 1, 2, 5, 5, 1),
(115, 3, 'Rate how helpful the following learning materials are in understanding your lessons better.', 6, 'Rate how helpful the following learning materials are in understanding your lessons better.', 1, 3, 0, 0, 1),
(116, 3, 'When my teacher uses the CLE and tablets in class, I...', 6, 'When my teacher uses the CLE and tablets in class, I...', 1, 4, 0, 0, 1),
(117, 3, 'As a student, I use the CLE and tablets in our classroom to...', 6, 'As a student, I use the CLE and tablets in our classroom to...', 1, 5, 0, 0, 1),
(118, 3, 'When I use the Aralinks tablet in class,', 6, 'When I use the Aralinks tablet in class,', 1, 6, 0, 0, 1),
(119, 3, 'Aralinks Collaborative Learning Environment (CLE) Rate the following about the Aralinks CLE:', 6, 'Aralinks Collaborative Learning Environment (CLE) - Rate the following about the Aralinks CLE:', 1, 7, 0, 0, 1),
(120, 3, 'Local Access to the Aralinks CLE Rate the following about the access to the Aralinks CLE:', 6, 'Local Access to the Aralinks CLE - Rate the following about the access to the Aralinks CLE:', 1, 8, 0, 0, 1),
(121, 3, 'What do you use to access the Aralinks CLE outside school?', 4, 'What do you use to access the Aralinks CLE outside school?', 1, 9, 0, 0, 1),
(122, 3, 'Which is your Internet service provider when you access CLE outside school? (Check all that apply.)', 4, 'Which is your Internet service provider when you access CLE outside school? (Check all that apply.)', 1, 10, 0, 0, 1),
(123, 3, 'How many people access your internet at home?', 7, 'How many people access your internet at home?', 1, 11, 0, 0, 1),
(124, 3, 'Online Access to the Aralinks CLE', 6, 'Rate your experience in accessing the Aralinks CLE outside school:', 1, 12, 0, 0, 1),
(125, 3, 'Evaluate the Aralinks Integration Facilitator/s (IF) assigned to your school', 6, 'Evaluate the Aralinks Integration Facilitator/s (IF) assigned to your school', 1, 13, 0, 0, 1),
(126, 3, 'Commendations  What is/are commendable about the use of the CLE and tablet computers in your classes?', 2, 'Commendations: What is/are commendable about the use of the CLE and tablet computers in your classes?', 1, 14, 0, 0, 1),
(127, 3, 'Recommendations  What will improve your learning experience in using the CLE and tablet computers?', 2, 'Recommendations: What will improve your learning experience in using the CLE and tablet computers?', 1, 15, 0, 0, 1),
(128, 4, '5a What do you use to access the Aralinks CLE outside school?', 4, 'What do you use to access the Aralinks CLE outside school?', 1, 9, 0, 0, 1),
(129, 4, 'Which is your Internet service provider when you access CLE outside school? (Check all that apply.)', 4, 'Which is your Internet service provider when you access CLE outside school? (Check all that apply.)', 1, 10, 0, 0, 1),
(130, 4, 'How many people access your internet at home?', 7, 'How many people access your internet at home?', 1, 11, 0, 0, 1),
(131, 4, 'Rate your experience in accessing the Aralinks CLE outside school:', 6, 'Rate your experience in accessing the Aralinks CLE outside school:', 1, 12, 0, 0, 1),
(132, 4, 'Evaluate the Aralinks Integration Facilitator/s (IF) assigned to your school', 6, 'Evaluate the Aralinks Integration Facilitator/s (IF) assigned to your school', 1, 13, 0, 0, 1),
(133, 4, 'Commendations: What is/are commendable about the use of the CLE and tablet computers in your classes? ', 2, 'Commendations: What is/are commendable about the use of the CLE and tablet computers in your classes?', 1, 14, 0, 0, 1),
(134, 4, 'Recommendations: What will improve your learning experience in using the CLE and tablet computers? ', 2, 'Recommendations: What will improve your learning experience in using the CLE and tablet computers?', 1, 15, 0, 0, 1),
(135, 5, 'Grade Level', 4, 'Grade Level', 1, 1, 1, 15, 1),
(136, 5, 'Which subject/s do you teach this school year? ', 4, 'Which subject/s do you teach this school year? ', 1, 2, 1, 20, 1),
(137, 5, 'Years in Using the Program', 3, 'Years in Using the Program', 1, 3, 0, 0, 1),
(138, 5, 'When I use the CLE and tablets in class,', 6, 'When I use the CLE and tablets in class,', 1, 4, 0, 0, 1),
(139, 5, 'When I use the CLE and tablets in class, my students... ', 6, 'When I use the CLE and tablets in class, my students... ', 1, 5, 0, 0, 1),
(140, 5, 'When I use the Aralinks tablet in class,', 6, 'When I use the Aralinks tablet in class,', 1, 6, 0, 0, 1),
(141, 5, 'Aralinks Collaborative Learning Environment (CLE) Rate the following about the Aralinks CLE:', 6, 'Aralinks Collaborative Learning Environment (CLE) (Rate the following about the Aralinks CLE)', 1, 7, 0, 0, 1),
(142, 5, 'Local Access to the Aralinks CLE Rate the following about the access to the Aralinks CLE:', 6, 'Local Access to the Aralinks CLE (Rate the following about the access to the Aralinks CLE):', 1, 8, 0, 0, 1),
(143, 5, 'What do you use to access the web/Internet?', 4, 'What do you use to access the web/Internet?', 1, 9, 1, 30, 1),
(144, 5, 'Which is your Internet service provider when you access CLE outside school? (Check all that apply.)', 4, 'Which is your Internet service provider when you access CLE outside school? (Check all that apply.)', 1, 10, 1, 30, 1),
(145, 5, 'Rate your experience of our Alagang Phoenix services', 6, 'Support: Rate your experience of our Alagang Phoenix services', 1, 11, 0, 0, 1),
(146, 5, 'Evaluate the Aralinks Integration Facilitator/s (IF) assigned to your school', 6, 'Support: Evaluate the Aralinks Integration Facilitator/s (IF) assigned to your school', 1, 12, 0, 0, 1),
(147, 5, 'Commendations: What is/are commendable about the use of the CLE and tablet computers in your classes?', 2, 'Commendations: What is/are commendable about the use of the CLE and tablet computers in your classes?', 1, 13, 0, 0, 1),
(148, 5, 'Recommendations: What will improve your learning experience in using the CLE and tablet computers?', 2, 'Recommendations: What will improve your learning experience in using the CLE and tablet computers?', 1, 14, 0, 0, 1),
(149, 6, 'Grade Level', 3, 'Grade Level', 1, 1, 0, 0, 1),
(150, 6, 'Which of the following learning materials do you like your teachers to use more often in class? Choose 5.', 4, 'Which of the following learning materials do you like your teachers to use more often in class? Choose 5.', 1, 2, 1, 20, 1),
(151, 6, 'Rate how helpful the following learning materials are in understanding your lessons better.', 6, 'Rate how helpful the following learning materials are in understanding your lessons better.', 1, 3, 0, 0, 1),
(152, 6, 'When my teacher uses the CLE and tablets in class, I...', 6, 'When my teacher uses the CLE and tablets in class, I...', 1, 4, 0, 0, 1),
(153, 6, 'As a student, I use the CLE and tablets in our classroom to...', 6, 'As a student, I use the CLE and tablets in our classroom to...', 1, 5, 0, 0, 1),
(154, 6, 'When I use the Aralinks tablet in class,', 6, 'When I use the Aralinks tablet in class,', 1, 6, 0, 0, 1),
(155, 6, 'Aralinks Collaborative Learning Environment (CLE) - Rate the following about the Aralinks CLE:', 6, 'Aralinks Collaborative Learning Environment (CLE) - Rate the following about the Aralinks CLE:', 1, 7, 0, 0, 1),
(156, 6, 'Local Access to the Aralinks CLE - Rate the following about the access to the Aralinks CLE:', 6, 'Local Access to the Aralinks CLE - Rate the following about the access to the Aralinks CLE:', 1, 8, 0, 0, 1),
(157, 6, 'What do you use to access the web/Internet?', 4, 'What do you use to access the web/Internet? (Check all that apply)', 1, 9, 1, 30, 1),
(158, 6, 'Which is your Internet service provider when you access CLE outside school? (Check all that apply.)', 4, 'Which is your Internet service provider when you access CLE outside school? (Check all that apply.)', 1, 10, 1, 30, 1),
(159, 6, 'Evaluate the Aralinks Integration Facilitator/s (IF) assigned to your school', 6, 'Evaluate the Aralinks Integration Facilitator/s (IF) assigned to your school', 1, 11, 0, 0, 1),
(160, 6, 'Commendations: What is/are commendable about the use of the CLE and tablet computers in your classes?', 2, 'Commendations: What is/are commendable about the use of the CLE and tablet computers in your classes?', 1, 12, 0, 0, 1),
(161, 6, 'Recommendations: What will improve your learning experience in using the CLE and tablet computers?', 2, 'Recommendations: What will improve your learning experience in using the CLE and tablet computers?', 1, 13, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `quest_question_choice`
--

CREATE TABLE `quest_question_choice` (
  `id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quest_question_choice`
--

INSERT INTO `quest_question_choice` (`id`, `question_id`, `content`, `value`) VALUES
(1, 1, 'Nursery\r', 1),
(2, 1, 'Kinder 1\r', 2),
(3, 1, 'Kinder 2\r', 3),
(4, 1, 'Grade 1\r', 4),
(5, 1, 'Grade 2\r', 5),
(6, 1, 'Grade 3\r', 6),
(7, 1, 'Grade 4\r', 7),
(8, 1, 'Grade 5\r', 8),
(9, 1, 'Grade 6\r', 9),
(10, 1, 'Grade 7\r', 10),
(11, 1, 'Grade 8\r', 11),
(12, 1, 'Grade 10\r', 12),
(13, 1, 'Grade 11\r', 13),
(14, 1, 'Grade 12', 14),
(15, 2, 'PowerPoint presentations\r', 1),
(16, 2, 'Videos\r', 2),
(17, 2, 'Songs/Audio Recording\r', 3),
(18, 2, 'Animated Presentations\r', 4),
(19, 2, 'RPGs\r', 5),
(20, 2, 'Interactive Quizzes\r', 6),
(21, 2, 'Games\r', 7),
(22, 2, 'Images/GIFs', 8),
(23, 3, 'PowerPoint presentations\r', 0),
(24, 3, 'Videos\r', 0),
(25, 3, 'Song/Audio Recording\r', 0),
(26, 3, 'Animated Presentations\r', 0),
(27, 3, 'RPGs\r', 0),
(28, 3, 'Interactive Quizzes\r', 0),
(29, 3, 'Games\r', 0),
(30, 3, 'Image/GIFs', 0),
(31, 3, 'Not at all\r', 1),
(32, 3, 'A Little Helpful\r', 2),
(33, 3, 'Helpful\r', 3),
(34, 3, 'Very Helpful', 4),
(35, 4, 'find the lessons more engaging and interesting.\r', 0),
(36, 4, 'am motivated to study further.\r', 0),
(37, 4, 'participate more actively.\r', 0),
(38, 4, 'understand lessons more clearly.\r', 0),
(39, 4, 'learn more about how the lessons apply and relate in my real life.', 0),
(40, 4, 'Strongly Disagree\r', 1),
(41, 4, 'Disagree\r', 2),
(42, 4, 'Agree\r', 3),
(43, 4, 'Strongly Agree', 4),
(44, 5, 'report\r', 0),
(45, 5, 'present projects (e.g. play background music, display backdrop, play videos)\r', 0),
(46, 5, 'listen to music\r', 0),
(47, 5, 'rehearse for classroom/school presentations', 0),
(48, 5, 'Yes\r', 1),
(49, 5, 'No', 2),
(50, 6, 'I can comfortably see what is projected to the television.\r', 0),
(51, 6, 'I can read the text clearly.\r', 0),
(52, 6, 'I am able to see the images/videos.\r', 0),
(53, 6, 'I am able to hear the sound/music clearly.', 0),
(54, 6, 'Yes\r', 1),
(55, 6, 'No', 2),
(56, 9, 'Nursery\r', 1),
(57, 9, 'Kinder 1\r', 2),
(58, 9, 'Kinder 2\r', 3),
(59, 9, 'Grade 1\r', 4),
(60, 9, 'Grade 2\r', 5),
(61, 9, 'Grade 3\r', 6),
(62, 9, 'Grade 4\r', 7),
(63, 9, 'Grade 5\r', 8),
(64, 9, 'Grade 6\r', 9),
(65, 9, 'Grade 7\r', 10),
(66, 9, 'Grade 8\r', 11),
(67, 9, 'Grade 9\r', 12),
(68, 9, 'Grade 10\r', 13),
(69, 9, 'Grade 11\r', 14),
(70, 9, 'Grade 12', 15),
(71, 10, 'AP/Social Science\r', 1),
(72, 10, 'English\r', 2),
(73, 10, 'Filipino\r', 3),
(74, 10, 'Math\r', 4),
(75, 10, 'Science\r', 5),
(76, 10, 'CLE/Religion/Values Education\r', 6),
(77, 10, 'TLE/HELE\r', 7),
(78, 10, 'Computer/ICT\r', 8),
(79, 10, 'Music\r', 9),
(80, 10, 'Arts\r', 10),
(81, 10, 'PE\r', 11),
(82, 10, 'Health\r', 12),
(83, 10, 'SHS - Core Curriculum\r', 13),
(84, 10, 'SHS - STEM\r', 14),
(85, 10, 'SHS - ABM\r', 15),
(86, 10, 'SHS - HUMSS\r', 16),
(87, 10, 'SHS - Tech-Voc\r', 17),
(88, 10, 'SHS - Sports\r', 18),
(89, 10, 'SHS - Arts and Design', 19),
(90, 11, '0 (this school year only)\r', 1),
(91, 11, '1\r', 2),
(92, 11, '2', 3),
(93, 12, 'Never\r', 1),
(94, 12, 'Rarely (less than ten times this school year) \r', 2),
(95, 12, 'Sometimes (at least once a month)\r', 3),
(96, 12, 'Often (at least once a week) \r', 4),
(97, 12, 'Always (almost every meeting)', 5),
(98, 13, 'Never\r', 1),
(99, 13, 'Rarely (less than ten times this school year) \r', 2),
(100, 13, 'Sometimes (at least once a month)\r', 3),
(101, 13, 'Often (at least once a week) \r', 4),
(102, 13, 'Always (almost every meeting)', 5),
(103, 14, 'Never\r', 1),
(104, 14, 'Rarely (less than ten times this school year) \r', 2),
(105, 14, 'Sometimes (at least once a month)\r', 3),
(106, 14, 'Often (at least once a week) \r', 4),
(107, 14, 'Always (almost every meeting)', 5),
(108, 15, 'Never\r', 1),
(109, 15, 'Rarely (less than ten times this school year) \r', 2),
(110, 15, 'Sometimes (at least once a month)\r', 3),
(111, 15, 'Often (at least once a week) \r', 4),
(112, 15, 'Always (almost every meeting)', 5),
(113, 16, 'Never\r', 1),
(114, 16, 'Rarely (less than ten times this school year) \r', 2),
(115, 16, 'Sometimes (at least once a month)\r', 3),
(116, 16, 'Often (at least once a week) \r', 4),
(117, 16, 'Always (almost every meeting)', 5),
(118, 17, 'Never\r', 1),
(119, 17, 'Rarely (less than ten times this school year) \r', 2),
(120, 17, 'Sometimes (at least once a month)\r', 3),
(121, 17, 'Often (at least once a week) \r', 4),
(122, 17, 'Always (almost every meeting)', 5),
(123, 18, 'Never\r', 1),
(124, 18, 'Rarely (less than ten times this school year) \r', 2),
(125, 18, 'Sometimes (at least once a month)\r', 3),
(126, 18, 'Often (at least once a week) \r', 4),
(127, 18, 'Always (almost every meeting)', 5),
(128, 19, 'Never\r', 1),
(129, 19, 'Rarely (less than ten times this school year) \r', 2),
(130, 19, 'Sometimes (at least once a month)\r', 3),
(131, 19, 'Often (at least once a week) \r', 4),
(132, 19, 'Always (almost every meeting)', 5),
(133, 20, 'I am not comfortable using the tv during class.\r', 1),
(134, 20, 'I do not know how to project using the TV.\r', 2),
(135, 20, 'The placement of the tv does not allow comfortable viewing.\r', 3),
(136, 20, 'The tv is not working well.\r', 4),
(137, 20, 'The HDMI cable is malfunctioning.\r', 5),
(138, 20, 'We often experience power interruptions.\r', 6),
(139, 20, 'It is complicated to reserve and use the TV in class.\r', 7),
(140, 20, 'Others', 8),
(141, 21, 'I use my own netbook/laptop during class.\r', 1),
(142, 21, 'I am not comfortable using the netbook during class.\r', 2),
(143, 21, 'I have limited access to the netbooks provided to the school.\r', 3),
(144, 21, 'The netbook performance is unsatisfactory (e.g. lags, not responsive, slow response)\r', 4),
(145, 21, 'The netbook is malfunctioning (e.g. trackpad is not responsive, some keys are not working)\r', 5),
(146, 21, 'The software licenses are expired/not updated.\r', 6),
(147, 21, 'It takes time to reserve and use the netbook in class.\r', 7),
(148, 21, 'There is not enough netbooks available for use.\r', 8),
(149, 21, 'Others', 9),
(150, 22, 'I do not need to use the iSpeak in my class.\r', 1),
(151, 22, 'Our school has its own sound system in the classroom.\r', 2),
(152, 22, 'The iSpeak is not available when I need to use it.\r', 3),
(153, 22, 'The iSpeak is not working well.\r', 4),
(154, 22, 'I was not informed that I can use the iSpeak in class.\r', 5),
(155, 22, 'I do not know how to use the iSpeak.\r', 6),
(156, 22, 'There is not enough iSpeak in school.\r', 7),
(157, 22, 'It is difficult to reserve the iSpeak when I need to use it.\r', 8),
(158, 22, 'Others', 9),
(159, 23, 'I do not need a desktop computer to produce my instructional materials.\r', 1),
(160, 23, 'The TeachLab is not easily accessible (e.g. not in the faculty room, the room is always locked).\r', 2),
(161, 23, 'It is time consuming to go to the TeachLab.\r', 3),
(162, 23, 'I do not know where the TeachLab is located.\r', 4),
(163, 23, 'I was not informed that I can use the TeachLab to create and curate content/instructional materials.\r', 5),
(164, 23, 'The desktop computers are not working well.\r', 6),
(165, 23, 'There is no one that can assist me to use the TeachLab.\r', 7),
(166, 23, 'I am not comfortable using the TeachLab.\r', 8),
(167, 23, 'Others', 9),
(168, 24, 'I was not informed that I can use the NAS to store content/instructional materials.\r', 1),
(169, 24, 'The NAS is not easy to access.\r', 2),
(170, 24, 'It is complicated to navigate the NAS.\r', 3),
(171, 24, 'I do not know how to use the NAS.\r', 4),
(172, 24, 'I forgot my username and password.\r', 5),
(173, 24, 'I do not know how to access the NAS.\r', 6),
(174, 24, 'It is time consuming to access the NAS and save resources.\r', 7),
(175, 24, 'There is no one who can assist me to access and use the NAS.\r', 8),
(176, 24, 'Others', 9),
(177, 25, 'I have not downloaded any TAT.\r', 1),
(178, 25, 'I design my own PowerPoint presentations.\r', 2),
(179, 25, 'The TATs are not applicable in my instructional design.\r', 3),
(180, 25, 'I have no time to create or edit instructional materials using TATs.\r', 4),
(181, 25, 'The TATs are not compatible/not working in my version of Microsoft PowerPoint.\r', 5),
(182, 25, 'The TATs are not easily understandable. \r', 6),
(183, 25, 'The TATs are not varied.\r', 7),
(184, 25, 'The layout is not appealing to my students.\r', 8),
(185, 25, 'There are too many buttons to click to make the TATs work.\r', 9),
(186, 25, 'There is no one that can assist me to use the TATs.\r', 10),
(187, 25, 'I am not comfortable using the TATs in my instruction.\r', 11),
(188, 25, 'Others', 12),
(189, 26, 'I download images from the internet.\r', 1),
(190, 26, 'The images in the CMS are not applicable in my instructional design.\r', 2),
(191, 26, 'I do not know how to download the images from the CMS.\r', 3),
(192, 26, 'The images are not realistic.\r', 4),
(193, 26, 'The images are too simple.\r', 5),
(194, 26, 'The images are not varied.\r', 6),
(195, 26, 'I do not see images I can use in class.\r', 7),
(196, 26, 'Others', 8),
(197, 27, 'I create my own instructional materials using my own resources.\r', 1),
(198, 27, 'I download my resources from the internet.\r', 2),
(199, 27, 'The activity and assessment types are not varied.\r', 3),
(200, 27, 'The activities/assessments are not working in the laptop.\r', 4),
(201, 27, 'The activities/assessments are not applicable in my instructional design.\r', 5),
(202, 27, 'I do not know how to download and extract the acts and assessments from the CMS.\r', 6),
(203, 27, 'I do not know how to use the activities and assessments.\r', 7),
(204, 27, 'The acts and assessments are not compatible/not working in my version of Microsoft PowerPoint.\r', 8),
(205, 27, 'Others', 9),
(206, 28, 'Very Dissatisfied\r', 1),
(207, 28, 'Dissatisfied\r', 2),
(208, 28, 'Satisfied\r', 3),
(209, 28, 'Very Satisfied', 4),
(210, 29, 'Very Dissatisfied\r', 1),
(211, 29, 'Dissatisfied\r', 2),
(212, 29, 'Satisfied\r', 3),
(213, 29, 'Very Satisfied', 4),
(214, 30, 'Very Dissatisfied\r', 1),
(215, 30, 'Dissatisfied\r', 2),
(216, 30, 'Satisfied\r', 3),
(217, 30, 'Very Satisfied', 4),
(218, 31, 'Very Dissatisfied\r', 1),
(219, 31, 'Dissatisfied\r', 2),
(220, 31, 'Satisfied\r', 3),
(221, 31, 'Very Satisfied', 4),
(222, 32, 'Very Dissatisfied\r', 1),
(223, 32, 'Dissatisfied\r', 2),
(224, 32, 'Satisfied\r', 3),
(225, 32, 'Very Satisfied', 4),
(226, 33, 'Very Dissatisfied\r', 1),
(227, 33, 'Dissatisfied\r', 2),
(228, 33, 'Satisfied\r', 3),
(229, 33, 'Very Satisfied', 4),
(230, 34, 'Very Dissatisfied\r', 1),
(231, 34, 'Dissatisfied\r', 2),
(232, 34, 'Satisfied\r', 3),
(233, 34, 'Very Satisfied', 4),
(234, 35, 'Very Dissatisfied\r', 1),
(235, 35, 'Dissatisfied\r', 2),
(236, 35, 'Satisfied\r', 3),
(237, 35, 'Very Satisfied', 4),
(238, 37, 'I have limited access to the netbooks provided to the school.\r', 1),
(239, 37, 'The netbook performance is unsatisfactory (e.g. lags, not responsive, slow response).\r', 2),
(240, 37, 'The netbook is malfunctioning (e.g. trackpad is not responsive, some keys are not working).\r', 3),
(241, 37, 'The software licenses are expired/not updated.\r', 4),
(242, 37, 'Others', 5),
(243, 36, 'The placement of the tv does not allow comfortable viewing.\r', 1),
(244, 36, 'The tv is not working well.\r', 2),
(245, 36, 'The HDMI cable is malfunctioning.\r', 3),
(246, 36, 'We often experience power interruptions.\r', 4),
(247, 36, 'Others', 5),
(248, 38, 'The iSpeak is not available when I need to use it.\r', 1),
(249, 38, 'The iSpeak is not working well.\r', 2),
(250, 38, 'It does not sound pleasant.\r', 3),
(251, 38, 'Others', 4),
(252, 39, 'The TeachLab is not easily accessible (e.g. not in the faculty room, the room is always locked)\r', 1),
(253, 39, 'The desktop computers are not working well.\r', 2),
(254, 39, 'It is time consuming to go to the TeachLab.\r', 3),
(255, 39, 'Others', 4),
(256, 40, 'The NAS is not easily accessible.\r', 1),
(257, 40, 'The NAS is not working well.\r', 2),
(258, 40, 'Others', 3),
(259, 41, 'The TATs are not applicable in my instructional design.\r', 1),
(260, 41, 'The TATs are not compatible/not working in my version of Microsoft PowerPoint.\r', 2),
(261, 41, 'Not all TATs are easily understandable. \r', 3),
(262, 41, 'It is sometimes confusing  to use TATs while teaching.\r', 4),
(263, 41, 'The TATs are not varied.\r', 5),
(264, 41, 'The layout is not appealing to my students. \r', 6),
(265, 41, 'Others', 7),
(266, 42, 'The images are not realistic.\r', 1),
(267, 42, 'The images are too simple.\r', 2),
(268, 42, 'The images are not varied.\r', 3),
(269, 42, 'Others', 4),
(270, 43, 'The activity and assessment types are not varied.\r', 1),
(271, 43, 'The activities/assessments are not working in the laptop.\r', 2),
(272, 43, 'Some activities/assessments are not applicable in my instructional design.\r', 3),
(273, 43, 'Some acts and assessments are not compatible/not working in my version of Microsoft PowerPoint.\r', 4),
(274, 43, 'Others', 5),
(275, 76, 'I can implement a variety of strategies other than the ones I have employed before. \r', 0),
(276, 76, 'I enrich instruction with the use of Open Educational Resources (OERs) such as presentation slides, images, videos, and animated presentations  I downloaded from the web.\r', 0),
(277, 76, 'I provide my students opportunities to present their digital outputs.', 0),
(278, 76, 'Never\r', 1),
(279, 76, 'Rarely\r', 2),
(280, 76, 'Sometimes\r', 3),
(281, 76, 'Often\r', 4),
(282, 76, 'Always', 5),
(283, 77, 'creation of resources is more efficient.\r', 0),
(284, 77, 'I am able to use immediate feedback to influence my instruction.\r', 0),
(285, 77, 'I can process student responses more efficiently and effectively.\r', 0),
(286, 77, 'I can implement a variety of strategies other than the ones I have employed before.\r', 0),
(287, 77, 'I provide my students opportunities to create digital outputs.\r', 0),
(288, 77, 'I enrich instruction with the use of Open Educational Resources (OERs) such as presentation slides, images, videos, and animated presentations  I downloaded from the web.', 0),
(289, 77, 'Never\r', 1),
(290, 77, 'Rarely\r', 2),
(291, 77, 'Sometimes\r', 3),
(292, 77, 'Often\r', 4),
(293, 77, 'Always', 5),
(294, 78, 'I have a means to gather and store my digital instructional materials.\r', 0),
(295, 78, 'I have means to document and collect student output.', 0),
(296, 78, 'Never\r', 1),
(297, 78, 'Rarely\r', 2),
(298, 78, 'Sometimes\r', 3),
(299, 78, 'Often\r', 4),
(300, 78, 'Always', 5),
(301, 79, 'find the lessons more engaging and interesting.\r', 0),
(302, 79, 'are motivated to study further.\r', 0),
(303, 79, 'participate more actively.\r', 0),
(304, 79, ' understand lessons more clearly.\r', 0),
(305, 79, 'learn more about how the lessons apply and relate in my real life.\r', 0),
(306, 79, 'perform better in the various learning activities and assessments.', 0),
(307, 79, 'Strongly Disagree\r', 1),
(308, 79, 'Disagree\r', 2),
(309, 79, 'Agree\r', 3),
(310, 79, 'Strongly Agree', 4),
(311, 80, 'Ease of Use (Clicking of buttons and menus to activate functions and jump to other sections of the CMS)\r', 0),
(312, 80, 'Design and Layout (Readability, color, font, and design)\r', 0),
(313, 80, 'Performance (Responsiveness and loading and downloading time of resources)\r', 0),
(314, 80, 'Organization (Proper categorization of resources)', 0),
(315, 80, 'Very Dissatisfied\r', 1),
(316, 80, 'Dissatisfied\r', 2),
(317, 80, 'Satisfied\r', 3),
(318, 80, 'Very Satisfied', 4),
(319, 81, 'Yes\r', 1),
(320, 81, 'No', 2),
(321, 82, 'Reliability of access\r', 0),
(322, 82, 'Connection speed\r', 0),
(323, 82, 'Accessibility of connection', 0),
(324, 82, 'Very Dissatisfied\r', 1),
(325, 82, 'Dissatisfied\r', 2),
(326, 82, 'Satisfied\r', 3),
(327, 82, 'Very Satisfied', 4),
(328, 83, 'I do not know that there is a Wi-fi (wireless access) to the CMS.\r', 1),
(329, 83, 'I do not know how to connect to the Wi-fi.\r', 2),
(330, 83, 'I do not know the password to the Wi-fi.\r', 3),
(331, 83, 'I cannot detect the Wi-fi.\r', 4),
(332, 83, 'There is no Wi-fi connection to the CMS.\r', 5),
(333, 83, 'Others', 6),
(334, 84, 'Yes\r', 1),
(335, 84, 'No', 2),
(336, 85, 'Promptness of response to concerns (e.g. malfunctioning netbooks and/or tvs, damaged HDMI cables)\r', 0),
(337, 85, 'Accuracy of response to concerns  (e.g. malfunctioning netbooks and/or tvs, damaged HDMI cables)\r', 0),
(338, 85, 'Usefulness of pocket training sessions (skill-based or subject-specific technical training sessions)', 0),
(339, 85, 'Very Dissatisfied\r', 1),
(340, 85, 'Dissatisfied\r', 2),
(341, 85, 'Satisfied\r', 3),
(342, 85, 'Very Satisfied', 4),
(365, 104, '', 1),
(366, 105, 'Nursery\r', 1),
(367, 105, 'Kinder 1\r', 2),
(368, 105, 'Kinder 2\r', 3),
(369, 105, 'Grade 1\r', 4),
(370, 105, 'Grade 2\r', 5),
(371, 105, 'Grade 3\r', 6),
(372, 105, 'Grade 4\r', 7),
(373, 105, 'Grade 5\r', 8),
(374, 105, 'Grade 6\r', 9),
(375, 105, 'Grade 7\r', 10),
(376, 105, 'Grade 8\r', 11),
(377, 105, 'Grade 9\r', 12),
(378, 105, 'Grade 10\r', 13),
(379, 105, 'Grade 11\r', 14),
(380, 105, 'Grade 12', 15),
(381, 106, 'AP/Social Science\r', 1),
(382, 106, 'English\r', 2),
(383, 106, 'Filipino\r', 3),
(384, 106, 'Math\r', 4),
(385, 106, 'Science\r', 5),
(386, 106, 'CLE/Religion/Values Education\r', 6),
(387, 106, 'TLE/HELE\r', 7),
(388, 106, 'Computer/ICT\r', 8),
(389, 106, 'Music\r', 9),
(390, 106, 'Arts\r', 10),
(391, 106, 'PE\r', 11),
(392, 106, 'Health\r', 12),
(393, 106, 'SHS - Core Curriculum\r', 13),
(394, 106, 'SHS - STEM\r', 14),
(395, 106, 'SHS - ABM\r', 15),
(396, 106, 'SHS - HUMSS\r', 16),
(397, 106, 'SHS - Tech-Voc\r', 17),
(398, 106, 'SHS - Sports\r', 18),
(399, 106, 'SHS - Arts and Design', 19),
(400, 107, '0\r', 1),
(401, 107, '1\r', 2),
(402, 107, '2\r', 3),
(403, 107, '3\r', 4),
(404, 107, '4\r', 5),
(405, 107, '5', 6),
(406, 108, 'creation of resources is more efficient.\r', 0),
(407, 108, 'I have a means to gather and store my digital instructional materials.\r', 0),
(408, 108, 'I am able to use immediate feedback to influence my instruction.\r', 0),
(409, 108, 'I can process student responses more efficiently and effectively.\r', 0),
(410, 108, 'I can implement a variety of strategies other than the ones I have employed before .\r', 0),
(411, 108, 'I provide my students opportunities to create digital outputs.\r', 0),
(412, 108, 'I have means to document and collect student output.\r', 0),
(413, 108, 'I enrich instruction with the use of Android apps and Open Educational Resources (OERs) such as presentation slides, images, videos, and animated presentations  I downloaded from the web.', 0),
(414, 108, 'Never\r', 1),
(415, 108, 'Rarely\r', 2),
(416, 108, 'Sometimes\r', 3),
(417, 108, 'Often\r', 4),
(418, 108, 'Always', 5),
(419, 109, 'find the lessons more engaging and interesting.\r', 0),
(420, 109, 'are motivated to study further.\r', 0),
(421, 109, 'participate more actively.\r', 0),
(422, 109, 'understand lessons more clearly.\r', 0),
(423, 109, 'learn more about how the lessons apply and relate in my real life.\r', 0),
(424, 109, 'perform better in the various learning activities and assessments.', 0),
(425, 109, 'Strongly Disagree\r', 1),
(426, 109, 'Disagree\r', 2),
(427, 109, 'Agree\r', 3),
(428, 109, 'Strongly Agree', 4),
(429, 110, 'it stays on.\r\n', 0),
(430, 110, 'it functions and responds to my gestures.\r\n', 0),
(431, 110, 'it stays cool to the touch while I am using it.. \r\n', 0),
(432, 110, 'it responds quickly when I click any part of it.\r\n', 0),
(433, 110, 'it responds accurately when I click a specific part on it.\r\n', 0),
(434, 110, 'it is easy to drag items.\r\n', 0),
(435, 110, 'it connects quickly to the Wi-Fi.\r\n', 0),
(436, 110, 'its connection to the Wi-Fi is stable.\r\n', 0),
(437, 110, 'the on-screen keyboard responds accurately and quickly.\r\n', 0),
(438, 110, 'I can clearly see all the items on it.', 0),
(439, 110, 'Never\r', 1),
(440, 110, 'Rarely\r', 2),
(441, 110, 'Sometimes\r', 3),
(442, 110, 'Often\r', 4),
(443, 110, 'Always', 5),
(444, 111, 'Ease of Use - Clicking of buttons and menus to activate functions and jump to other sections of the CLE\r', 0),
(445, 111, 'Design and Layout - Readability, color, font, and design\r', 0),
(446, 111, 'Performance - Responsiveness and loading and downloading time of resources\r', 0),
(447, 111, 'Organization - Proper categorization of resources\r', 0),
(448, 111, 'Grade Tracking - Ability to monitor grades for various learning activities\r', 0),
(449, 111, 'Content Authoring - Variety of tools for authoring media-rich content\r', 0),
(450, 111, 'Migration of Content - Ease of copying activities and resources from one section to another\r', 0),
(451, 111, 'Calendar and Scheduling of Availability of Resources - Collaborative calendar with announcements/notifications. Release of course content and assessments can be easily scheduled for student access.', 0),
(452, 111, 'Very Dissatisfied\r', 1),
(453, 111, 'Dissatisfied\r', 2),
(454, 111, 'Satisfied\r', 3),
(455, 111, 'Very Satisfied\r', 4),
(456, 111, 'Not Applicable', 5),
(457, 112, 'It is easy to connect to the Aralinks Wi-Fi.\r', 0),
(458, 112, 'The connection to the CLE is stable.\r', 0),
(459, 112, 'The Aralinks Wi-Fi signal connection is strong.\r', 0),
(460, 112, 'The loading time of the Aralinks CLE is generally fast.', 0),
(461, 112, 'Never\r', 1),
(462, 112, 'Rarely\r', 2),
(463, 112, 'Sometimes\r', 3),
(464, 112, 'Often\r', 4),
(465, 112, 'Always', 5),
(466, 113, 'Nursery\r', 1),
(467, 113, 'Kinder 1\r', 2),
(468, 113, 'Kinder 2\r', 3),
(469, 113, 'Grade 1\r', 4),
(470, 113, 'Grade 2\r', 5),
(471, 113, 'Grade 3\r', 6),
(472, 113, 'Grade 4\r', 7),
(473, 113, 'Grade 5\r', 8),
(474, 113, 'Grade 6\r', 9),
(475, 113, 'Grade 7\r', 10),
(476, 113, 'Grade 8\r', 11),
(477, 113, 'Grade 9\r', 12),
(478, 113, 'Grade 10\r', 13),
(479, 113, 'Grade 11\r', 14),
(480, 113, 'Grade 12', 15),
(481, 114, 'PowerPoint presentations\r', 1),
(482, 114, 'Videos\r', 2),
(483, 114, 'Song/Audio Recording\r', 3),
(484, 114, 'Animated Presentations\r', 4),
(485, 114, 'Interactive Lessons\r', 5),
(486, 114, 'Interactive Quizzes\r', 6),
(487, 114, 'Games\r', 7),
(488, 114, 'Images/GIFs\r', 8),
(489, 114, 'RPGs\r', 9),
(490, 114, 'Forums\r', 10),
(491, 114, 'Andriod Apps (e.g. Colorfy, Kahoot, Real Piano)\r', 11),
(492, 114, 'Websites\r\n', 12),
(493, 114, 'Others', 13),
(494, 115, 'PowerPoint Presentations\r', 0),
(495, 115, 'Videos\r', 0),
(496, 115, 'Song/Audio Recording\r', 0),
(497, 115, 'Animated Presentations\r', 0),
(498, 115, 'Interactive Lessons\r', 0),
(499, 115, 'Interactive Quizzes\r', 0),
(500, 115, 'Games\r', 0),
(501, 115, 'Images/GIFs\r', 0),
(502, 115, 'RPGs\r', 0),
(503, 115, 'Forums\r', 0),
(504, 115, 'Android  Apps (e.g. Colorfy, Kahoot, Real Piano)\r', 0),
(505, 115, 'Websites', 0),
(506, 115, 'Not Helpful\r', 1),
(507, 115, 'A Little Helpful\r', 2),
(508, 115, 'Helpful\r', 3),
(509, 115, 'Very Helpful', 4),
(510, 116, 'find the lessons more engaging and interesting.\r', 0),
(511, 116, 'am motivated to study further.\r', 0),
(512, 116, 'participate more actively.\r', 0),
(513, 116, 'understand lessons more clearly.\r', 0),
(514, 116, 'learn more about how the lessons apply and relate in my real life.', 0),
(515, 116, 'Strongly Disagree\r', 1),
(516, 116, 'Disagree\r', 2),
(517, 116, 'Agree\r', 3),
(518, 116, 'Strongly Agree\r', 4),
(519, 116, 'Not Applicable', 5),
(520, 117, 'research\r', 0),
(521, 117, 'create CLE activities (e.g. forum, quizzes, games, glossary etc)\r', 0),
(522, 117, 'report\r', 0),
(523, 117, 'create WPS/Microsoft Office documents (e.g. Word,  Ppt etc)\r', 0),
(524, 117, 'present projects\r', 0),
(525, 117, 'create projects using Android apps		\r', 0),
(526, 117, 'record videos\r', 0),
(527, 117, 'record audio\r', 0),
(528, 117, 'take pictures', 0),
(529, 117, 'Yes\r', 1),
(530, 117, 'No', 2),
(531, 118, 'it stays on.\r\n', 0),
(532, 118, '\r\nit functions and responds to my gestures.\r\n', 0),
(533, 118, 'it stays cool to the touch while I am using it.\r\n', 0),
(534, 118, 'it responds quickly when I click any part of it.\r\n', 0),
(535, 118, 'it responds accurately when I click a specific part on it.\r\n', 0),
(536, 118, 'it is easy to drag items.\r\n', 0),
(537, 118, 'it connects quickly to the Wi-Fi.\r\n', 0),
(538, 118, 'its connection to the Wi-Fi is stable.\r\n', 0),
(539, 118, 'the on-screen keyboard responds accurately and quickly.\r\n', 0),
(540, 118, 'I can clearly see all the items on it.', 0),
(541, 118, 'Never\r', 1),
(542, 118, 'Rarely\r', 2),
(543, 118, 'Sometimes\r', 3),
(544, 118, 'Often\r', 4),
(545, 118, 'Always', 5),
(546, 119, 'Ease of Use - Clicking of buttons and menus to activate functions and jump to other sections of the CLE\r', 0),
(547, 119, 'Design and Layout - Readability, color, font, and design\r', 0),
(548, 119, 'Performance - Responsiveness and loading and downloading time of resources\r', 0),
(549, 119, 'Organization - Proper categorization of resources\r', 0),
(550, 119, 'Grade Tracking - Ability to monitor grades for various learning activities', 0),
(551, 119, 'Very Dissatisfied\r', 1),
(552, 119, 'Dissatisfied\r', 2),
(553, 119, 'Satisfied\r', 3),
(554, 119, 'Very Satisfied\r', 4),
(555, 119, 'Not Applicable', 5),
(556, 120, 'It is easy to connect to the Aralinks Wi-Fi.\r', 0),
(557, 120, 'The connection to the CLE is stable.\r', 0),
(558, 120, 'The Aralinks Wi-Fi signal connection is strong.\r', 0),
(559, 120, 'The loading time of the Aralinks CLE is generally fast.', 0),
(560, 120, 'Never\r', 1),
(561, 120, 'Rarely\r', 2),
(562, 120, 'Sometimes\r', 3),
(563, 120, 'Often\r', 4),
(564, 120, 'Always', 5),
(565, 121, 'mobile data\r', 1),
(566, 121, 'mobile hotspot \r', 2),
(567, 121, 'Wi-Fi at home\r', 3),
(568, 121, 'Wi-Fi outside home (such as wi-fi of restaurants, malls, cafe, etc.)\r', 4),
(569, 121, 'pocket Wi-Fi\r', 5),
(570, 121, 'broadband/fiber\r', 6),
(571, 121, 'Internet cafe', 7),
(572, 122, 'BayanTel\r', 1),
(573, 122, 'Converge\r', 2),
(574, 122, 'Globe\r', 3),
(575, 122, 'PLDT\r', 4),
(576, 122, 'SkyBroadband\r', 5),
(577, 122, 'Smart\r', 6),
(578, 122, 'Sun\r', 7),
(579, 122, 'Wi-Tribe\r', 8),
(580, 122, 'Others\r', 9),
(581, 122, 'I do not know.', 10),
(582, 124, 'I can easily find the Aralinks CLE website.\r', 0),
(583, 124, 'The loading time of the Aralinks CLE is generally fast.\r', 0),
(584, 124, 'The connection to the Aralinks CLE is stable.\r', 0),
(585, 124, 'The loading time of the Aralinks CLE is fast even if I am browsing other websites.\r', 0),
(586, 124, 'I have problems connecting to the Aralinks CLE because the internet access outside school is generally slow.', 0),
(587, 124, 'Never\r', 1),
(588, 124, 'Rarely\r', 2),
(589, 124, 'Sometimes\r', 3),
(590, 124, 'Often\r', 4),
(591, 124, 'Always', 5),
(592, 125, 'IF helps me access the CLE and/or control the tablets.\r', 0),
(593, 125, 'IF is respectful and approachable.\r', 0),
(594, 125, 'IF is respectable.\r', 0),
(595, 125, 'IF speaks in a calm and friendly manner.', 0),
(596, 125, 'Strongly Disagree\r', 1),
(597, 125, 'Disagree\r', 2),
(598, 125, 'Agree\r', 3),
(599, 125, 'Strongly Agree\r', 4),
(600, 125, 'Not Applicable', 5),
(601, 128, 'mobile data\r', 1),
(602, 128, 'mobile hotspot \r', 2),
(603, 128, 'Wi-Fi at home\r', 3),
(604, 128, 'Wi-Fi outside home (such as wi-fi of restaurants, malls, cafe, etc.)\r', 4),
(605, 128, 'pocket Wi-Fi\r', 5),
(606, 128, 'broadband/fiber\r', 6),
(607, 128, 'Internet cafe', 7),
(608, 129, 'BayanTel\r', 1),
(609, 129, 'Converge\r', 2),
(610, 129, 'Globe\r', 3),
(611, 129, 'PLDT\r', 4),
(612, 129, 'SkyCable\r', 5),
(613, 129, 'Smart\r', 6),
(614, 129, 'Sun\r', 7),
(615, 129, 'Wi-Tribe\r', 8),
(616, 129, 'Others\r', 9),
(617, 129, 'I do not know.', 10),
(618, 131, 'I can easily find the Aralinks CLE website.\r', 0),
(619, 131, 'The loading time of the Aralinks CLE is generally fast.\r', 0),
(620, 131, 'The connection to the Aralinks CLE is stable.\r', 0),
(621, 131, 'The loading time of the Aralinks CLE is fast even if I am browsing other websites.\r', 0),
(622, 131, 'I have problems connecting to the Aralinks CLE because the internet access outside school is generally slow.', 0),
(623, 131, 'Never\r', 1),
(624, 131, 'Rarely\r', 2),
(625, 131, 'Sometimes\r', 3),
(626, 131, 'Often\r', 4),
(627, 131, 'Always', 5),
(628, 132, 'IF helps me access the CLE and/or control the tablets.\r', 0),
(629, 132, 'IF is respectful and approachable.\r', 0),
(630, 132, 'IF is respectable.\r', 0),
(631, 132, 'IF speaks in a calm and friendly manner.', 0),
(632, 132, 'Strongly Disagree\r', 1),
(633, 132, 'Disagree\r', 2),
(634, 132, 'Agree\r', 3),
(635, 132, 'Strongly Agree\r', 4),
(636, 132, 'Not Applicable', 5),
(637, 135, 'Nursery\r', 1),
(638, 135, 'Kinder 1\r', 2),
(639, 135, 'Kinder 2\r', 3),
(640, 135, 'Grade 1\r', 4),
(641, 135, 'Grade 2\r', 5),
(642, 135, 'Grade 3\r', 6),
(643, 135, 'Grade 4\r', 7),
(644, 135, 'Grade 5\r', 8),
(645, 135, 'Grade 6\r', 9),
(646, 135, 'Grade 7\r', 10),
(647, 135, 'Grade 8\r', 11),
(648, 135, 'Grade 9\r', 12),
(649, 135, 'Grade 10\r', 13),
(650, 135, 'Grade 11\r', 14),
(651, 135, 'Grade 12', 15),
(652, 136, 'AP/Social Science\r', 1),
(653, 136, 'English\r', 2),
(654, 136, 'Filipino\r', 3),
(655, 136, 'Math\r', 4),
(656, 136, 'Science\r', 5),
(657, 136, 'CLE/Religion/Values Education\r', 6),
(658, 136, 'TLE/HELE\r', 7),
(659, 136, 'Computer/ICT\r', 8),
(660, 136, 'Music\r', 9),
(661, 136, 'Arts\r', 10),
(662, 136, 'PE\r', 11),
(663, 136, 'Health\r', 12),
(664, 136, 'SHS - Core Curriculum\r', 13),
(665, 136, 'SHS - STEM\r', 14),
(666, 136, 'SHS - ABM\r', 15),
(667, 136, 'SHS - HUMSS\r', 16),
(668, 136, 'SHS - Tech-Voc\r', 17),
(669, 136, 'SHS - Sports\r', 18),
(670, 136, 'SHS - Arts and Design', 19),
(671, 137, '0\r', 1),
(672, 137, '1\r', 2),
(673, 137, '2\r', 3),
(674, 137, '3\r', 4),
(675, 137, '4\r', 5),
(676, 137, '5', 6),
(677, 138, 'creation of resources is more efficient.\r', 0),
(678, 138, 'I have a means to gather and store my digital instructional materials.\r', 0),
(679, 138, 'I am able to use immediate feedback to influence my instruction.\r', 0),
(680, 138, 'I can process student responses more efficiently and effectively.\r', 0),
(681, 138, 'I can implement a variety of strategies other than the ones I have employed before .\r', 0),
(682, 138, 'I provide my students opportunities to create digital outputs.\r', 0),
(683, 138, 'I have means to document and collect student output.\r', 0),
(684, 138, 'I enrich instruction with the use of Android apps and Open Educational Resources (OERs) such as presentation slides, images, videos, and animated presentations  I downloaded from the web.', 0),
(685, 138, 'Never\r', 1),
(686, 138, 'Rarely\r', 2),
(687, 138, 'Sometimes\r', 3),
(688, 138, 'Often\r', 4),
(689, 138, 'Always', 5),
(690, 139, 'find the lessons more engaging and interesting.\r', 0),
(691, 139, 'are motivated to study further.\r', 0),
(692, 139, 'participate more actively.\r', 0),
(693, 139, 'understand lessons more clearly.\r', 0),
(694, 139, 'learn more about how the lessons apply and relate in my real life.\r', 0),
(695, 139, 'perform better in the various learning activities and assessments.', 0),
(696, 139, 'Strongly Disagree\r', 1),
(697, 139, 'Disagree\r', 2),
(698, 139, 'Agree\r', 3),
(699, 139, 'Strongly Agree', 4),
(700, 140, 'it stays on.\r', 0),
(701, 140, 'it functions and responds to my gestures.\r', 0),
(702, 140, 'it stays cool to the touch while I am using it.. \r', 0),
(703, 140, 'it responds quickly when I click any part of it.\r', 0),
(704, 140, 'it responds accurately when I click a specific part on it.\r', 0),
(705, 140, 'it is easy to drag items.\r', 0),
(706, 140, 'it connects quickly to the Wi-Fi.\r', 0),
(707, 140, 'its connection to the Wi-Fi is stable.\r', 0),
(708, 140, 'the on-screen keyboard responds accurately and quickly.\r', 0),
(709, 140, 'I can clearly see all the items on it.', 0),
(710, 140, 'Never\r', 1),
(711, 140, 'Rarely\r', 2),
(712, 140, 'Sometimes\r', 3),
(713, 140, 'Often\r', 4),
(714, 140, 'Always', 5),
(715, 141, 'Ease of Use - Clicking of buttons and menus to activate functions and jump to other sections of the CLE\r', 0),
(716, 141, 'Design and Layout - Readability, color, font, and design\r', 0),
(717, 141, 'Performance - Responsiveness and loading and downloading time of resources\r', 0),
(718, 141, 'Organization - Proper categorization of resources\r', 0),
(719, 141, 'Grade Tracking - Ability to monitor grades for various learning activities\r', 0),
(720, 141, 'Content Authoring - Variety of tools for authoring media-rich content\r', 0),
(721, 141, 'Migration of Content - Ease of copying activities and resources from one section to another\r', 0),
(722, 141, '\r', 0),
(723, 141, '', 0),
(724, 141, 'Very Dissatisfied\r', 1),
(725, 141, 'Dissatisfied\r', 2),
(726, 141, 'Satisfied\r', 3),
(727, 141, 'Very Satisfied\r', 4),
(728, 141, 'Not Applicable', 5),
(729, 142, 'It is easy to connect to the Aralinks Wi-Fi.\r', 0),
(730, 142, 'The connection to the CLE is stable.\r', 0),
(731, 142, 'The Aralinks Wi-Fi signal connection is strong.\r', 0),
(732, 142, 'The loading time of the Aralinks CLE is generally fast.', 0),
(733, 142, 'Never\r', 1),
(734, 142, 'Rarely\r', 2),
(735, 142, 'Sometimes\r', 3),
(736, 142, 'Often\r', 4),
(737, 142, 'Always', 5),
(738, 143, 'mobile data\r', 1),
(739, 143, 'mobile hotspot \r', 2),
(740, 143, 'Wi-Fi at home\r', 3),
(741, 143, 'Wi-Fi outside home (such as wi-fi of restaurants, malls, cafe, etc.)\r', 4),
(742, 143, 'pocket Wi-Fi\r', 5),
(743, 143, 'broadband/fiber\r', 6),
(744, 143, 'Internet cafe', 7),
(745, 144, 'BayanTel\r', 1),
(746, 144, 'Converge\r', 2),
(747, 144, 'Globe\r', 3),
(748, 144, 'PLDT\r', 4),
(749, 144, 'SkyCable\r', 5),
(750, 144, 'Smart\r', 6),
(751, 144, 'Sun\r', 7),
(752, 144, 'Wi-Tribe\r', 8),
(753, 144, 'Others\r', 9),
(754, 144, 'I do not know.', 10),
(755, 145, 'Promptness of response to Aralinks-related concerns\r', 0),
(756, 145, 'Accuracy of response to Aralinks-related concerns  \r', 0),
(757, 145, 'Usefulness of pocket training sessions (skill-based or subject-specific technical training sessions)', 0),
(758, 145, 'Very Dissatisfied\r', 1),
(759, 145, 'Dissatisfied\r', 2),
(760, 145, 'Satisfied\r', 3),
(761, 145, 'Very Satisfied', 4),
(762, 146, 'IF accommodates requests for assistance.\r', 0),
(763, 146, 'IF reports to class in time for the CLE and tablet use.\r', 0),
(764, 146, 'IF promptly and correctly responds to my concerns during in-class tablet use.\r', 0),
(765, 146, 'IF safeguards the tablet computers during and after use.\r', 0),
(766, 146, 'IF is reliable at all times. \r', 0),
(767, 146, 'IF helps facilitate other CLE-based school activities (student elections, evaluations, quiz bees, ARALinks Quest, etc). \r', 0),
(768, 146, 'IF wears decent attire always.\r', 0),
(769, 146, 'IF maintains positive working relationship with me and other teachers.\r', 0),
(770, 146, 'IF speaks in a calm and friendly manner.\r', 0),
(771, 146, 'IF provides assistance in school matters other than the Aralinks CLE and tablet use.', 0),
(772, 146, 'Very Dissatisfied\r', 1),
(773, 146, 'Dissatisfied\r', 2),
(774, 146, 'Satisfied\r', 3),
(775, 146, 'Very Satisfied\r', 4),
(776, 146, 'Not Applicable', 5),
(777, 149, 'Nursery\r', 1),
(778, 149, 'Kinder 1\r', 2),
(779, 149, 'Kinder 2\r', 3),
(780, 149, 'Grade 1\r', 4),
(781, 149, 'Grade 2\r', 5),
(782, 149, 'Grade 3\r', 6),
(783, 149, 'Grade 4\r', 7),
(784, 149, 'Grade 5\r', 8),
(785, 149, 'Grade 6\r', 9),
(786, 149, 'Grade 7\r', 10),
(787, 149, 'Grade 8\r', 11),
(788, 149, 'Grade 9\r', 12),
(789, 149, 'Grade 10\r', 13),
(790, 149, 'Grade 11\r', 14),
(791, 149, 'Grade 12', 15),
(792, 150, 'PowerPoint presentation\r', 1),
(793, 150, 'Videos\r', 2),
(794, 150, 'Songs/Audio recording\r', 3),
(795, 150, 'Animated presentations\r', 4),
(796, 150, 'Interactive Lessons\r', 5),
(797, 150, 'Interactive Quizzes\r', 6),
(798, 150, 'Games\r', 7),
(799, 150, 'Images/GIFs\r', 8),
(800, 150, 'RPGs\r', 9),
(801, 150, 'Forums\r', 10),
(802, 150, 'Android Apps (e.g. Colorfy, Kahoot, Real Piano)\r', 11),
(803, 150, 'Websites\r', 12),
(804, 150, 'Others', 13),
(805, 151, 'PowerPoint Presentations				\r', 0),
(806, 151, 'Videos				\r', 0),
(807, 151, 'Song/Audio Recording				\r', 0),
(808, 151, 'Animated Presentations				\r', 0),
(809, 151, 'Interactive Lessons				\r', 0),
(810, 151, 'Interactive Quizzes				\r', 0),
(811, 151, 'Games				\r', 0),
(812, 151, 'Images/GIFs				\r', 0),
(813, 151, 'RPGs				\r', 0),
(814, 151, 'Forums				\r', 0),
(815, 151, 'Android Apps (e.g. Colorfy, Kahoot, Real Piano)				\r', 0),
(816, 151, 'Websites', 0),
(817, 151, 'Not Helpful\r', 1),
(818, 151, 'A Little Helpful	\r', 2),
(819, 151, 'Helpful\r', 3),
(820, 151, 'Very Helpful', 4),
(821, 152, 'find the lessons more engaging and interesting.					\r', 0),
(822, 152, 'am motivated to study further.					\r', 0),
(823, 152, 'participate more actively.					\r', 0),
(824, 152, 'understand lessons more clearly.					\r', 0),
(825, 152, 'learn more about how the lessons apply and relate in my real life.', 0),
(826, 152, 'Strongly Disagree\r', 1),
(827, 152, 'Disagree\r', 2),
(828, 152, 'Agree\r', 3),
(829, 152, 'Strongly Agree\r', 4),
(830, 152, 'Not Applicable', 5),
(831, 153, 'research		\r', 0),
(832, 153, 'create CLE activities (e.g. forum, quizzes, games, glossary etc)		\r', 0),
(833, 153, 'report		\r', 0),
(834, 153, 'create WPS/Microsoft Office documents (e.g. Word, Ppt etc)		\r', 0),
(835, 153, 'present projects		\r', 0),
(836, 153, 'create projects using Android apps		\r', 0),
(837, 153, 'record videos		\r', 0),
(838, 153, 'record audio		\r', 0),
(839, 153, 'take pictures', 0),
(840, 153, 'Yes\r', 1),
(841, 153, 'No', 2),
(842, 154, 'it stays on.					\r', 0),
(843, 154, 'it functions and responds to my gestures.					\r', 0),
(844, 154, 'it stays cool to the touch while I am using it.					\r', 0),
(845, 154, 'it responds quickly when I click any part of it.					\r', 0),
(846, 154, 'it responds accurately when I click a specific part on it.					\r', 0),
(847, 154, 'it is easy to drag items.					\r', 0),
(848, 154, 'it connects quickly to the Wi-Fi.					\r', 0),
(849, 154, 'its connection to the Wi-Fi is stable.					\r', 0),
(850, 154, 'the on-screen keyboard responds accurately and quickly.					\r', 0),
(851, 154, 'I can clearly see all the items on it.', 0),
(852, 154, 'Never\r', 1),
(853, 154, 'Rarely\r', 2),
(854, 154, 'Sometimes\r', 3),
(855, 154, 'Often\r', 4),
(856, 154, 'Always', 5),
(857, 155, 'Ease of Use - Clicking of buttons and menus to activate functions and jump to other sections of the CLE					\r', 0),
(858, 155, 'Design and Layout - Readability, color, font, and design					\r', 0),
(859, 155, 'Performance - Responsiveness and loading and downloading time of resources					\r', 0),
(860, 155, 'Organization - Proper categorization of resources					\r', 0),
(861, 155, 'Grade Tracking - Ability to monitor grades for various learning activities', 0),
(862, 155, 'Very Dissatisfied\r', 1),
(863, 155, 'Dissatisfied\r', 2),
(864, 155, 'Satisfied\r', 3),
(865, 155, 'Very Satisfied\r', 4),
(866, 155, 'Not Applicable', 5),
(867, 156, 'It is easy to connect to the Aralinks Wi-Fi.					\r', 0),
(868, 156, 'The connection to the CLE is stable.					\r', 0),
(869, 156, 'The Aralinks Wi-Fi signal connection is strong.					\r', 0),
(870, 156, 'The loading time of the Aralinks CLE is generally fast.', 0),
(871, 156, 'Never\r', 1),
(872, 156, 'Rarely\r', 2),
(873, 156, 'Sometimes\r', 3),
(874, 156, 'Often\r', 4),
(875, 156, 'Always', 5),
(876, 157, 'mobile data\r', 1),
(877, 157, 'mobile hotspot \r', 2),
(878, 157, 'Wi-Fi at home\r', 3),
(879, 157, 'Wi-Fi outside home (such as wi-fi of restaurants, malls, cafe, etc.)\r', 4),
(880, 157, 'pocket Wi-Fi\r', 5),
(881, 157, 'broadband/fiber\r', 6),
(882, 157, 'Internet cafe', 7),
(883, 158, 'BayanTel\r', 1),
(884, 158, 'Converge\r', 2),
(885, 158, 'Globe\r', 3),
(886, 158, 'PLDT\r', 4),
(887, 158, 'SkyCable\r', 5),
(888, 158, 'Smart\r', 6),
(889, 158, 'Sun\r', 7),
(890, 158, 'Wi-Tribe\r', 8),
(891, 158, 'Others\r', 9),
(892, 158, 'I do not know.', 10),
(893, 159, 'IF helps me access the CLE and/or control the tablets.\r', 0),
(894, 159, 'IF is respectful and approachable.\r', 0),
(895, 159, 'IF is respectable.\r', 0),
(896, 159, 'IF speaks in a calm and friendly manner.', 0),
(897, 159, 'Strongly Disagree\r', 1),
(898, 159, 'Disagree\r', 2),
(899, 159, 'Agree\r', 3),
(900, 159, 'Strongly Agree\r', 4),
(901, 159, 'Not Applicable', 5);

-- --------------------------------------------------------

--
-- Table structure for table `quest_response`
--

CREATE TABLE `quest_response` (
  `id` int(11) NOT NULL,
  `response_id` varchar(64) NOT NULL,
  `quest_id` int(11) NOT NULL,
  `submitted` int(11) NOT NULL,
  `complete` int(1) NOT NULL,
  `username` varchar(256) NOT NULL,
  `school` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `quest_response_bool`
--

CREATE TABLE `quest_response_bool` (
  `id` int(11) NOT NULL,
  `response_id` varchar(64) NOT NULL,
  `question_id` int(11) NOT NULL,
  `choice_id` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `quest_response_multiple`
--

CREATE TABLE `quest_response_multiple` (
  `id` int(11) NOT NULL,
  `response_id` varchar(64) NOT NULL,
  `question_id` int(11) NOT NULL,
  `choice_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `quest_response_rank`
--

CREATE TABLE `quest_response_rank` (
  `id` int(11) NOT NULL,
  `response_id` varchar(64) NOT NULL,
  `question_id` int(11) NOT NULL,
  `choice_id` int(11) NOT NULL,
  `rank` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `quest_response_single`
--

CREATE TABLE `quest_response_single` (
  `id` int(11) NOT NULL,
  `response_id` varchar(64) NOT NULL,
  `question_id` int(11) NOT NULL,
  `choice_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `quest_response_text`
--

CREATE TABLE `quest_response_text` (
  `id` int(11) NOT NULL,
  `response_id` varchar(64) NOT NULL,
  `question_id` int(11) NOT NULL,
  `response` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `schools`
--

CREATE TABLE `schools` (
  `id` int(11) NOT NULL,
  `schoolname` varchar(256) NOT NULL,
  `schoolid` varchar(256) NOT NULL,
  `program` varchar(30) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `schools`
--

INSERT INTO `schools` (`id`, `schoolname`, `schoolid`, `program`, `status`) VALUES
(1, 'Aguilar Catholic School', '3326c07cff8764bfbca299cff36a2503', 'Teachnology', 0),
(2, 'Assumpta Academy', '59c4cbc40041dd596489f8f067cc0c66', 'Teachnology', 0),
(3, 'Binangonan Catholic College', '2140a89ad80370a8c90a905c7f98d5da', 'Teachnology', 0),
(4, 'Catholic Central School of Tabaco', 'ddeca0448bf660879d60dfa6c05285b0', 'Teachnology', 0),
(5, 'Colegio de Santa Rosa - Makati', '4263b3576bc75da7d59aea24f6a2ddc6', 'Teachnology', 0),
(6, 'Colegio de San Jose - Alaminos, Pangasinan', '33a3c8bbbe10d90defb8195daec72063', 'Teachnology', 0),
(7, 'De Guia Academy', '4cdc6bb202ada88fe5e02e6ad37438c1', 'Teachnology', 0),
(8, 'Divine Word College of Legazpi', '614078bcb63da1b17c3aa9dc12d2fab0', 'Teachnology', 0),
(9, 'Divine Word College of Vigan', '4dec4f3efad1405c0bef33ec90b2d3f4', 'Teachnology', 0),
(10, 'Dominican School of Camalig', 'c1f35404d056bbe2fec9d0760a99ef05', 'Teachnology', 0),
(11, 'Ednas School - Alaminos City', 'f84274a0fc1f6441da0f3c27bd4ae995', 'Teachnology', 0),
(12, 'Ednas School - Dagupan City', 'ed8befaa289d4c22d71e38656de5d025', 'Teachnology', 0),
(13, 'Ednas School - San Carlos City', '276c2a171e5589a17f609aa4d7b5947c', 'Teachnology', 0),
(14, 'Fr. Michael Donoher Memorial School', 'dd0406c66bbfb75f5fa69fa518f3f218', 'Teachnology', 0),
(15, 'Holy Cross Catholic School', 'bc1f9f978d5946fa8c9ded0dfb0535b1', 'Teachnology', 0),
(16, 'Holy Family Academy - Cavite', '6f7769d2cf103322bf5aec431b6f77b2', 'Teachnology', 0),
(17, 'Immaculate Conception Parochial School', 'b686939048944ac966540693ee9068dd', 'Teachnology', 0),
(18, 'Immaculate Concepcion Parish Learning Center', '244280b509ac8c46dbff2bb20f9cedcc', 'Teachnology', 0),
(19, 'Infant Jesus Academy - Cavite', 'd2684696780bfdf465fe8e39948ace1d', 'Teachnology', 0),
(20, 'Jesus Son of Mary Academy', 'a4c8d34b1f43e2eb832fee7131db4c9a', 'Teachnology', 0),
(21, 'Kings College of the Philippines', 'e6bae92626d6daf2bdb6b4db0c884b91', 'Teachnology', 0),
(22, 'Assumpta Academy', 'b8aaf23a170e589190cc73c566570956', 'Teachnology', 1),
(23, 'La Consolacion College - Caloocan', '79622b00b5a41f216def960713ab51f3', 'Teachnology', 0),
(24, 'La Consolacion College - Baao', '8a0eeecb83ee4a8b42a8f7ee427ea72b', 'Teachnology', 0),
(25, 'La Consolacion College - Iriga', '0ecf77c4ea3a321c3fb2176d498b770b', 'Teachnology', 0),
(26, 'Mangatarem Catholic School', '7f7cd1c84440d9827feeb158fa8992a6', 'Teachnology', 0),
(27, 'Maragondon Parochial School', '12b941283648f444ab99e76242a8e9ef', 'Teachnology', 0),
(28, 'Marist School', '99be68197a4229524331c4258f922553', 'Teachnology', 0),
(29, 'Nazareth School - Cavite', '1227ce19c56b89db6222c5b16d7e2de9', 'Teachnology', 0),
(30, 'Our Lady of Perpetual Succor College', '69e98f91cb5cf8b52285240b2cd7c10a', 'Teachnology', 0),
(31, 'Our Lady of Pillar Catholic School, Inc.', '42be53abede083b58ef3a5ddda2b45c5', 'Teachnology', 0),
(32, 'Paraclete Foundation Community School', 'f2f2f86f828eb487460661708794b915', 'Teachnology', 0),
(33, 'Sacred Heart of Jesus Academy', '5e5a41acee66b29dbac0359f4446a14a', 'Teachnology', 0),
(34, 'St. Louise De Marillac School of Miag-ao', '52ab949cbc9972f760f4c0539dd4a1a6', 'Teachnology', 0),
(35, 'Santo Rosario Catholic School', '01dd7e86ee6c76e177b0a2c7ac787f8f', 'Teachnology', 0),
(36, 'Siena College of Tigaon', '8f6f6fa4843b5a4d886f804bc7f7ca9c', 'Teachnology', 0),
(37, 'St. Albert the Great School', '8ed1bf50e69c758162b278ff1c053746', 'Teachnology', 0),
(38, 'St. Anne College,Lucena Inc.', '7d6993c3368cfd7604789fa1c5c9bebe', 'Teachnology', 0),
(39, 'St. Augustine School - Mendez', 'e64104eb65f5fc0db02a6e2aff6a570d', 'Teachnology', 0),
(40, 'St. Augustine School - Tanza', 'c6ba42165130c6bcbc63b2c23e1d4575', 'Teachnology', 0),
(41, 'St. Benedict Academy', '54bde38e68abd704a47b5d9ca6058dab', 'Teachnology', 0),
(42, 'St. Bridget College - Alitagtag', '18814034ad3008d5d802f0f9ed6fe7af', 'Teachnology', 0),
(43, 'St. Columban\'s School-Labrador', 'a24f21c18b581514bea588463d4815f2', 'Teachnology', 0),
(44, 'St. Francis of Asisi Academy', 'd3f16f04f03c588c6ebf35a081428834', 'Teachnology', 0),
(45, 'St. Gregory Academy', 'ed7ccbf45facb42d51e8d39e0ebec0d3', 'Teachnology', 0),
(46, 'Saint Joseph Parochial School', 'c73e704785a51882b1bd4b88b71472b2', 'Teachnology', 0),
(47, 'St. Jude Parish School', '52531d1c6d54617d3cc99c9d33a51e58', 'Teachnology', 0),
(48, 'St. Louis University (Grade School)', '4562cdef5a60025ce1d0d8fa48e83561', 'Teachnology', 0),
(49, 'St. Louis University (High School)', '292bc7112719202783bc4c452273d2c3', 'Teachnology', 0),
(50, 'St. Mary Magdalene Parochial School', 'cdb92fdb6e5b1ef26e4ab6d643eed3ba', 'Teachnology', 0),
(51, 'St. Mary Magdalene School', '8ba9965c24554ca44e01dc0186f1f6c7', 'Teachnology', 0),
(52, 'St. Michael Institute', '644064d7dd30891d1fedd153131eb5f9', 'Teachnology', 0),
(53, 'St. Paul College of San Rafael', 'ab9bfa7bd475361f1ccfed7e31ab0483', 'Teachnology', 0),
(54, 'St. Peter Academy', 'fe05e0acbc412eadd3553aab594016b1', 'Teachnology', 0),
(55, 'St. Therese Catholic School', '991590971a9ab8453cffb2c208318d1b', 'Teachnology', 0),
(56, 'Sta. Cruz Academy', 'acbc15a01373256e436609e3e044c33d', 'Teachnology', 0),
(57, 'Tanchuling College', 'b3c9d54e5f8bbb73466d863d5f1e9411', 'Teachnology', 0),
(58, 'Woodridge College', 'aa4bbeac53e53bd500ff9fc5ac58b85e', 'Teachnology', 0),
(59, 'Assumption Iloilo, Inc.', '0a280af109c0bc472ffee7832e1291b4', 'Teachnology', 0),
(60, 'Celestino A. Ablas Sr. Academy, Inc.', 'd889ff6dae5a04f99d28994926723c94', 'Teachnology', 0),
(61, 'Christ the King College - Iligan', 'ebf1f5f933afc78ec2e41a4b54e9c306', 'Teachnology', 0),
(62, 'Christ the King College - Samar', '2de0d040d5e91db836880363b0e40cc8', 'Teachnology', 0),
(63, 'Claret College of Isabel', 'e57953f9be3343979ac9674163d60910', 'Teachnology', 0),
(64, 'Claret School of Zamboanga', '1429156f14e164c6c087179c9cf710f1', 'Teachnology', 0),
(65, 'Colegio De la Medalla Milagrosa', '1754d8e26fe9113224f9a8d5f8ca86f6', 'Teachnology', 0),
(66, 'Colegio De San Francisco Javier, Inc.', 'fd35df1e2aad8f771de9a1db86b3e08a', 'Teachnology', 0),
(67, 'Colegio de San Jose - Iloilo', '92cfdbb6005f3bf4b5bda62d5463e262', 'Teachnology', 0),
(68, 'Colegio del Sagrado Corazon de Jesus', 'fc87976230bf3c79656b1b558274d4cb', 'Teachnology', 0),
(69, 'Conperey Integrated Learning School', '61bab2425b77b0cd8d052c6a96ca1000', 'Teachnology', 0),
(70, 'Corpus Christi Parochial School', '39d99c9a5539d69ac8065f2657424d51', 'Teachnology', 0),
(71, 'Cristo Rey (High School)', 'd1374a9e04ed854f6cbcac36f8ab339b', 'Teachnology', 0),
(72, 'Cristo Rey (Senior High School)', 'c7752fd1c81439fefd422c8753ebe0dd', 'Teachnology', 0),
(73, 'Davao Central College', '6c212ddf87b5cc45e1cdabd0eda4676f', 'Teachnology', 0),
(74, 'Grelina Osmena Christian College', 'e0364356b7aaebe1e86e824c330c4b18', 'Teachnology', 0),
(75, 'Hinundayan Catholic Institute', 'fad0edb3c223b9d842eee93b0fc090f6', 'Teachnology', 0),
(76, 'Holy Cross High School', 'ff2414c8a2b0bdbb28b04316e328b8c3', 'Teachnology', 0),
(77, 'Holy Cross of Mintal', 'a48beb8a2d996482a01c24db0764b088', 'Teachnology', 0),
(78, 'Holy Family of Nazareth School', '7d41b5d2aed8c035a177c7374cf950a6', 'Teachnology', 0),
(79, 'Holy Rosary Academy', '0009349ebf50edf4f475f10c3590d439', 'Teachnology', 0),
(80, 'Iloilo Sacred Heart School Inc.', 'c4d58af068757a2b2a1963ce3a7d460e', 'Teachnology', 0),
(81, 'Immaculate Heart of Mary Academy - Negros Oriental', '335786b43c2b9bb32b2b377e45565b37', 'Teachnology', 0),
(82, 'Immaculate Heart of Mary Academy - Davao', 'e14f4701c112e9d0c17f14ecc3b8eab3', 'Teachnology', 0),
(83, 'Lanipao Catholic High School', 'b6805db633856e4716768d8de449dd17', 'Teachnology', 0),
(84, 'Mercy Junior College', 'f9303f6f947cefd482e047fe78a1475b', 'Teachnology', 0),
(85, 'Nazareth High School - Davao', '8d0dea364342b2fa6a74f1e5d3dbc78b', 'Teachnology', 0),
(86, 'Notre Dame of Abuyog, Inc.', '5dd6ead0554df96c8d6415a679566d93', 'Teachnology', 0),
(87, 'Notre Dame of Cathedral Elementary School', '826391eda3c3261ba40c37a43fa57a3a', 'Teachnology', 0),
(88, 'Notre Dame of Dukay Inc.', '97c27e176f374c3bd03328006a30f091', 'Teachnology', 0),
(89, 'Notre Dame of Esperanza', 'db814f458ec15718a461a21e3777e46d', 'Teachnology', 0),
(90, 'Notre Dame of Isulan', '9c00547ce02980dbd6d98b8337c90dc2', 'Teachnology', 0),
(91, 'Notre Dame of Jaro, Inc.', '8388f5d596918ff0817f214e37057eaa', 'Teachnology', 0),
(92, 'Notre Dame of Kalamansig, Inc.', '496009daedee72ad0ce2f74f681c42d8', 'Teachnology', 0),
(93, 'Notre Dame of Katiko Inc.', 'facaffb05f5b17fc51b4aea603951333', 'Teachnology', 0),
(94, 'Notre Dame of Kulaman, Inc.', '8eabe092ff1d72756fd7789d84802e3b', 'Teachnology', 0),
(95, 'Notre Dame of Lambayong', '4141ffe6a2f3dea08d537ce4a9763f8c', 'Teachnology', 0),
(96, 'Notre Dame of Libungan', '8807b639e632ebfbb4e56fcb5c018bf5', 'Teachnology', 0),
(97, 'Notre Dame of Masiag', '8a83dac9fbabe22921e044709468444b', 'Teachnology', 0),
(98, 'Notre Dame of Parang', '4e4e58ff7ff57656c1dda92371363731', 'Teachnology', 0),
(99, 'Notre Dame of Pigcawayan', 'c197b5cf7703e44449745c6697439b08', 'Teachnology', 0),
(100, 'Notre Dame of Salaman College', 'c6e56de8848d52d893f1f4a03ef8361c', 'Teachnology', 0),
(101, 'Notre Dame of Sarmiento', '6b50c13a923913d032f77af1318dc34f', 'Teachnology', 0),
(102, 'Notre Dame of Tacurong College', 'aebd76a261d3faa4cfe95e3f7d5fedc6', 'Teachnology', 0),
(103, 'Notre Dame of Upi', '4ecc52ba13c4a17824a14672fa593b7a', 'Teachnology', 0),
(104, 'Notre Dame RVM College of Cotabato', '20f26a9541ea804cb8a8c8ef331ebc1c', 'Teachnology', 0),
(105, 'Our Lady of Fatima Academy - Samar', '135094f9d65f08772a6b51ac505c755a', 'Teachnology', 0),
(106, 'Our Lady of Perpetual Help Academy', '8036f36a73b583c650013b27313c08f7', 'Teachnology', 0),
(107, 'Philippine Nikkei Jin Kai International School', '18fbc2005620e9843ac08db67b459745', 'Teachnology', 0),
(108, 'Rizal Memorial Institute of Dapitan City, Inc.', 'aa816478e06c755c8f36f4fe43ddcd34', 'Teachnology', 0),
(109, 'Sacred Heart De Iloilo School', '7bb4a02aeb28c9c19a55b8ab2d9c0d04', 'Teachnology', 0),
(110, 'Sacred Heart High School - Iligan', 'f5b74778c99f4eba9ee846ddc4d8add9', 'Teachnology', 0),
(111, 'Saint Anthony\'s High School', 'd56ce317a43e0d9161cb3910ce2a932a', 'Teachnology', 0),
(112, 'Saint Estanislao Kostka College, Inc.', 'ff1677cf35d5a5317752028db48c2d26', 'Teachnology', 0),
(113, 'Saint Joseph College of Sindangan Inc.', '043768634ce0c18c8ba2aba30ee18de2', 'Teachnology', 0),
(114, 'Saint Louis College - Cebu', '44a63fbda0ed2b83506793371a8c7f49', 'Teachnology', 0),
(115, 'San Roque College of Cebu', '699b4345782855203f542a7b92c26444', 'Teachnology', 0),
(116, 'St. Augustine Academy', '0f4369aa6251d8657d7c614dc92af12d', 'Teachnology', 0),
(117, 'St. Francis Xavier Academy - Iligan', '152093d9ebcdb4c61237d3f82aaf5cc7', 'Teachnology', 0),
(118, 'St. Joseph School of Mactan', '90a93da0ad66bd41cb5ce44cba22c42d', 'Teachnology', 0),
(119, 'St. Joseph\'s Community High School', '55a99af3b1c7bc1e9eebf5194a64aa97', 'Teachnology', 0),
(120, 'St. Mary\'s Academy of Palo', '40e77778bd722964340d9730a6f9df91', 'Teachnology', 0),
(121, 'St. Mary\'s College - Borongan', 'c7be8f605b08a3a56141dccfd5040316', 'Teachnology', 0),
(122, 'St. Mary\'s College - Catbalogan', '0329727ebad2b1db36377223550cf5e3', 'Teachnology', 0),
(123, 'St. Mary\'s College of Bansalan', '117538cd011b93e3da0f908ecb593b94', 'Teachnology', 0),
(124, 'St. Paul School', '805af7eb022956d280eefdaafb9c62c9', 'Teachnology', 0),
(125, 'St. Scholastica\'s Academy - Bacolod', 'b1a60ad8a44b98b026f69ee072883539', 'Teachnology', 0),
(126, 'St. Teresa\'s School', '11a2f23e1a2cf8475185563d42efad48', 'Teachnology', 0),
(127, 'St. Thomas Aquinas College', 'b6e5746015b61d9ae1dc2af2a588053a', 'Teachnology', 0),
(128, 'St. Vincent Academy', 'aab8b082265f069e306cdbc8057d75a5', 'Teachnology', 0),
(129, 'St. Vincent\'s College', '1f40f4755086d455186737429a78d90f', 'Teachnology', 0),
(130, 'Stella Maris Academy of Davao', '5e7979039a0ea594e3e8621028a68f2d', 'Teachnology', 0),
(131, 'Sto. Nino Academy - Leyte', 'f6b95ab6ebbdac49e66779365fec378a', 'Teachnology', 0),
(132, 'Sto. Nino Academy De Iligan', 'c1b991c89657933a73f1fdd0ba466fd7', 'Teachnology', 0),
(133, 'Sto. Nino High School - Iligan', '814721b2c9c48e90cdb1a071f9ea6fe0', 'Teachnology', 0),
(134, 'The College of Maasin', '22e5a6bfc1572d8deca577b3bb7cabca', 'Teachnology', 0),
(135, 'University of Bohol', '0b08afa6eab49926257342003b6fd3fe', 'Teachnology', 0),
(136, 'University of San Jose Recoletos - Balamban', '94d2e3cc4a44d73b45d9e7265c3c8314', 'Teachnology', 0),
(137, 'Binmaley Catholic School', '1fba50fedfa52912b3dd3b8b68b57cb3', 'Teachnology', 0),
(138, 'Bulacan Standard Academy', 'a18c4bf984a584b6a2ab4053f73637fc', 'Teachnology', 0),
(139, 'Camella School (SNV)-Nueva Vizcaya', '4ecb7043a473d01d37d7919e9b5fac5e', 'Teachnology', 0),
(140, 'College of the Holy Spirit-Tarlac (Grade School)', '2cda1ef54ce3c412006365cf98533a8d', 'Teachnology', 0),
(141, 'Columban College-Barreto', '070f0e20b4912d03370adf87b99f5095', 'Teachnology', 0),
(142, 'Concepcion Catholic School', '8263a6ed1ae598056c0f6b4be185e2c3', 'Teachnology', 0),
(143, 'Dasol Catholic School', '4bb0dc6c5e3b7281661f814a1833ea67', 'Teachnology', 0),
(144, 'Jesus the Nazarene School', 'b7a7ab2c35d599e891526f18aacad4b4', 'Teachnology', 0),
(145, 'La Consolacion College - Daet', '1e20786875671ddae1df07191fe2ce59', 'Teachnology', 0),
(146, 'Malasiqui Catholic School', 'a5358084cb969eb11a897d2de0bcf365', 'Teachnology', 0),
(147, 'Mapandan Catholic School', 'dd8443d5d8adfca2c269e6346a130940', 'Teachnology', 0),
(148, 'Marella Christian Institute - Main Trece', '77e3a2e1c9412b46c0a9b8067ac27090', 'Teachnology', 0),
(149, 'Marella Christian Institute - Molino', 'e77e165c18e52892c682cd2f852b1ca6', 'Teachnology', 0),
(150, 'Mary Help of Christians Minor Seminary', '5a2ac232f47d4ec6e09fb2557cb877a8', 'Teachnology', 0),
(151, 'Mary Help of Christians Catholic School', '93bb3aa676a9a688dbd51a2210d501ba', 'Teachnology', 0),
(152, 'Monlimar Development Academy', 'dd9cb4694b9a4441241b82b908b183d0', 'Teachnology', 0),
(153, 'Mt. Moriah Christian Academy', '4e510832d36c6a9b9f03ec912682d6d3', 'Teachnology', 0),
(154, 'Narvacan Catholic School', '182b56418a3a932e73b4454e4cfe7de6', 'Teachnology', 0),
(155, 'Olongapo Wesley School (Grade School)', 'ca7045b10e1f9fe8ae9c8efb96d0548f', 'Teachnology', 0),
(156, 'San Jacinto Catholic School', '8af8f6ee6c124cc301e3898d989e87f7', 'Teachnology', 0),
(157, 'St. Bridget College (Grade School)', '5b103f578ff4d387ca3bb1d88e1480cf', 'Teachnology', 0),
(158, 'St. Charles Academy', '8685490f08f8762e258ebd1223558d31', 'Teachnology', 0),
(159, 'St. Columban\'s College', '02c6184f0b9d9ebd8e704bb469421fb5', 'Teachnology', 0),
(160, 'St. Columban\'s Institute', '2d562f2d24a67d2cc12de3843d16bf72', 'Teachnology', 0),
(161, 'St. James Academy - Bulacan', '71772f9c0c3a54e05ddda02cb0add893', 'Teachnology', 0),
(162, 'St. John Cathedral School', '5c13518c40bd682df3611227c795669b', 'Teachnology', 0),
(163, 'St. Paul College of Ilocos Sur', '097bbbd0178710f9e9549fe6ab551487', 'Teachnology', 0),
(164, 'St. Theresa\'s School of Novaliches', '0eef7796c36b2c2d40ee2f347810a01d', 'Teachnology', 0),
(165, 'St. Vincent Catholic School', '4bbfd4268830d34cb0a1213ab683258a', 'Teachnology', 0),
(166, 'Sto. Tomas Catholic School', '6955e11744fc64aa3a5e8a7453508aca', 'Teachnology', 0),
(167, 'Urbiztondo Catholic School', '379f2bfd90a6ac16e177de2286294069', 'Teachnology', 0),
(168, 'Archidiocesan School of San Fabian', '72a24af4574e908967c14f0ae8b819d1', 'Teachnology', 0),
(169, 'Blessed Trinity College', 'f4baef6b5169a49b0b7d755ae87496dd', 'Teachnology', 0),
(170, 'Colegio de La Inmaculada Concepcion - Mandaue', '3780488078e1fcf9dc76f1a05ba41f6a', 'Teachnology', 0),
(171, 'Colegio De Las Hijas De Jesus', 'f81075c4c2ea419f46f9fe243069f341', 'Teachnology', 0),
(172, 'Fatima College of Camiguin', 'c7f3c230ead5e124834c37b3681b6dcd', 'Teachnology', 0),
(173, 'Holy Infant College', '30b290cb80618bc33bd1473ac11f6f4a', 'Teachnology', 0),
(174, 'La Consolacion College - Cebu', 'd076c5d271922a48502a70b8a337b866', 'Teachnology', 0),
(175, 'Liceo de Cagayan University', 'd10bdef26e396a3799ccdda0e060480f', 'Teachnology', 0),
(176, 'Little Flower School', '12ca3e25a469b5645646f312e25547bc', 'Teachnology', 0),
(177, 'Marian College', '91bcbfa3405aabfd796eeb8cb2c22ac4', 'Teachnology', 0),
(178, 'Merry Child School', '66f3cade7e92a6258aef4c2913da3021', 'Teachnology', 0),
(179, 'St. Alphonsus Catholic School (Grade School)', 'def08a32d450fcf0064b251b222f52da', 'Teachnology', 0),
(180, 'St. Alphonsus Catholic School (High School)', 'c45ca62e8f54cd15024a8e691b32f434', 'Teachnology', 0),
(181, 'St. Francis Academy', 'b4b29f77192df18ffa53608f661bc14b', 'Teachnology', 0),
(182, 'St. Francis College', '15e56abfec95097da188a02a98837b5c', 'Teachnology', 0),
(183, 'St. Mary\'s School - Cagayan de Oro', '7ab5ccfec4fa05e7cf6d9edd5c229e5f', 'Teachnology', 0),
(184, 'St. Michael Academy', '3ec2035419c8c63ea1edfc0606d186aa', 'Teachnology', 0),
(185, 'St. Scholastica\'s Academy - Talisay', '02c2c80dd3c33f2bdbb351498fcf3e8a', 'Teachnology', 0),
(186, 'St. Therese Christian Development Center Foundation, Inc.', '74c3863191a4340c7a13da611253844b', 'Teachnology', 0),
(187, 'Zamboanga Chong Hua High School', '577390eb60e2ae557dbe0d0ee225db49', 'Teachnology', 0),
(188, 'Colegio De San Jose Del Monte', '110ed9d50d94e18dceb9db56dd86d3f0', 'Teachnology', 0),
(189, 'Columban College, Inc.', '1499ffa74af8323a17eaf5547f45d7cd', 'Teachnology', 0),
(190, 'Infant Jesus Academy - Antipolo, Rizal', 'a0f1292ef01a4b8055edb923a2e7e231', 'Teachnology', 0),
(191, 'Mother of Perpetual Help School', 'faa3ce74cba8cc82497f2d98bd7e21f5', 'Teachnology', 0),
(192, 'St. Joseph College, Inc.', '1defdcc31baaeda71f73717ab308d2b4', 'Teachnology', 0),
(193, 'St. Martin De Porres Catholic School - Paombong', '3ac20abd8eea6e029b2b9e928aec13a8', 'Teachnology', 0),
(194, 'St. Paul College of Bocaue', 'b27152ece41f092e07c22d4cd8af9a7f', 'Teachnology', 0),
(195, 'Sta. Teresa College', '94f2f3a0f18852111d75bee86192eb11', 'Teachnology', 0),
(196, 'Sto. Nino De Novaliches School, Inc.', '5d05ace14ec273fd0eb14e5ec236ee5a', 'Teachnology', 0),
(197, 'Aklan Catholic College', 'bc6e1d50708e4ddc39dfc6b82b8c6eb5', 'Teachnology', 0),
(198, 'La Consolacion College - Bais', '605491ff67a09b54b445f9a36201c63e', 'Teachnology', 0),
(199, 'Salve Regina School of Palawan Inc.', '3cada3ea5fd908ad057068e52d81221a', 'Teachnology', 0),
(200, 'Infant Jesus Academy - Kalibo', '404254fb252716cda9147f310e22fbcd', 'Teachnology', 0),
(201, 'Assumpta Technical High School', 'db6f097b20a04f4a1983b5f7c89cda65', 'Hub', 0),
(202, 'Colegio Del Santisimo Rosario', 'e857eef1d6a7f23ae024216baedf5bd5', 'Hub', 0),
(203, 'Dominican School of Pilar', 'a7e74ce2de6cd02147549006e2441025', 'Hub', 0),
(204, 'Dominican School of Sta. Rita', 'dc67ed01f9496ec4dd47e1160f7cbd3b', 'Hub', 0),
(205, 'Don Carlo Cavina', '2929058c32c0b33d2785d09b1abb8c5c', 'Hub', 0),
(206, 'Holy Angel University', '5f088bd78d16c735d810cf97a3dbc96d', 'Hub', 0),
(207, 'Holy Family Academy - Pampanga (Grade School)', '5b5dbca0103819e70b3fbad51ce333b1', 'Hub', 0),
(208, 'Holy Family Academy - Pampanga (High School)', 'e78f0d33e318557d875f98db656420b1', 'Hub', 0),
(209, 'Laguna College of Business and Arts', '33aab1847c424768a0caaf01cbd89fc4', 'Hub', 0),
(210, 'Mary Help of Christians College, Salesian Sisters, Inc.', 'de85de9bae3762c8a9e1b53fc33a8e64', 'Hub', 0),
(211, 'Nasugbu Christian Faith Academy', 'f0cc411e810789eddaf269e8b132bfbb', 'Hub', 0),
(212, 'New Era University - Batangas', '5a5085b1117d5a6b34dab153076986c8', 'Hub', 0),
(213, 'New Era University - Pampanga', 'cc277cdcfadb71a30bc78701f3352a01', 'Hub', 0),
(214, 'New Era University - Quezon City', 'e897a05f6437acdc7d5a81c2b61a8951', 'Hub', 0),
(215, 'Philippine Cultural College', '5e31b356b72f1d20465609372271b55e', 'Hub', 0),
(216, 'Sacred Heart Academy Pasig', 'aba4ff691e68dcff4512795222b34c61', 'Hub', 0),
(217, 'Sacred Heart College', 'bd1a2157fb62fe6fd7faeda9933de9ec', 'Hub', 0),
(218, 'St. Bridget College (Grade School)', 'decd34cc018940d16ad55fb4a794928d', 'Hub', 0),
(219, 'St. John Fisher School - Bacoor', '2832649999a3f9384fa595bd9b530c62', 'Hub', 0),
(220, 'St. John Fisher School - Imus', '4d02ff452694e226f4619cc919c43271', 'Hub', 0),
(221, 'St. Louise De Marillac College of Sorsogon', 'aef1e75e568cb42cd6c69867931ae6fa', 'Hub', 0),
(222, 'St. Mary\'s Academy of Caloocan City', 'c21451e8e10426f385311f40bdaf6031', 'Hub', 0),
(223, 'St. Michael\'s Academy of Oas', '741fce37702baab18f7b3a3b248bfd49', 'Hub', 0),
(224, 'St. Therese of the Child Jesus Academy, Inc.', '2ecc717ef02e3e90019e2af8d7588270', 'Hub', 0),
(225, 'Universidad De Sta. Isabel - Naga', '945ad3058617bb072772ffcf55682b61', 'Hub', 0),
(226, 'UST Angelicum College', 'a025a5d120ae4ff2f859c404879add67', 'Hub', 0),
(227, 'Notre Dame of Dadiangas University (High School)', 'a8632a08f547c78ec29ca5d26dfa4d9a', 'Hub', 0),
(228, 'New Era University - General Santos', '5a43e9a9aeb14d250f33a81fe4806806', 'Hub', 0),
(229, 'Franciscan College of the Immaculate Conception', '4512b8f3a1396715221e55a2010e3aea', 'Hub', 0),
(230, 'Holy Family School', 'f2ed5c5e6f482b5466366bac3d870efc', 'Hub', 0),
(231, 'Holy Spirit School of Cubao', '454a7c5fda4e4e760e32a3a26312b447', 'Hub', 0),
(232, 'Jesus Good Shepherd School', '716bab46b07a8c62c2d9c76b0fd79e04', 'Hub', 0),
(233, 'Saint Mary\'s Angels College of Pampanga', 'ca5a295cb9649cba4151cceaf0da8d51', 'Hub', 0),
(234, 'Saint Mary\'s Angels College of Valenzuela', 'dba5c67741742d1bb096e665909b0794', 'Hub', 0),
(235, 'Sta. Teresa College', 'f414c57482fad6cf138ee66586758650', 'Hub', 0),
(236, 'St. Mary\'s College - Quezon City', '8d508e7476da48b65e72582f6de208fc', 'Hub', 0),
(237, 'St. Paul College - Paranaque', '0a85ccbe738536a9307aeffbf511984b', 'Hub', 0),
(238, 'University of Santo Tomas - Legazpi (Grade School)', '142a16160f21e1afbc8d7dfe308cf86c', 'Hub', 0),
(239, 'Zamora Memorial College', '3def81dcb939b219c8e36ce5f1bfd632', 'Hub', 0),
(240, 'St. Paul University - Quezon City', '20f2b26bef3745295748b770dcfbd179', 'Hub', 0),
(241, 'St. Raphael Academy', '3451bfe27a8ade3841ab00b0a1f04a47', 'Hub', 0),
(242, 'Notre Dame-Siena College of General Santos', 'd5dbb6fcbc0954b3f09d53f44d1cdc00', 'Hub', 0),
(243, 'Notre Dame-Siena College of Polomolok', '7498a143e76a9c9130b138ec5c2f267a', 'Hub', 0),
(244, 'Notre Dame-Siena College of Tacurong', '879d71ff73e353b62f3144e1e3c34ed0', 'Hub', 0),
(245, 'Notre Dame-Siena School of Marbel', '07d7b30afa8b0c5c33d7616122228a0f', 'Hub', 0),
(246, 'Del Pilar Academy', '8ad68672d711b1d962ff9bb6d357a9fe', 'Hub', 0),
(247, 'St. Agnes Academy (Grade School)', 'a32e41d93974bcfc564d0bc15b5478aa', 'Hub', 0),
(248, 'St. Agnes Academy (High School)', 'e8820e383676c131e7597083bba42858', 'Hub', 0),
(249, 'Holy Trinity University - Palawan', '88c741b67c0f13540e23108c9bf540eb', 'Hub', 0),
(250, 'Colegio San Agustin - Makati (Grade School)', 'd82349f1c5baecaf5754021a510f3862', 'NGS', 0),
(251, 'Dominican School - Manila', 'ec658f531b90df3f6c3569bb1b9465f8', 'NGS', 0),
(252, 'Don Bosco School', 'f48075c5a9260ee96153ae20efd4d616', 'NGS', 0),
(253, 'International Christian Academy', '483d70bb836f0b8d6445f378df9c1caa', 'NGS', 0),
(254, 'San Diego Parochial School', '498403d7bc4ac93c56926e6bc05a347e', 'NGS', 0),
(255, 'St. Mary\'s Academy - Guagua', '2fce246ad3bf25927927e73037d6635d', 'NGS', 0),
(256, 'St. Mary\'s Academy of Hagonoy', '6568164b56de99f58fc6d4e85e54498d', 'NGS', 0),
(257, 'St. Scholastica\'s College - Manila', '852fef0f9788e7fc4fe8ef7f4c609f09', 'NGS', 0),
(258, 'Mother of Divine Providence School', '57c279e2782cf591bd51945512924062', 'NGS', 0),
(259, 'Colegio dela Inmaculada Concepcion - Gorordo', 'f157e3f0dfe8d28b9a672bd844e3ceba', 'NGS', 0),
(260, 'Holy Spirit School of Tagbilaran', '61df95f4fe287ed29e941ca1b365fbc6', 'NGS', 0),
(261, 'Immaculate Heart of Mary Academy - Cebu', 'edf35707da54abae7fa1601d0f2172a7', 'NGS', 0),
(262, 'St. Catherine\'s College', '0c46498c5330427ec01473b02848bfec', 'NGS', 0),
(263, 'Victoriano D. Tirol (VDT) Advance Learning Center', 'd398d33ca388d61b092695a3702be63d', 'NGS', 0),
(264, 'Camella School - Las Pinas', '8441182b8bad5305b3b7e9cc63b1cfe1', 'NGS', 0),
(265, 'Infant Jesus Academy - Marikina', '3eda25127d23565bdb6f14aae87f0662', 'NGS', 0),
(266, 'Notre Dame of Greater Manila', 'efd1554771656faea4dc9076c0f5070c', 'NGS', 0),
(267, 'Sacred Heart Academy-Pasig', '047925ec5b16970c5fc8d77a7d0476e3', 'NGS', 0),
(268, 'St. Mary\'s Academy of Sto. Nino', '5f2ecb722bdea915ec8b1d0295d4aa49', 'NGS', 0),
(269, 'St. Theresa\'s College of Cebu (Grade School)', '8952ee1e846896ae394461a92b2c5d0b', 'NGS', 0),
(270, 'University of San Jose Recoletos - Basak', '0d3c749e81acb92ae33b8dc5badc3227', 'NGS', 0),
(271, 'St. James Academy - Malabon', '89875b4e2f23e3cb289d1ecee6216a31', 'NGS', 0),
(272, 'Philippine Christian Gospel School', '3f1683c2f63d076c7f03280c9c795b2f', 'NGS', 0),
(273, 'School of the Holy Spirit - Quezon City', 'e8b2ebb11c0ca764f29bbcf4908010ad', 'NGS', 0),
(274, 'St. Dominic Academy', 'c5c8cce595f314e6b86cfef38416202b', 'NGS', 0),
(275, 'University of Santo Tomas - Legazpi (High School)', 'd535e1bd74bc6ae68f914c39719b5562', 'NGS', 0),
(276, 'Christ the King College (Grade School)', '1c47b8fe09ad9ecf79d506698b2a913c', 'NGS', 0),
(277, 'Christ the King College (High School)', '8e7f216dd31fe0c1809cd91bc889c318', 'NGS', 0),
(278, 'Colegio San Agustin - Makati (High School)', 'ae82c4149ba91e98c5990b7f25f538c0', 'NGS', 0),
(279, 'College of the Holy Spirit-Tarlac (High School)', 'd17e9f7606ad62fe5d86f4a56656ab27', 'NGS', 0),
(280, 'Dominican College', '77081931589f751aab2b6c9b9f4b4c7b', 'NGS', 0),
(281, 'Holy Spirit Academy of Malolos (Grade School)', 'b7bf384ce91795f25e0a59070678c6f6', 'NGS', 0),
(282, 'Holy Spirit Academy of Malolos (High School)', '7ed81004e9e47883cbd23e5713dfee6f', 'NGS', 0),
(283, 'Saint Augustine\'s School', '655ad24acad0b7b69323e75aab2230cc', 'NGS', 0),
(284, 'Siena College', '329e901c21d958bf5e05dbb7f891392b', 'NGS', 0),
(285, 'St. Bridget College (High School)', '9ee540473ae1b20b7453dbc43701d171', 'NGS', 0),
(286, 'St. Joseph\'s College-Quezon City', '71cd85ca78d713edf5f264ab65d56231', 'NGS', 0),
(287, 'St. Louis School Center (Grade School)', '40a17f98fb14329fc80a05e34ba86f58', 'NGS', 0),
(288, 'St. Louis School Center (High School)', '6b2e4c646a057a716a1af9c1b2cb1e29', 'NGS', 0),
(289, 'St. Theresa\'s College (Grade School)', '0e75e1bdba11d52ecd78cfc923256dab', 'NGS', 0),
(290, 'St. Theresa\'s College (High School)', '1d98eb4683cf4e3152c67fe0ea9457d4', 'NGS', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `token` varchar(100) NOT NULL,
  `user_type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `token`, `user_type`) VALUES
(1, 'admin', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `questionnaires`
--
ALTER TABLE `questionnaires`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `question_type`
--
ALTER TABLE `question_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quest_dependency`
--
ALTER TABLE `quest_dependency`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mdl_quesdepe_que_ix` (`questionid`);

--
-- Indexes for table `quest_question`
--
ALTER TABLE `quest_question`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quest_question_choice`
--
ALTER TABLE `quest_question_choice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quest_response`
--
ALTER TABLE `quest_response`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quest_response_bool`
--
ALTER TABLE `quest_response_bool`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quest_response_multiple`
--
ALTER TABLE `quest_response_multiple`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quest_response_rank`
--
ALTER TABLE `quest_response_rank`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quest_response_single`
--
ALTER TABLE `quest_response_single`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quest_response_text`
--
ALTER TABLE `quest_response_text`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schools`
--
ALTER TABLE `schools`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `questionnaires`
--
ALTER TABLE `questionnaires`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `question_type`
--
ALTER TABLE `question_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `quest_dependency`
--
ALTER TABLE `quest_dependency`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `quest_question`
--
ALTER TABLE `quest_question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=162;

--
-- AUTO_INCREMENT for table `quest_question_choice`
--
ALTER TABLE `quest_question_choice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=902;

--
-- AUTO_INCREMENT for table `quest_response`
--
ALTER TABLE `quest_response`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quest_response_bool`
--
ALTER TABLE `quest_response_bool`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quest_response_multiple`
--
ALTER TABLE `quest_response_multiple`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quest_response_rank`
--
ALTER TABLE `quest_response_rank`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quest_response_single`
--
ALTER TABLE `quest_response_single`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quest_response_text`
--
ALTER TABLE `quest_response_text`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `schools`
--
ALTER TABLE `schools`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=291;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
