-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 30, 2017 at 04:53 PM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.0.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mopro-dokman`
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
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `approvers`
--

INSERT INTO `approvers` (`id`, `employee_details_id`, `document_ID`, `status`, `date_added`, `date_updated`) VALUES
(51, 2, 22, 0, '2017-11-29 01:27:24', NULL),
(52, 3, 22, 0, '2017-11-29 01:27:24', NULL),
(53, 4, 22, 0, '2017-11-29 01:27:24', NULL),
(54, 5, 22, 0, '2017-11-29 01:27:24', NULL),
(55, 2, 23, 0, '2017-11-29 01:28:44', NULL),
(56, 2, 24, 0, '2017-11-29 01:29:04', NULL),
(57, 2, 25, 0, '2017-11-29 01:29:26', NULL),
(58, 2, 26, 0, '2017-11-29 01:29:40', NULL),
(59, 2, 27, 0, '2017-11-29 01:29:55', NULL),
(60, 2, 28, 0, '2017-11-29 01:30:13', NULL),
(61, 2, 29, 0, '2017-11-29 01:30:29', NULL),
(62, 2, 30, 0, '2017-11-29 01:30:57', NULL),
(63, 2, 31, 0, '2017-11-29 01:31:09', NULL),
(64, 2, 32, 0, '2017-11-29 01:31:40', NULL),
(65, 2, 33, 0, '2017-11-29 01:31:52', NULL),
(66, 2, 34, 0, '2017-11-29 01:32:03', NULL),
(67, 1, 35, 0, '2017-11-29 01:33:28', NULL),
(68, 2, 35, 0, '2017-11-29 01:33:28', NULL),
(69, 3, 35, 0, '2017-11-29 01:33:28', NULL),
(70, 1, 36, 0, '2017-11-29 01:34:23', NULL),
(71, 2, 36, 0, '2017-11-29 01:34:23', NULL),
(72, 3, 36, 0, '2017-11-29 01:34:23', NULL),
(73, 1, 37, 0, '2017-11-29 01:34:40', NULL),
(74, 2, 37, 0, '2017-11-29 01:34:40', NULL),
(75, 3, 37, 0, '2017-11-29 01:34:40', NULL),
(76, 1, 38, 0, '2017-11-29 01:56:47', NULL),
(77, 2, 38, 0, '2017-11-29 01:56:47', NULL),
(78, 1, 39, 0, '2017-11-29 05:22:37', NULL),
(79, 1, 40, 0, '2017-11-29 05:27:29', NULL),
(80, 2, 40, 0, '2017-11-29 05:27:29', NULL),
(81, 3, 40, 0, '2017-11-29 05:27:29', NULL),
(82, 4, 40, 0, '2017-11-29 05:27:29', NULL),
(83, 5, 40, 0, '2017-11-29 05:27:29', NULL),
(84, 6, 40, 0, '2017-11-29 05:27:29', NULL),
(85, 1, 41, 0, '2017-11-29 05:28:25', NULL),
(86, 2, 41, 0, '2017-11-29 05:28:25', NULL),
(87, 3, 41, 0, '2017-11-29 05:28:25', NULL),
(88, 1, 45, 0, '2017-11-30 00:43:17', NULL),
(89, 2, 45, 0, '2017-11-30 00:43:17', NULL),
(90, 3, 45, 0, '2017-11-30 00:43:17', NULL),
(91, 1, 46, 0, '2017-11-30 00:46:58', NULL),
(92, 2, 46, 0, '2017-11-30 00:46:58', NULL),
(93, 3, 46, 0, '2017-11-30 00:46:58', NULL),
(94, 1, 47, 0, '2017-11-30 00:48:02', NULL),
(95, 2, 47, 0, '2017-11-30 00:48:02', NULL),
(96, 3, 47, 0, '2017-11-30 00:48:02', NULL),
(97, 1, 51, 0, '2017-11-30 00:55:50', NULL),
(98, 6, 51, 0, '2017-11-30 00:55:50', NULL),
(99, 62, 51, 0, '2017-11-30 00:55:50', NULL),
(100, 1, 52, 0, '2017-11-30 01:29:56', NULL),
(101, 2, 52, 0, '2017-11-30 01:29:56', NULL),
(102, 4, 52, 0, '2017-11-30 01:29:56', NULL),
(103, 1, 53, 0, '2017-11-30 01:42:34', NULL),
(104, 2, 53, 0, '2017-11-30 01:42:34', NULL),
(105, 3, 53, 0, '2017-11-30 01:42:34', NULL),
(106, 1, 54, 0, '2017-11-30 01:53:07', NULL),
(107, 2, 54, 0, '2017-11-30 01:53:07', NULL),
(108, 3, 54, 0, '2017-11-30 01:53:07', NULL),
(109, 1, 55, 0, '2017-11-30 02:00:41', NULL),
(110, 2, 55, 0, '2017-11-30 02:00:41', NULL),
(111, 3, 55, 0, '2017-11-30 02:00:41', NULL),
(112, 1, 56, 0, '2017-11-30 02:26:42', NULL),
(113, 1, 57, 0, '2017-11-30 03:20:32', NULL),
(114, 1, 58, 0, '2017-11-30 04:47:24', NULL),
(115, 1, 59, 0, '2017-11-30 05:28:03', NULL),
(116, 57, 60, 0, '2017-11-30 06:40:00', NULL),
(117, 1, 61, 0, '2017-11-30 07:07:49', NULL),
(118, 2, 61, 0, '2017-11-30 07:07:50', NULL),
(119, 3, 61, 0, '2017-11-30 07:07:50', NULL),
(120, 7, 62, 0, '2017-11-30 23:47:06', NULL),
(121, 8, 62, 0, '2017-11-30 23:47:06', NULL),
(122, 9, 62, 0, '2017-11-30 23:47:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `attachments`
--

CREATE TABLE `attachments` (
  `id` int(11) NOT NULL,
  `file_location` varchar(100) DEFAULT NULL,
  `document_ID` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `date_uploaded` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attachments`
