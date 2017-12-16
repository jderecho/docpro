-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 16, 2017 at 01:01 AM
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
(1, 11, 1, 0, 1, '2017-12-16 05:39:21', NULL, NULL),
(2, 24, 1, 0, 1, '2017-12-16 05:39:25', NULL, NULL),
(3, 24, 1, 0, 2, '2017-12-16 05:39:28', NULL, NULL),
(4, 11, 2, 0, 1, '2017-12-16 05:44:36', NULL, NULL),
(5, 24, 2, 0, 1, '2017-12-16 05:44:36', NULL, NULL),
(6, 23, 2, 0, 2, '2017-12-16 05:44:36', NULL, NULL),
(7, 11, 3, 0, 1, '2017-12-16 05:44:59', NULL, NULL),
(8, 24, 3, 0, 1, '2017-12-16 05:44:59', NULL, NULL),
(9, 23, 3, 0, 2, '2017-12-16 05:44:59', NULL, NULL),
(10, 11, 4, 0, 1, '2017-12-16 05:45:24', NULL, NULL),
(11, 24, 4, 0, 1, '2017-12-16 05:45:24', NULL, NULL),
(12, 23, 4, 0, 2, '2017-12-16 05:45:24', NULL, NULL),
(13, 62, 5, 0, 1, '2017-12-16 05:46:40', NULL, NULL),
(14, 999, 5, 0, 2, '2017-12-16 05:46:40', NULL, NULL),
(15, 62, 6, 0, 1, '2017-12-16 05:49:00', NULL, NULL),
(16, 999, 6, 0, 2, '2017-12-16 05:49:00', NULL, NULL),
(17, 62, 7, 0, 1, '2017-12-16 05:49:54', NULL, NULL),
(18, 999, 7, 0, 2, '2017-12-16 05:49:54', NULL, NULL),
(19, 62, 8, 0, 1, '2017-12-16 05:55:45', NULL, NULL),
(20, 6, 8, 0, 2, '2017-12-16 05:55:45', NULL, NULL),
(21, 62, 9, 0, 1, '2017-12-16 05:59:36', NULL, NULL),
(22, 999, 9, 0, 2, '2017-12-16 05:59:36', NULL, NULL),
(23, 62, 10, 0, 1, '2017-12-16 06:02:31', NULL, NULL),
(24, 999, 10, 0, 2, '2017-12-16 06:02:31', NULL, NULL),
(25, 62, 11, 0, 1, '2017-12-16 06:03:59', NULL, NULL),
(26, 999, 11, 0, 2, '2017-12-16 06:03:59', NULL, NULL),
(27, 62, 12, 0, 1, '2017-12-16 06:22:18', NULL, NULL),
(28, 999, 12, 0, 2, '2017-12-16 06:22:18', NULL, NULL),
(29, 11, 13, 0, 1, '2017-12-16 06:28:09', NULL, NULL),
(30, 24, 13, 0, 1, '2017-12-16 06:28:09', NULL, NULL),
(31, 23, 13, 0, 2, '2017-12-16 06:28:09', NULL, NULL),
(32, 1, 14, 0, 1, '2017-12-16 07:31:00', NULL, NULL),
(33, 1, 14, 0, 2, '2017-12-16 07:31:00', NULL, NULL),
(34, 2, 15, 0, 1, '2017-12-16 07:32:04', NULL, NULL),
(35, 5, 15, 0, 2, '2017-12-16 07:32:04', NULL, NULL),
(36, 1, 18, 0, 1, '2017-12-16 07:37:40', NULL, NULL),
(37, 6, 18, 0, 2, '2017-12-16 07:37:40', NULL, NULL),
(38, 2, 19, 0, 1, '2017-12-16 07:38:11', NULL, NULL),
(39, 4, 19, 0, 2, '2017-12-16 07:38:11', NULL, NULL),
(40, 3, 20, 0, 1, '2017-12-16 07:38:49', NULL, NULL),
(41, 2, 20, 0, 2, '2017-12-16 07:38:49', NULL, NULL),
(42, 2, 21, 0, 1, '2017-12-16 07:39:28', NULL, NULL),
(43, 2, 21, 0, 2, '2017-12-16 07:39:28', NULL, NULL),
(44, 2, 22, 0, 1, '2017-12-16 07:41:46', NULL, NULL),
(45, 4, 22, 0, 2, '2017-12-16 07:41:46', NULL, NULL),
(46, 2, 24, 0, 1, '2017-12-16 07:42:10', NULL, NULL);

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
(1, 'public/docs/user/62/aa11bfe96e88fce0e17957a2262cd5bd/test(1).docx', 6, 1, NULL, '2017-12-16 05:49:00', NULL),
(2, 'public/docs/user/62/e1d4c196670d6e42aad4db0aeea8423d/vs_community__109658990.1513019534.exe', 7, 1, NULL, '2017-12-16 05:49:54', NULL),
(3, 'public/docs/user/1/4442cfc4e738483368d1641a234ff7fe/CapacityModel_2.xlsx', 8, 1, NULL, '2017-12-16 05:55:45', NULL),
(4, 'public/docs/user/62/ee0031a2ef17d4fcd7b6a0c3e876385b/MWI_DAS_001_202.odt', 12, 1, NULL, '2017-12-16 06:22:19', NULL),
(5, 'public/docs/user/1000/e1038367ae969a2d10328ad862f6b9c7/MWI_DAS001_202.docx', 13, 1, NULL, '2017-12-16 06:28:09', NULL),
(6, 'public/docs/user/62/8ec67fff9fcd0c006fc41e46cf4c92e9/MWI_DAS001_202.docx', 14, 1, NULL, '2017-12-16 07:31:00', NULL),
(7, 'public/docs/user/62/3ce703d58b0c54366f80ad4455dcff4c/MWI_DAS001_202.docx', 15, 1, NULL, '2017-12-16 07:32:04', NULL),
(8, 'public/docs/user/62/bb19f3775ec7b21435274e1b2fad61aa/MWI_DAS001_202.docx', 16, 1, NULL, '2017-12-16 07:35:26', NULL),
(9, 'public/docs/user/62/185f0e0a7ad0530cf4046610d384db0e/MWI_DAS001_202.docx', 17, 1, NULL, '2017-12-16 07:36:33', NULL),
(10, 'public/docs/user/62/93ad8f9554be6dbd7272caa1b47d4b4b/MWI_DAS001_202.docx', 18, 1, NULL, '2017-12-16 07:37:40', NULL),
(11, 'public/docs/user/62/13779d771bd69cb119f8b5a1238956ea/MWI_DAS001_202.docx', 19, 1, NULL, '2017-12-16 07:38:11', NULL),
(12, 'public/docs/user/62/eff19e85da5d82300ed0c3c5f0af4597/MWI_DAS001_202.docx', 20, 1, NULL, '2017-12-16 07:38:49', NULL),
(13, 'public/docs/user/62/8877933a73330d9999967dd4c4af10fc/MWI_DAS001_202.docx', 21, 1, NULL, '2017-12-16 07:39:28', NULL),
(14, 'public/docs/user/62/c9ad92e042565a53f81b5a337c6d92b1/MWI_DAS001_202.docx', 22, 1, NULL, '2017-12-16 07:41:46', NULL),
(15, 'public/comment/user/62/bae756127896dd1f19cc51dca39bb57d/MWI_DAS_001_202.odt', 23, 1, 2, '2017-12-16 07:46:55', NULL),
(16, 'public/comment/user/62/bae756127896dd1f19cc51dca39bb57d/MWI_DAS_001_202.odt', 23, 1, 3, '2017-12-16 07:47:07', NULL),
(17, 'public/comment/user/62/bae756127896dd1f19cc51dca39bb57d/MWI_DAS_001_202.odt', 23, 1, 4, '2017-12-16 07:47:33', NULL),
(18, 'public/comment/user/62/bae756127896dd1f19cc51dca39bb57d/MWI_DAS_001_202.odt', 16, 1, 5, '2017-12-16 07:49:21', NULL),
(19, 'public/comment/user/62/bae756127896dd1f19cc51dca39bb57d/MWI_DAS_001_202.odt', 16, 1, 6, '2017-12-16 07:49:51', NULL);

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
(1, 1000, 13, 0, 'Sent the document for approval', '2017-12-15 22:28:22', '2017-12-15 22:28:22'),
(2, 62, 23, 0, 'leave a comment', '2017-12-15 23:46:51', '2017-12-15 23:46:51'),
(3, 62, 23, 0, 'test2', '2017-12-15 23:47:04', '2017-12-15 23:47:04'),
(4, 62, 23, 0, 'test3', '2017-12-15 23:47:29', '2017-12-15 23:47:29'),
(5, 62, 16, 0, 'sdfsdf\nsdfsdfsd\nf\nsdf\nsd\nfds\nfsd\nfds\nfd\nsf\nsd\nd\nf\nfd!@#$%^&*()_\nSDFGHJKL:', '2017-12-15 23:49:18', '2017-12-15 23:49:18'),
(6, 62, 16, 0, 'skjfshdkjfhsd\nsdfsdf\ndfsdfsdfs', '2017-12-15 23:49:47', '2017-12-15 23:49:47');

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
(16, 62, 'test4', '003', 0, '2017-12-16 07:35:26', NULL),
(17, 62, 'test5', '002', 0, '2017-12-16 07:36:33', NULL),
(18, 62, 'test123', '159', 0, '2017-12-16 07:37:40', NULL),
(19, 62, 'test123', '004', 0, '2017-12-16 07:38:11', NULL),
(20, 62, 'test123', '004', 0, '2017-12-16 07:38:49', NULL),
(21, 62, '!@#$%^&*()', '!@#$%^&*()', 0, '2017-12-16 07:39:28', NULL),
(22, 62, 'test123', '159', 0, '2017-12-16 07:41:46', NULL),
(23, 62, '123', '132', 0, '2017-12-16 07:41:58', NULL),
(24, 62, '789', '789', 0, '2017-12-16 07:42:10', NULL);

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
(18, 1, 6, NULL, NULL, NULL),
(19, 2, 6, NULL, NULL, NULL),
(20, 3, 6, NULL, NULL, NULL),
(21, 4, 6, NULL, NULL, NULL),
(22, 6, 3, NULL, NULL, NULL),
(23, 7, 1, NULL, NULL, NULL),
(24, 8, 20, NULL, NULL, NULL),
(25, 9, 1, NULL, NULL, NULL),
(26, 10, 21, NULL, NULL, NULL),
(27, 11, 1, NULL, NULL, NULL),
(28, 12, 1, NULL, NULL, NULL),
(29, 13, 6, NULL, NULL, NULL),
(30, 14, 1, NULL, NULL, NULL),
(31, 15, 2, NULL, NULL, NULL),
(32, 21, 3, NULL, NULL, NULL),
(33, 22, 5, NULL, NULL, NULL);

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
  `emp_password` varchar(200) DEFAULT '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6',
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
(1, 808, 'Ted', 'Bejoc', 'Saavedra', 'ted.saavedra@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, '1994-05-11', 14, 17, '2017-01-09 00:00:00', 1, 1, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '2TU5UPnaJjDZpWBO5CEBGhGmIbkP1EBC8R4xCLCG0RI9JubEBj2wAStUbFbb', '2017-12-13 22:46:32'),
(2, 872, 'Davinci', NULL, 'Solidarios', 'davinci.solidarios@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, '1990-01-01', 16, 9, '2017-01-09 00:00:00', 1, 1, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', 'M8YHaD00GuAUNYRLmCkECn6AByvrjzcespbSrHJRTSwTEEy9wzoYP4XX2Avx', NULL),
(3, 997, 'Retchel', NULL, 'Tapayan', 'retchel.tapayan@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, '1988-05-11', 1, 1, '2017-01-09 00:00:00', 2, 2, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', 'Q2wdnASn1U57OxrhGuFB3X7XIX3LmldcmRIr4RoYlX0R2fcWj4rDHnbSNn7q', NULL),
(4, 1038, 'Franz', NULL, 'Canares', 'franz.canares@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, '2017-09-14', 16, 4, '2017-02-27 00:00:00', 2, 2, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '9H0TFDOAtaukRywlg1q9OOGUzAw59J8NCb9hUwIYdFXciDeZkUpuGx491SQY', NULL),
(5, 801, 'Geoffrey', NULL, 'Honculada', 'geoffrey.honculada@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, '2017-09-01', 16, 9, '2017-01-09 00:00:00', 1, 1, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(6, 1021, 'Arturo', NULL, 'Solito', 'arturo.solito@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 16, 4, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', 'aszptxAC8EqkD4TCIDMi9sAbxZBk1O6uPcHTUDCEfKgsfofanHjPPFbhWWHy', NULL),
(7, 1419, 'Mars', NULL, 'Duterte', 'mars.duterte@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 16, 4, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', 'Wof9jIi3ejWRBGTGt2GxYWYQ25fgEGp9vHq7UUQ2IniYdHzhUp2ENG8AVHOW', NULL),
(8, 1376, 'Jozette', NULL, 'Cortes', 'jozette.cortes@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 16, 4, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', 'RxkFY4k3erfYQtImeo9VDF224m3gmHWHLKxw9y6sdMGsV50adBde14gkiv2X', NULL),
(9, 1070, 'Jude', NULL, 'Mag-asin', 'jude.magasin@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 16, 4, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(10, 864, 'Marjhann Kein', NULL, 'Pulvera', 'kein.pulvera@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 16, 4, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(11, 1008, 'Sarah', NULL, 'Macaspac', 'sarah.macaspac@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 6, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', 'NOtpdnfA8ln4c8fHLCJUVm8IcUsdZWKLXbcuUJSa8dEu9MBZj5WQAxQI2s17', NULL),
(12, 1498, 'Cenon', NULL, 'Lees', 'cenon.lee@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 6, 18, '0000-00-00 00:00:00', 1, 2, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(13, 1510, 'Nine', NULL, 'Miller', 'nine.miller@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 6, 18, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(14, 1493, 'Edzel', NULL, 'Rubite', 'edzel.rubite@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(15, 1673, 'Garry', NULL, 'Gacusan', 'garry.gacusan@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(16, 1684, 'Akash', NULL, 'Chowdhury', 'akash.chowdhury@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(17, 1235, 'Prince Ace', NULL, 'Miranda', 'prince.miranda@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(18, 1226, 'James Michael Brandon', NULL, 'Sy', 'james.sy@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(19, 642, 'Ramon', NULL, 'Ganjehi', 'ryam.ganjehi@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(20, 727, 'Rowena', NULL, 'Alix', 'rowena.alix@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(21, 726, 'Roberto', NULL, 'Roa', 'roberto.roa@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(22, 1696, 'Jitendra', NULL, 'Chettri', 'jitendra.chettri@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(23, 1446, 'Rupert', NULL, 'Santillan', 'rupert.santillan@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '3CAGckWEwNN4AP8P8VCbQxLRRx4Pb8DYTURiiBurwZcm1bI1JgzPdfTSkA8w', NULL),
(24, 1309, 'Jerome', NULL, 'Ochia', 'jerome.ochia@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(25, 1697, 'Aimee', NULL, 'Tuico', 'aimee.tuico@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(26, 991, 'Cherry', NULL, 'Obsequies', 'cherry.obsequies@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(27, 1559, 'Carlo', NULL, 'Aldemita', 'carlo.aldemita@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', 'RTWNQSD0UgP5ulVAt7cDbpFnQXmjDSe6O11OrJURAl12zBVCtCGLOcEJ6LYO', NULL),
(28, 1691, 'Scott', NULL, 'Sim', 'scott.sim@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(29, 725, 'Karen', NULL, 'Pinili', 'karen.pinili@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(30, 1677, 'Samuel David', NULL, 'Miranda', 'samuel.miranda@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(31, 734, 'Mia Carmel', NULL, 'Wong', 'm.wong@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', 'Rj1Lcowm78vt0IbLpmB41Nk3bdGsJZKpaFmkgGLtmLfYqg2R1rDt3ckXwcKc', NULL),
(32, 888, 'Jake', NULL, 'Relampagos', 'jake.relampagos@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(33, 1006, 'Jan', NULL, 'Croonen', 'jan.croonen@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(34, 1466, 'Honey Mae', NULL, 'Verallo', 'honey.verallo@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(35, 1322, 'Cherry Mae', NULL, 'Pelayo', 'cherry.pelayo@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(36, 1347, 'Brewster', NULL, 'Smith', 'brewster.smith@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(37, 1349, 'Aiko May', NULL, 'Suralta', 'aiko.suralta@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(38, 802, 'Julieto', NULL, 'Ansing', 'julieto.ansing@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(39, 965, 'Levin Venus', NULL, 'Bendijo', 'levin.bendijo@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(40, 993, 'Carmela', NULL, 'Carlobos', 'carmela.carlobos@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(41, 1128, 'Ryan', NULL, 'Calda', 'ryan.calda@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(42, 684, 'Raul', NULL, 'Cepeda', 'raul.cepeda@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(43, 1221, 'Ian', NULL, 'Fajardo', 'ian.fajardo@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(44, 753, 'Jomar', NULL, 'Escasinas', 'jomar.escasinas@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(45, 1126, 'Gil', NULL, 'Antecristo', 'gil.antecristo@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(46, 940, 'Janice', NULL, 'Masapequena', 'janice.masapequena@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(47, 798, 'Norlan', NULL, 'Balazo', 'norlan.balazo@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(48, 1291, 'Darryll', NULL, 'Rapacon', 'darryll.rapacon@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(49, 1069, 'Ariel', NULL, 'Colinares', 'ariel.colinares@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(50, 754, 'Jonathan', NULL, 'Docil', 'jonathan.docil@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(51, 862, 'Vanz', NULL, 'Mariano', 'vanz.mariano@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(52, 829, 'Bernardine', NULL, 'Ragas', 'bernardine.ragas@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(53, 961, 'Art', NULL, 'Sandalo', 'art.sandalo@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(54, 756, 'Edsel', NULL, 'Tampos', 'edsel.tampos@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(55, 803, 'Fritzie', NULL, 'Tongo', 'fritzie.tongo@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(56, 891, 'Tyron', NULL, 'Rodriguez', 'tyron.rodriguez@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(57, 807, 'Jhenise', NULL, 'Estellore', 'jhenise.estellore@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(58, 830, 'Jan', NULL, 'Prieto', 'jan.prieto@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(59, 868, 'Marvin', NULL, 'Tabacon', 'marvin.tabacon@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(60, 1401, 'Alice', NULL, 'Carrillo', 'alice.carrillo@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(61, 1505, 'Jays', NULL, 'Arthur', 'jay.arthur@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 6, 18, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(62, 1360, 'John Manuel', 'Sebusa', 'Derecho', 'john.derecho@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, '1995-12-06', 14, 17, '2017-04-17 00:00:00', 1, 5, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', 'VLQFnB4jFI8kKoLY8bFXWlksbs2Ac3IvhVRBOb3QWxFSRhexjEXouC9gvqid', '2017-12-13 22:44:08'),
(63, 780, 'Iryn Mae', '', 'Ocado', 'iryn.ocada@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, '1995-06-06', 4, 10, '2017-01-09 00:00:00', 2, 1, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', 'WTnD7D67VwaRgVdUwwlb7ZnX5hjjiXswmtjmHG9TLg6Vw7bUULUk0g63EAIi', NULL),
(999, 999, 'Document Management', NULL, 'System', 'docpro.system@gmail.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, '2017-12-06', 21, 17, '2017-12-06 00:00:00', 1, 5, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '8KXu7omu2P86cowqVxatcHYxQuiI5AdkLVEuUcza9hOgDniK3aXgIcs5tUPG', NULL),
(1000, 1495, 'Arlyn Joy', NULL, 'Acain', 'arlyn.acain@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 10, 1, '0000-00-00 00:00:00', 2, 1, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', 'PjnJGJZkpt6NIcGWwrLBawqOkRWUF8eT1DBlAbDXKOd5HBIPVaFeL0rgYSDo', NULL),
(1001, 0, 'Mel ', NULL, 'Vance', 'Melvin.Vance@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 1, 1, '0000-00-00 00:00:00', 1, 1, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', '', NULL),
(1002, 0, 'Jimmy', NULL, 'Wapille Jr.', 'jimmy.wapille@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 0, NULL, 0, 0, '0000-00-00 00:00:00', 0, 0, 'http://172.16.10.30/docpro/public/img/mopro_profile_1.png', 'Cze9qxGRRbVDznSCDYS8LzLzqcIhw7aililcLcvcpTX1JJbE3RiFoxsz6UAE', NULL);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `attachments`
--
ALTER TABLE `attachments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `document_departments`
--
ALTER TABLE `document_departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `employee_dept`
--
ALTER TABLE `employee_dept`
  MODIFY `dept_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `employee_details`
--
ALTER TABLE `employee_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1003;

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
