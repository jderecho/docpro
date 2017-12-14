-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 15, 2017 at 12:44 AM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `docpro`
--

-- --------------------------------------------------------

--
-- Table structure for table `approvers`
--

CREATE TABLE `approvers` (
  `id` int(11) NOT NULL,
  `employee_details_id` int(11) NOT NULL,
  `document_ID` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `approvers`
--

INSERT INTO `approvers` (`id`, `employee_details_id`, `document_ID`, `status`, `type`, `created_at`, `updated_at`, `deleted_at`) VALUES
(34, 62, 14, 1, 1, '2017-12-15 04:32:40', NULL, NULL),
(35, 999, 14, 1, 2, '2017-12-15 04:32:40', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `attachments`
--

CREATE TABLE `attachments` (
  `id` int(11) NOT NULL,
  `file_location` varchar(100) DEFAULT NULL,
  `document_ID` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `comment_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attachments`
--

INSERT INTO `attachments` (`id`, `file_location`, `document_ID`, `status`, `comment_id`, `created_at`, `updated_at`) VALUES
(1, 'public/docs/user/63/1f7a0c2100cbea185a5f1421654a5abd/test(1).docx', 1, 1, NULL, '2017-12-13 04:10:25', NULL),
(2, 'public/docs/user/63/38c1f3f36eeca704c0b2ef005617c4fc/test(1).docx', 2, 1, NULL, '2017-12-13 04:45:27', NULL),
(3, 'public/comment/user/62/991afe144520cfd5f91f64a421cfe0a6/test(1).docx', 2, 1, 2, '2017-12-13 04:52:17', NULL),
(4, 'public/comment/user/62/991afe144520cfd5f91f64a421cfe0a6/test(1).docx', 2, 1, 2, '2017-12-13 04:52:17', NULL),
(5, 'public/docs/user/62/223578d10c08cd09757c7eb400164e9c/docpro123.sql', 7, 1, NULL, '2017-12-15 03:25:39', NULL),
(6, 'public/docs/user/62/8879ea060b55e0abe8625a102cf3461d/docpro123.sql', 8, 1, NULL, '2017-12-15 03:26:27', NULL),
(7, 'public/docs/user/62/12f1b13d7c23b64d64d93fe383d28b48/docpro123.sql', 9, 1, NULL, '2017-12-15 03:28:10', NULL),
(8, 'public/docs/user/62/0f951c88cb002259351b068d0b5870fa/test(1).docx', 10, 1, NULL, '2017-12-15 03:38:41', NULL),
(9, 'public/docs/user/62/b0b509d6c7bfa2343d936f85c05f42ea/test(1).docx', 11, 1, NULL, '2017-12-15 03:47:02', NULL),
(10, 'public/docs/user/62/d29aedfb956011c1b2c1a50cc12ff9cc/test(1).docx', 12, 1, NULL, '2017-12-15 03:48:01', NULL),
(11, 'public/docs/user/62/62d09e6843a8c979a8c3a6cec61163f6/test(1).docx', 13, 1, NULL, '2017-12-15 04:26:34', NULL),
(12, 'public/docs/user/62/41fffb53dc3cb11ceb6d819b261b3f72/test(1).docx', 14, 1, NULL, '2017-12-15 04:32:40', NULL),
(13, 'public/comment/user/62/9687ea01c443ea212f11eb7d55385d56/test(1).docx', 14, 1, 3, '2017-12-15 05:32:00', NULL),
(14, 'public/comment/user/62/9687ea01c443ea212f11eb7d55385d56/vs_community__109658990.1513019534.exe', 14, 1, 3, '2017-12-15 05:32:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `employee_details_id` int(11) NOT NULL,
  `document_ID` int(11) NOT NULL,
  `attachment_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `employee_details_id`, `document_ID`, `attachment_id`, `message`, `created_at`, `updated_at`) VALUES
(1, 62, 14, 0, 'approved the document.', '2017-12-14 21:27:50', '2017-12-14 21:27:50'),
(2, 62, 14, 0, 'approved the document.', '2017-12-14 21:30:46', '2017-12-14 21:30:46'),
(3, 62, 14, 0, 'TEST', '2017-12-14 21:31:57', '2017-12-14 21:31:57'),
(4, 62, 14, 0, 'approved the document.', '2017-12-14 21:33:33', '2017-12-14 21:33:33'),
(5, 62, 14, 0, 'disapproved the document.', '2017-12-14 21:37:21', '2017-12-14 21:37:21'),
(6, 62, 14, 0, 'disapproved the document.', '2017-12-14 21:37:45', '2017-12-14 21:37:45'),
(7, 62, 14, 0, 'disapproved the document.', '2017-12-14 21:38:10', '2017-12-14 21:38:10'),
(8, 62, 14, 0, 'disapproved the document.', '2017-12-14 21:38:41', '2017-12-14 21:38:41'),
(9, 62, 14, 0, 'disapproved the document.', '2017-12-14 21:42:06', '2017-12-14 21:42:06'),
(10, 62, 14, 0, 'approved the document.', '2017-12-14 21:51:45', '2017-12-14 21:51:45'),
(11, 999, 14, 0, 'All Approvers approved the document', '2017-12-14 21:51:49', '2017-12-14 21:51:49'),
(12, 999, 14, 0, 'approved the document.', '2017-12-14 22:09:31', '2017-12-14 22:09:31'),
(13, 999, 14, 0, 'All Approvers approved the document', '2017-12-14 22:09:34', '2017-12-14 22:09:34'),
(14, 62, 14, 0, 'Document is ready!', '2017-12-14 22:10:29', '2017-12-14 22:10:29'),
(15, 62, 14, 0, 'Document is ready!', '2017-12-14 22:15:08', '2017-12-14 22:15:08'),
(16, 999, 14, 0, 'approved the document.', '2017-12-14 22:43:08', '2017-12-14 22:43:08'),
(17, 999, 14, 0, 'All Reviewers approved the document', '2017-12-14 22:43:12', '2017-12-14 22:43:12'),
(18, 999, 14, 0, 'approved the document.', '2017-12-14 22:57:20', '2017-12-14 22:57:20'),
(19, 999, 14, 0, 'All Approvers approved the document', '2017-12-14 22:57:23', '2017-12-14 22:57:23'),
(20, 62, 14, 0, 'Document is ready!', '2017-12-14 23:00:05', '2017-12-14 23:00:05'),
(21, 62, 14, 0, 'test', '2017-12-14 23:24:58', '2017-12-14 23:24:58'),
(22, 62, 14, 0, 'teadw', '2017-12-14 23:25:37', '2017-12-14 23:25:37'),
(23, 62, 14, 0, 'test', '2017-12-14 23:25:52', '2017-12-14 23:25:52'),
(24, 62, 14, 0, 'testaw', '2017-12-14 23:28:03', '2017-12-14 23:28:03'),
(25, 62, 14, 0, 'ewww', '2017-12-14 23:28:10', '2017-12-14 23:28:10');

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id` int(11) NOT NULL,
  `employee_details_id` int(11) NOT NULL,
  `document_name` varchar(100) NOT NULL,
  `revision_number` varchar(20) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_approved` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`id`, `employee_details_id`, `document_name`, `revision_number`, `status`, `date_created`, `date_approved`) VALUES
(14, 62, 'awd', 'awd', 3, '2017-12-15 04:32:40', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `document_departments`
--

CREATE TABLE `document_departments` (
  `id` int(11) NOT NULL,
  `document_id` int(11) NOT NULL,
  `dept_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `document_departments`
--

INSERT INTO `document_departments` (`id`, `document_id`, `dept_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 21, NULL, NULL, NULL),
(2, 2, 4, NULL, NULL, NULL),
(3, 5, 1, NULL, NULL, NULL),
(4, 6, 1, NULL, NULL, NULL),
(5, 7, 1, NULL, NULL, NULL),
(6, 8, 1, NULL, NULL, NULL),
(7, 9, 1, NULL, NULL, NULL),
(8, 10, 1, NULL, NULL, NULL),
(9, 11, 1, NULL, NULL, NULL),
(10, 12, 2, NULL, NULL, NULL),
(11, 13, 22, NULL, NULL, NULL),
(12, 14, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employee_dept`
--

CREATE TABLE `employee_dept` (
  `dept_ID` int(11) NOT NULL,
  `dept_name` varchar(50) DEFAULT NULL,
  `dept_description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee_dept`
--

INSERT INTO `employee_dept` (`dept_ID`, `dept_name`, `dept_description`) VALUES
(1, 'managers', 'Managers'),
(2, 'hr', 'Human Resource'),
(3, 'tdev', 'Talent Development'),
(4, 'cx', 'Client Experience'),
(5, 'social_media', 'Social Media'),
(6, 'sales', 'Sales'),
(9, 'quality_control', 'Quality Control Specialist'),
(13, 'dr', 'Digital Receptionist'),
(14, 'das', 'Digital Account Specialist'),
(16, 'builder', 'Builders'),
(17, 'design_team', 'Design Team'),
(18, 'cebu_creative', 'Cebu Creative'),
(20, 'opex', 'Operational Excellence'),
(21, 'site_wide', 'Site Wide'),
(22, 'dcs', 'Direct Connect Specialist');

-- --------------------------------------------------------

--
-- Table structure for table `employee_details`
--

CREATE TABLE `employee_details` (
  `id` int(11) NOT NULL,
  `emp_ID` int(11) NOT NULL,
  `emp_firstname` varchar(50) DEFAULT NULL,
  `emp_middlename` varchar(50) DEFAULT NULL,
  `emp_lastname` varchar(50) DEFAULT NULL,
  `emp_email` varchar(50) DEFAULT NULL,
  `emp_password` varchar(200) DEFAULT NULL,
  `emp_status` int(11) NOT NULL,
  `emp_birthdate` date DEFAULT NULL,
  `emp_dept_ID` int(11) NOT NULL,
  `emp_position_ID` int(11) NOT NULL,
  `emp_date_hired` datetime NOT NULL,
  `emp_gender` int(11) NOT NULL,
  `emp_wave_no` int(11) NOT NULL,
  `profile_url` varchar(300) NOT NULL DEFAULT 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png',
  `remember_token` varchar(200) NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee_details`
--

INSERT INTO `employee_details` (`id`, `emp_ID`, `emp_firstname`, `emp_middlename`, `emp_lastname`, `emp_email`, `emp_password`, `emp_status`, `emp_birthdate`, `emp_dept_ID`, `emp_position_ID`, `emp_date_hired`, `emp_gender`, `emp_wave_no`, `profile_url`, `remember_token`, `updated_at`) VALUES
(1, 808, 'Ted', 'Bejoc', 'Saavedra', 'ted.saavedra@mopro.com', '$2y$10$ikWcItqFifnucfsdxbCOg.FhmrFaLrxF3uuDv/xTw2vqhVDIt9UnG', 1, '1994-05-11', 14, 17, '2017-01-09 00:00:00', 1, 1, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', 'NWjaakQU5zvQCsK2sQPlmy8Q8IDKjGQ8slr9YOJIXOojwHHysGgyMoStXtez', '2017-12-13 22:46:32'),
(2, 872, 'Davinci', NULL, 'Solidarios', 'davinci.solidarios@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, '1990-01-01', 16, 9, '2017-01-09 00:00:00', 1, 1, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', 'M8YHaD00GuAUNYRLmCkECn6AByvrjzcespbSrHJRTSwTEEy9wzoYP4XX2Avx', NULL),
(3, 997, 'Retchel', NULL, 'Tapayan', 'retchel.tapayan@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, '1988-05-11', 1, 1, '2017-01-09 00:00:00', 2, 2, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', 'Q2wdnASn1U57OxrhGuFB3X7XIX3LmldcmRIr4RoYlX0R2fcWj4rDHnbSNn7q', NULL),
(4, 1038, 'Franz', NULL, 'Canares', 'franz.canares@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, '2017-09-14', 16, 4, '2017-02-27 00:00:00', 2, 2, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '9H0TFDOAtaukRywlg1q9OOGUzAw59J8NCb9hUwIYdFXciDeZkUpuGx491SQY', NULL),
(5, 801, 'Geoffrey', NULL, 'Honculada', 'geoffrey.honculada@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, '2017-09-01', 16, 9, '2017-01-09 00:00:00', 1, 1, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(6, 1021, 'Arturo', NULL, 'Solito', 'arturo.solito@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 16, 4, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', 'aszptxAC8EqkD4TCIDMi9sAbxZBk1O6uPcHTUDCEfKgsfofanHjPPFbhWWHy', NULL),
(7, 1419, 'Mars', NULL, 'Duterte', 'mars.duterte@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 16, 4, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', 'Wof9jIi3ejWRBGTGt2GxYWYQ25fgEGp9vHq7UUQ2IniYdHzhUp2ENG8AVHOW', NULL),
(8, 1376, 'Jozette', NULL, 'Cortes', 'jozette.cortes@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 16, 4, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '1XIit5llEVJDyvaBxNGMvvuWjSeX9ZJ3FCZGOU2sFv62k7NtvAasJsnai6FF', NULL),
(9, 1070, 'Jude', NULL, 'Mag-asin', 'jude.magasin@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 16, 4, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(10, 864, 'Marjhann Kein', NULL, 'Pulvera', 'kein.pulvera@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 16, 4, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(11, 1008, 'Sarah', NULL, 'Macaspac', 'sarah.macaspac@mopro.com', '1234', 1, NULL, 6, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(12, 1498, 'Cenon', NULL, 'Lees', 'cenon.lee@mopro.com', '1234', 1, NULL, 6, 18, '0000-00-00 00:00:00', 1, 2, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(13, 1510, 'Nine', NULL, 'Miller', 'nine.miller@mopro.com', '1234', 1, NULL, 6, 18, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(14, 1493, 'Edzel', NULL, 'Rubite', 'edzel.rubite@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(15, 1673, 'Garry', NULL, 'Gacusan', 'garry.gacusan@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(16, 1684, 'Akash', NULL, 'Chowdhury', 'akash.chowdhury@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(17, 1235, 'Prince Ace', NULL, 'Miranda', 'prince.miranda@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(18, 1226, 'James Michael Brandon', NULL, 'Sy', 'james.sy@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(19, 642, 'Ramon', NULL, 'Ganjehi', 'ryam.ganjehi@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(20, 727, 'Rowena', NULL, 'Alix', 'rowena.alix@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(21, 726, 'Roberto', NULL, 'Roa', 'roberto.roa@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(22, 1696, 'Jitendra', NULL, 'Chettri', 'jitendra.chettri@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(23, 1446, 'Rupert', NULL, 'Santillan', 'rupert.santillan@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', 'f2658JacfHdeBQ677uYSJ89JqH1C4uIo2UnyhsZ71S8npICchbKV3RKKXryr', NULL),
(24, 1309, 'Jerome', NULL, 'Ochia', 'jerome.ochia@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(25, 1697, 'Aimee', NULL, 'Tuico', 'aimee.tuico@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(26, 991, 'Cherry', NULL, 'Obsequies', 'cherry.obsequies@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(27, 1559, 'Carlo', NULL, 'Aldemita', 'carlo.aldemita@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', 'RTWNQSD0UgP5ulVAt7cDbpFnQXmjDSe6O11OrJURAl12zBVCtCGLOcEJ6LYO', NULL),
(28, 1691, 'Scott', NULL, 'Sim', 'scott.sim@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(29, 725, 'Karen', NULL, 'Pinili', 'karen.pinili@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(30, 1677, 'Samuel David', NULL, 'Miranda', 'samuel.miranda@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(31, 734, 'Mia Carmel', NULL, 'Wong', 'm.wong@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', 'Rj1Lcowm78vt0IbLpmB41Nk3bdGsJZKpaFmkgGLtmLfYqg2R1rDt3ckXwcKc', NULL),
(32, 888, 'Jake', NULL, 'Relampagos', 'jake.relampagos@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(33, 1006, 'Jan', NULL, 'Croonen', 'jan.croonen@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(34, 1466, 'Honey Mae', NULL, 'Verallo', 'honey.verallo@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(35, 1322, 'Cherry Mae', NULL, 'Pelayo', 'cherry.pelayo@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(36, 1347, 'Brewster', NULL, 'Smith', 'brewster.smith@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(37, 1349, 'Aiko May', NULL, 'Suralta', 'aiko.suralta@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(38, 802, 'Julieto', NULL, 'Ansing', 'julieto.ansing@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(39, 965, 'Levin Venus', NULL, 'Bendijo', 'levin.bendijo@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(40, 993, 'Carmela', NULL, 'Carlobos', 'carmela.carlobos@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(41, 1128, 'Ryan', NULL, 'Calda', 'ryan.calda@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(42, 684, 'Raul', NULL, 'Cepeda', 'raul.cepeda@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(43, 1221, 'Ian', NULL, 'Fajardo', 'ian.fajardo@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(44, 753, 'Jomar', NULL, 'Escasinas', 'jomar.escasinas@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(45, 1126, 'Gil', NULL, 'Antecristo', 'gil.antecristo@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(46, 940, 'Janice', NULL, 'Masapequena', 'janice.masapequena@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(47, 798, 'Norlan', NULL, 'Balazo', 'norlan.balazo@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(48, 1291, 'Darryll', NULL, 'Rapacon', 'darryll.rapacon@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(49, 1069, 'Ariel', NULL, 'Colinares', 'ariel.colinares@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(50, 754, 'Jonathan', NULL, 'Docil', 'jonathan.docil@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(51, 862, 'Vanz', NULL, 'Mariano', 'vanz.mariano@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(52, 829, 'Bernardine', NULL, 'Ragas', 'bernardine.ragas@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(53, 961, 'Art', NULL, 'Sandalo', 'art.sandalo@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(54, 756, 'Edsel', NULL, 'Tampos', 'edsel.tampos@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(55, 803, 'Fritzie', NULL, 'Tongo', 'fritzie.tongo@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(56, 891, 'Tyron', NULL, 'Rodriguez', 'tyron.rodriguez@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(57, 807, 'Jhenise', NULL, 'Estellore', 'jhenise.estellore@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(58, 830, 'Jan', NULL, 'Prieto', 'jan.prieto@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(59, 868, 'Marvin', NULL, 'Tabacon', 'marvin.tabacon@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(60, 1401, 'Alice', NULL, 'Carrillo', 'alice.carrillo@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(61, 1505, 'Jays', NULL, 'Arthur', 'jay.arthur@mopro.com', '1234', 1, NULL, 6, 18, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(62, 1360, 'John Manuel', 'Sebusa', 'Derecho', 'john.derecho@mopro.com', '$2y$10$..0V/vGGeCtmu5RZZ.nXp.kliDU2.QDYy1CNfTwMXyLLZBdzMQyVm', 1, '1995-12-06', 14, 17, '2017-04-17 00:00:00', 1, 5, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', 'Hv85cyY4c7EnTJVObJIJgF3NJmjHtnsaa49tEPx2pAEOegbX5sl4A0vUoMLE', '2017-12-13 22:44:08'),
(63, 780, 'Iryn Mae', '', 'Ocado', 'iryn.ocada@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, '1995-06-06', 4, 10, '2017-01-09 00:00:00', 2, 1, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', 'EUkgBqD0PKvs4qftPqiNrf0ixhoowEfXz4xBS9tX0RJiWMGBL0BeNP08CfK7', NULL),
(64, 9999, 'Temporary', NULL, 'User 1', 'jmanuel.derecho@gmail.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 1, 1, '2017-12-05 00:00:00', 1, 5, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(999, 999, 'Document Management', NULL, 'System', 'docpro.system@gmail.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, '2017-12-06', 21, 17, '2017-12-06 00:00:00', 1, 5, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', 'HI9lgRJukX4KEZ2LSKjqtdUFaSWhhIA2Jk27rReM6PekxhGFLjQq3bHHJXPd', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employee_positions`
--

CREATE TABLE `employee_positions` (
  `position_ID` int(11) NOT NULL,
  `position_name` varchar(255) DEFAULT NULL,
  `position_description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee_positions`
--

INSERT INTO `employee_positions` (`position_ID`, `position_name`, `position_description`) VALUES
(1, 'manager', 'Manager'),
(2, 'hr', 'HR'),
(3, 'opl', 'OPL'),
(4, 'builder', 'Builder'),
(5, 'dmc', 'DMC'),
(6, 'dc', 'DC'),
(7, 'ds', 'DS'),
(8, 'qc', 'QC'),
(9, 'senior', 'Senior'),
(10, 'cx', 'Client Experience'),
(11, 'tdev', 'Talent Development'),
(12, 'social_media', 'Social Media'),
(13, 'video_editor', 'Video Editor'),
(14, 'design_team', 'Design Team'),
(15, 'cebu_creative', 'Cebu Creative'),
(16, 'das', 'Dedicated Account Specialist'),
(17, 'opex', 'Operational Excellence'),
(18, 'sales', 'DSC'),
(19, 'dcs', 'DCS');

-- --------------------------------------------------------

--
-- Table structure for table `employee_positions_history`
--

CREATE TABLE `employee_positions_history` (
  `history_ID` int(11) NOT NULL,
  `history_name` varchar(255) DEFAULT NULL,
  `history_description` varchar(255) DEFAULT NULL,
  `history_position` varchar(50) DEFAULT NULL,
  `history_date_assigned` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employee_schedule`
--

CREATE TABLE `employee_schedule` (
  `sched_ID` int(11) NOT NULL,
  `sched_emp_ID` int(11) NOT NULL,
  `sched_type` int(11) NOT NULL,
  `sched_time` datetime NOT NULL,
  `sched_date_assigned` datetime NOT NULL,
  `sched_encharge` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee_schedule`
--

INSERT INTO `employee_schedule` (`sched_ID`, `sched_emp_ID`, `sched_type`, `sched_time`, `sched_date_assigned`, `sched_encharge`) VALUES
(1, 808, 2, '2017-06-26 00:00:00', '2017-06-26 00:00:00', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `approvers`
--
ALTER TABLE `approvers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attachments`
--
ALTER TABLE `attachments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attachment_id` (`attachment_id`),
  ADD KEY `employee_details_id` (`employee_details_id`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `creator_emp_ID` (`employee_details_id`);

--
-- Indexes for table `document_departments`
--
ALTER TABLE `document_departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_dept`
--
ALTER TABLE `employee_dept`
  ADD PRIMARY KEY (`dept_ID`);

--
-- Indexes for table `employee_details`
--
ALTER TABLE `employee_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `emp_ID` (`emp_ID`);

--
-- Indexes for table `employee_positions`
--
ALTER TABLE `employee_positions`
  ADD PRIMARY KEY (`position_ID`);

--
-- Indexes for table `employee_positions_history`
--
ALTER TABLE `employee_positions_history`
  ADD PRIMARY KEY (`history_ID`);

--
-- Indexes for table `employee_schedule`
--
ALTER TABLE `employee_schedule`
  ADD PRIMARY KEY (`sched_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `approvers`
--
ALTER TABLE `approvers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `attachments`
--
ALTER TABLE `attachments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `document_departments`
--
ALTER TABLE `document_departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `employee_dept`
--
ALTER TABLE `employee_dept`
  MODIFY `dept_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `employee_details`
--
ALTER TABLE `employee_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- AUTO_INCREMENT for table `employee_positions`
--
ALTER TABLE `employee_positions`
  MODIFY `position_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `employee_positions_history`
--
ALTER TABLE `employee_positions_history`
  MODIFY `history_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_schedule`
--
ALTER TABLE `employee_schedule`
  MODIFY `sched_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