--

INSERT INTO `attachments` (`id`, `file_location`, `document_ID`, `status`, `date_uploaded`, `date_updated`) VALUES
(5, 'public/docs/user/62/89e13eb839d21e1cf9c211513dd15059/document_1.pdf', 51, 1, '2017-11-30 00:55:50', NULL),
(6, 'public/docs/user/62/4ba5b7d89eba7523ad682df979efc946/document_1.pdf', 52, 1, '2017-11-30 01:29:56', NULL),
(7, 'public/docs/user/62/4ba5b7d89eba7523ad682df979efc946/document_2.jpg', 52, 1, '2017-11-30 01:29:56', NULL),
(8, 'public/docs/user/62/4ba5b7d89eba7523ad682df979efc946/document_3.jpg', 52, 1, '2017-11-30 01:29:56', NULL),
(9, 'public/docs/user/62/4ba5b7d89eba7523ad682df979efc946/document_4.doc', 52, 1, '2017-11-30 01:29:57', NULL),
(10, 'public/docs/user/62/66206cf1e5b82ffcf540a3e7bdc86b6b/Post-LaunchQCProcessDocument_landscape%27.docx', 54, 1, '2017-11-30 01:53:07', NULL),
(11, 'public/docs/user/62/e7deab88db5cd18fc254d0bef8355ece/Post-LaunchQCProcessDocument_landscape%27.docx', 55, 1, '2017-11-30 02:00:41', NULL),
(12, 'public/docs/user/62/a0ef6491a511a198c22336d7b3def17a/Post-LaunchQCProcessDocument_landscape%27.docx', 56, 1, '2017-11-30 02:26:42', NULL),
(13, 'public/docs/user/1/18cfd3d97005daeabfbb6bcb0301429c/CODEOFDISCIPLINEMoproFinal2017.pdf', 57, 1, '2017-11-30 03:20:32', NULL),
(14, 'public/docs/user/1/3f2aaa3cb73e2b24ddd5d720442e6000/robots.txt', 58, 1, '2017-11-30 04:47:24', NULL),
(15, 'public/docs/user/1/3f2aaa3cb73e2b24ddd5d720442e6000/index.php', 58, 1, '2017-11-30 04:47:24', NULL),
(16, 'public/docs/user/1/3f2aaa3cb73e2b24ddd5d720442e6000/favicon.ico', 58, 1, '2017-11-30 04:47:24', NULL),
(17, 'public/docs/user/1/3f2aaa3cb73e2b24ddd5d720442e6000/.old_htaccess', 58, 1, '2017-11-30 04:47:25', NULL),
(18, 'public/docs/user/1/81b4aeab15c20177c61cc2ee48138339/Mark-C.docx', 59, 1, '2017-11-30 05:28:03', NULL),
(19, 'public/docs/user/1/aba021cb2e384be633ad51a06393e4cc/Mark-C.docx', 60, 1, '2017-11-30 06:40:00', NULL),
(20, 'public/docs/user/2/71f1081b7f24c454d6a3d54cb897652b/word.jpg', 61, 1, '2017-11-30 07:07:50', NULL),
(21, 'public/docs/user/1/c6d66c2aee5a8262f165d39771c19c50/Mark-C(1).docx', 62, 1, '2017-11-30 23:47:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `emp_ID` int(11) NOT NULL,
  `document_ID` int(11) NOT NULL,
  `message` text NOT NULL,
  `date_created` date NOT NULL,
  `date_updated` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(59, 1, 'Draft 1', '1', 0, '2017-11-30 05:28:03', NULL),
(62, 1, 'Draft 2', 'revision 1.0', 0, '2017-11-30 23:47:06', NULL);

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
  `remember_token` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee_details`
--

INSERT INTO `employee_details` (`id`, `emp_ID`, `emp_firstname`, `emp_middlename`, `emp_lastname`, `emp_email`, `emp_password`, `emp_status`, `emp_birthdate`, `emp_dept_ID`, `emp_position_ID`, `emp_date_hired`, `emp_gender`, `emp_wave_no`, `remember_token`) VALUES
(1, 808, 'Ted', 'Bejoc', 'Saavedra', 'ted.saavedra@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, '1994-05-11', 14, 17, '2017-01-09 00:00:00', 1, 1, 'uNVWdRUvWGnfvVmoPQQUkHy9xVvzT43J78YmpxnTwS42CAMNB8fb2SMRrWKl'),
(2, 872, 'Davinci', NULL, 'Solidarios', 'davinci.solidarios@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, '1990-01-01', 16, 9, '2017-01-09 00:00:00', 1, 1, 'cKlr4WKK3yVDvTiIcc4vEA4Z4Mo1fZwZB3VO3EScokAoiU30mWdYHTRCkCdl'),
(3, 997, 'Retchel', NULL, 'Tapayan', 'retchel.tapayan@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, '1988-05-11', 1, 1, '2017-01-09 00:00:00', 2, 2, '9kleP4uAbfzCe8p7zz7TuyYwFmppb4SZr8FzMUhzu5N6PMq5LZgqNEBSQcI6'),
(4, 1038, 'Franz', NULL, 'Canares', 'franz.canares@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, '2017-09-14', 16, 4, '2017-02-27 00:00:00', 2, 2, ''),
(5, 801, 'Geoffrey', NULL, 'Honculada', 'geoffrey.honculada@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, '2017-09-01', 16, 9, '2017-01-09 00:00:00', 1, 1, ''),
(6, 1021, 'Arturo', NULL, 'Solito', 'arturo.solito@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 16, 4, '0000-00-00 00:00:00', 0, 0, ''),
(7, 1419, 'Mars', NULL, 'Duterte', 'mars.duterte@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 16, 4, '0000-00-00 00:00:00', 0, 0, 'ddmPkV2zNyNQGoX5ajfRGKW4G1w2AbS9jfTg3j63wYvJsoz48cnt49RKzgP9'),
(8, 1376, 'Jozette', NULL, 'Cortes', 'jozette.cortes@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 16, 4, '0000-00-00 00:00:00', 0, 0, 'rNXSEn2EwBKo90ahUpmwXT7K3o3UiZ6VT37iOTIYQ0mEAB0ZSKpG02azvNLy'),
(9, 1070, 'Jude', NULL, 'Mag-asin', 'jude.magasin@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 16, 4, '0000-00-00 00:00:00', 0, 0, ''),
(10, 864, 'Marjhann Kein', NULL, 'Pulvera', 'kein.pulvera@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 16, 4, '0000-00-00 00:00:00', 0, 0, ''),
(11, 1008, 'Sarah', NULL, 'Macaspac', 'sarah.macaspac@mopro.com', '1234', 1, NULL, 6, 1, '0000-00-00 00:00:00', 0, 0, ''),
(12, 1498, 'Cenon', NULL, 'Lees', 'cenon.lee@mopro.com', '1234', 1, NULL, 6, 18, '0000-00-00 00:00:00', 1, 2, ''),
(13, 1510, 'Nine', NULL, 'Miller', 'nine.miller@mopro.com', '1234', 1, NULL, 6, 18, '0000-00-00 00:00:00', 0, 0, ''),
(14, 1493, 'Edzel', NULL, 'Rubite', 'edzel.rubite@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, ''),
(15, 1673, 'Garry', NULL, 'Gacusan', 'garry.gacusan@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, ''),
(16, 1684, 'Akash', NULL, 'Chowdhury', 'akash.chowdhury@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, ''),
(17, 1235, 'Prince Ace', NULL, 'Miranda', 'prince.miranda@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, ''),
(18, 1226, 'James Michael Brandon', NULL, 'Sy', 'james.sy@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, ''),
(19, 642, 'Ramon', NULL, 'Ganjehi', 'ryam.ganjehi@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, ''),
(20, 727, 'Rowena', NULL, 'Alix', 'rowena.alix@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, ''),
(21, 726, 'Roberto', NULL, 'Roa', 'roberto.roa@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, ''),
(22, 1696, 'Jitendra', NULL, 'Chettri', 'jitendra.chettri@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, ''),
(23, 1446, 'Rupert', NULL, 'Santillan', 'rupert.santillan@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, ''),
(24, 1309, 'Jerome', NULL, 'Ochia', 'jerome.ochia@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, ''),
(25, 1697, 'Aimee', NULL, 'Tuico', 'aimee.tuico@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, ''),
(26, 991, 'Cherry', NULL, 'Obsequies', 'cherry.obsequies@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, ''),
(27, 1559, 'Carlo', NULL, 'Aldemita', 'carlo.aldemita@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, ''),
(28, 1691, 'Scott', NULL, 'Sim', 'scott.sim@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, ''),
(29, 725, 'Karen', NULL, 'Pinili', 'karen.pinili@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, ''),
(30, 1677, 'Samuel David', NULL, 'Miranda', 'samuel.miranda@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, ''),
(31, 734, 'Mia Carmel', NULL, 'Wong', 'm.wong@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, ''),
(32, 888, 'Jake', NULL, 'Relampagos', 'jake.relampagos@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, ''),
(33, 1006, 'Jan', NULL, 'Croonen', 'jan.croonen@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, ''),
(34, 1466, 'Honey Mae', NULL, 'Verallo', 'honey.verallo@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, ''),
(35, 1322, 'Cherry Mae', NULL, 'Pelayo', 'cherry.pelayo@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, ''),
(36, 1347, 'Brewster', NULL, 'Smith', 'brewster.smith@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, ''),
(37, 1349, 'Aiko May', NULL, 'Suralta', 'aiko.suralta@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, ''),
(38, 802, 'Julieto', NULL, 'Ansing', 'julieto.ansing@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, ''),
(39, 965, 'Levin Venus', NULL, 'Bendijo', 'levin.bendijo@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, ''),
(40, 993, 'Carmela', NULL, 'Carlobos', 'carmela.carlobos@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, ''),
(41, 1128, 'Ryan', NULL, 'Calda', 'ryan.calda@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, ''),
(42, 684, 'Raul', NULL, 'Cepeda', 'raul.cepeda@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, ''),
(43, 1221, 'Ian', NULL, 'Fajardo', 'ian.fajardo@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, ''),
(44, 753, 'Jomar', NULL, 'Escasinas', 'jomar.escasinas@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, ''),
(45, 1126, 'Gil', NULL, 'Antecristo', 'gil.antecristo@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, ''),
(46, 940, 'Janice', NULL, 'Masapequena', 'janice.masapequena@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, ''),
(47, 798, 'Norlan', NULL, 'Balazo', 'norlan.balazo@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, ''),
(48, 1291, 'Darryll', NULL, 'Rapacon', 'darryll.rapacon@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, ''),
(49, 1069, 'Ariel', NULL, 'Colinares', 'ariel.colinares@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, ''),
(50, 754, 'Jonathan', NULL, 'Docil', 'jonathan.docil@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, ''),
(51, 862, 'Vanz', NULL, 'Mariano', 'vanz.mariano@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, ''),
(52, 829, 'Bernardine', NULL, 'Ragas', 'bernardine.ragas@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, ''),
(53, 961, 'Art', NULL, 'Sandalo', 'art.sandalo@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, ''),
(54, 756, 'Edsel', NULL, 'Tampos', 'edsel.tampos@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, ''),
(55, 803, 'Fritzie', NULL, 'Tongo', 'fritzie.tongo@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, ''),
(56, 891, 'Tyron', NULL, 'Rodriguez', 'tyron.rodriguez@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, ''),
(57, 807, 'Jhenise', NULL, 'Estellore', 'jhenise.estellore@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, ''),
(58, 830, 'Jan', NULL, 'Prieto', 'jan.prieto@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, ''),
(59, 868, 'Marvin', NULL, 'Tabacon', 'marvin.tabacon@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, ''),
(60, 1401, 'Alice', NULL, 'Carrillo', 'alice.carrillo@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, ''),
(61, 1505, 'Jays', NULL, 'Arthur', 'jay.arthur@mopro.com', '1234', 1, NULL, 6, 18, '0000-00-00 00:00:00', 0, 0, ''),
(62, 1360, 'John Manuel', 'Sebusa', 'Derecho', 'john.derecho@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, '1995-12-06', 14, 17, '2017-04-17 00:00:00', 1, 5, 'fVGTdl4bCe9SsUoIjohWXUeI33rhS4Arnm9cB9nP43oCMJGpwNjLtyCRZuEs');

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
  ADD PRIMARY KEY (`emp_ID`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `creator_emp_ID` (`employee_details_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- AUTO_INCREMENT for table `attachments`
--
ALTER TABLE `attachments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `emp_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `employee_dept`
--
ALTER TABLE `employee_dept`
  MODIFY `dept_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `employee_details`
--
ALTER TABLE `employee_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

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
