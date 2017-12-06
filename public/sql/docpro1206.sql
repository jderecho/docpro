-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 06, 2017 at 02:11 AM
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
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `approvers`
--

INSERT INTO `approvers` (`id`, `employee_details_id`, `document_ID`, `status`, `date_added`, `date_updated`) VALUES
(1, 1, 1, 1, '2017-12-01 07:12:45', NULL),
(2, 3, 1, 1, '2017-12-01 07:12:45', NULL),
(3, 6, 1, 1, '2017-12-01 07:12:45', NULL),
(4, 23, 1, 1, '2017-12-01 07:12:45', NULL),
(5, 27, 1, 1, '2017-12-01 07:12:45', NULL),
(6, 31, 1, 1, '2017-12-01 07:12:45', NULL),
(7, 1, 2, 0, '2017-12-05 03:06:48', NULL),
(8, 3, 2, 0, '2017-12-05 03:06:48', NULL),
(9, 4, 2, 0, '2017-12-05 03:06:48', NULL),
(10, 8, 2, 0, '2017-12-05 03:06:48', NULL),
(11, 1, 3, 0, '2017-12-05 04:00:42', NULL),
(12, 1, 4, 1, '2017-12-05 04:01:27', NULL),
(13, 4, 4, 1, '2017-12-05 04:01:27', NULL),
(14, 6, 4, 1, '2017-12-05 04:01:27', NULL),
(15, 8, 4, 1, '2017-12-05 04:01:27', NULL),
(16, 1, 5, 1, '2017-12-05 04:56:31', NULL),
(17, 23, 5, 1, '2017-12-05 04:56:31', NULL),
(18, 1, 6, 0, '2017-12-05 06:11:31', NULL),
(19, 2, 6, 0, '2017-12-05 06:11:31', NULL),
(20, 3, 6, 0, '2017-12-05 06:11:31', NULL),
(21, 5, 6, 0, '2017-12-05 06:11:31', NULL),
(22, 1, 7, 0, '2017-12-05 06:12:19', NULL),
(23, 2, 7, 0, '2017-12-05 06:12:19', NULL),
(24, 3, 7, 0, '2017-12-05 06:12:19', NULL),
(25, 5, 7, 0, '2017-12-05 06:12:19', NULL),
(26, 1, 8, 0, '2017-12-05 06:12:44', NULL),
(27, 2, 8, 0, '2017-12-05 06:12:44', NULL),
(28, 3, 8, 0, '2017-12-05 06:12:44', NULL),
(29, 5, 8, 0, '2017-12-05 06:12:44', NULL),
(30, 1, 9, 0, '2017-12-05 06:13:09', NULL),
(31, 2, 9, 0, '2017-12-05 06:13:09', NULL),
(32, 3, 9, 0, '2017-12-05 06:13:09', NULL),
(33, 5, 9, 0, '2017-12-05 06:13:09', NULL),
(34, 1, 10, 0, '2017-12-05 06:13:25', NULL),
(35, 2, 10, 0, '2017-12-05 06:13:25', NULL),
(36, 3, 10, 0, '2017-12-05 06:13:25', NULL),
(37, 5, 10, 0, '2017-12-05 06:13:25', NULL),
(38, 1, 11, 0, '2017-12-05 06:14:03', NULL),
(39, 2, 11, 0, '2017-12-05 06:14:03', NULL),
(40, 3, 11, 0, '2017-12-05 06:14:03', NULL),
(41, 5, 11, 0, '2017-12-05 06:14:03', NULL),
(42, 1, 12, 0, '2017-12-05 06:16:05', NULL),
(43, 2, 12, 0, '2017-12-05 06:16:05', NULL),
(44, 5, 12, 0, '2017-12-05 06:16:05', NULL),
(45, 1, 13, 0, '2017-12-05 06:16:32', NULL),
(46, 2, 13, 0, '2017-12-05 06:16:32', NULL),
(47, 5, 13, 0, '2017-12-05 06:16:32', NULL),
(48, 1, 14, 0, '2017-12-05 06:19:01', NULL),
(49, 2, 14, 0, '2017-12-05 06:19:01', NULL),
(50, 5, 14, 0, '2017-12-05 06:19:01', NULL),
(51, 1, 15, 0, '2017-12-05 06:20:09', NULL),
(52, 2, 15, 0, '2017-12-05 06:20:09', NULL),
(53, 5, 15, 0, '2017-12-05 06:20:09', NULL),
(54, 1, 16, 0, '2017-12-05 06:20:24', NULL),
(55, 1, 17, 0, '2017-12-05 06:20:47', NULL),
(56, 2, 17, 0, '2017-12-05 06:20:47', NULL),
(57, 1, 18, 0, '2017-12-05 06:26:21', NULL),
(58, 2, 18, 0, '2017-12-05 06:26:21', NULL),
(59, 2, 19, 1, '2017-12-05 06:56:27', NULL),
(60, 3, 19, 1, '2017-12-05 06:56:27', NULL),
(61, 0, 20, 0, '2017-12-06 07:00:40', NULL),
(62, 1, 21, 0, '2017-12-06 07:08:14', NULL),
(63, 2, 21, 0, '2017-12-06 07:08:14', NULL),
(64, 3, 21, 0, '2017-12-06 07:08:14', NULL),
(65, 4, 21, 0, '2017-12-06 07:08:14', NULL),
(66, 1, 22, 0, '2017-12-06 07:19:52', NULL),
(67, 0, 23, 0, '2017-12-06 07:21:20', NULL),
(68, 1, 24, 0, '2017-12-06 07:21:36', NULL),
(69, 1, 25, 0, '2017-12-06 07:22:05', NULL),
(70, 1, 26, 0, '2017-12-06 07:22:46', NULL),
(71, 3, 27, 0, '2017-12-06 07:23:58', NULL),
(72, 3, 28, 0, '2017-12-06 07:24:28', NULL),
(73, 3, 29, 0, '2017-12-06 07:24:52', NULL),
(74, 1, 30, 0, '2017-12-06 07:25:11', NULL),
(75, 1, 31, 0, '2017-12-06 07:25:15', NULL),
(76, 1, 32, 0, '2017-12-06 07:29:30', NULL),
(77, 62, 33, 0, '2017-12-06 07:32:44', NULL),
(78, 62, 34, 0, '2017-12-06 07:34:53', NULL),
(79, 62, 35, 0, '2017-12-06 07:35:01', NULL),
(80, 62, 36, 0, '2017-12-06 07:35:11', NULL),
(81, 2, 37, 0, '2017-12-06 07:36:27', NULL),
(82, 1, 38, 0, '2017-12-06 07:37:08', NULL),
(83, 62, 39, 0, '2017-12-06 07:39:53', NULL),
(84, 62, 40, 0, '2017-12-06 07:41:01', NULL),
(85, 62, 41, 0, '2017-12-06 07:43:54', NULL),
(86, 62, 42, 0, '2017-12-06 07:44:41', NULL),
(87, 62, 43, 0, '2017-12-06 07:45:23', NULL),
(88, 62, 44, 0, '2017-12-06 07:46:02', NULL),
(89, 62, 45, 0, '2017-12-06 07:46:39', NULL),
(90, 62, 46, 0, '2017-12-06 07:47:00', NULL),
(91, 62, 47, 0, '2017-12-06 07:47:06', NULL),
(92, 62, 48, 0, '2017-12-06 07:48:21', NULL),
(93, 62, 49, 0, '2017-12-06 07:48:31', NULL),
(94, 62, 50, 0, '2017-12-06 07:48:55', NULL),
(95, 62, 51, 0, '2017-12-06 07:49:06', NULL),
(96, 62, 52, 0, '2017-12-06 07:49:16', NULL),
(97, 62, 53, 0, '2017-12-06 07:51:52', NULL),
(98, 62, 54, 0, '2017-12-06 07:53:45', NULL),
(99, 62, 55, 0, '2017-12-06 07:54:19', NULL),
(100, 62, 56, 0, '2017-12-06 07:56:38', NULL),
(101, 62, 57, 0, '2017-12-06 07:56:51', NULL),
(102, 1, 58, 0, '2017-12-06 08:00:38', NULL),
(103, 62, 59, 0, '2017-12-06 08:06:38', NULL),
(104, 62, 60, 0, '2017-12-06 08:07:00', NULL),
(105, 62, 61, 0, '2017-12-06 08:08:24', NULL),
(106, 62, 62, 0, '2017-12-06 08:08:39', NULL),
(107, 62, 63, 1, '2017-12-06 08:34:03', NULL),
(108, 62, 64, 0, '2017-12-06 08:41:44', NULL);

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
(1, 'public/docs/user/62/a60a23b76adada2f0a122830af8a4510/Mark-C(1).docx', 1, 1, '2017-12-01 07:12:45', NULL),
(2, 'public/docs/user/1/d8bb51afcab7161c3cd31644cc6b3858/Post-LaunchQCProcessDocument_landscape%27.docx', 2, 1, '2017-12-05 03:06:48', NULL),
(3, 'public/docs/user/1/c681e24dbfa730c9c33e488db123d082/Mark-C.docx', 3, 1, '2017-12-05 04:00:43', NULL),
(4, 'public/docs/user/1/2d7a6e8f0f6d0bb034c0bd6ad5408b28/Mark-C.docx', 4, 1, '2017-12-05 04:01:27', NULL),
(5, 'public/docs/user/8/280d2fa0e850ff3e4fb09a6be75552ff/Mark-C.docx', 5, 1, '2017-12-05 04:56:31', NULL),
(6, 'public/docs/user/8/89cd181ac5dd7b46ea1e0253c1553b7f/email_template.php', 11, 1, '2017-12-05 06:14:03', NULL),
(7, 'public/docs/user/8/075fc35621a07bb4678778478a96bd79/email_template.php', 17, 1, '2017-12-05 06:20:47', NULL),
(8, 'public/docs/user/8/6ca8b17a1d594faf5902d0ce9a0fff19/email_template.php', 19, 1, '2017-12-05 06:56:27', NULL),
(9, 'public/docs/user/8/e656b12eb6d2fdbf164b2038b93779fa/mopro_profile.png', 22, 1, '2017-12-06 07:19:52', NULL),
(10, 'public/docs/user/8/f06b41d03e571946802164cf3e9139da/mopro_profile.png', 30, 1, '2017-12-06 07:25:15', NULL),
(11, 'public/docs/user/8/f06b41d03e571946802164cf3e9139da/mopro_profile.png', 31, 1, '2017-12-06 07:25:18', NULL),
(12, 'public/docs/user/8/e78fc652da1f84acf034d2e4026c44e9/newname.docx', 32, 1, '2017-12-06 07:29:34', NULL),
(13, 'public/docs/user/8/93667c3da249e0f97f11bacd3b3003d7/profile.jpg', 36, 1, '2017-12-06 07:35:15', NULL),
(14, 'public/docs/user/8/8bc187dce416e1d9b705c6de83f2ec02/profile.jpg', 37, 1, '2017-12-06 07:36:30', NULL),
(15, 'public/docs/user/8/dbf5cb8ddc77e936abbff8ffdd29b439/mopro_profile_1.png', 38, 1, '2017-12-06 07:37:11', NULL),
(16, 'public/docs/user/8/61e930b006f47f27c8dc9e69168c46d7/mopro_profile.png', 39, 1, '2017-12-06 07:39:56', NULL),
(17, 'public/docs/user/8/77ab69a26785420c94bac8daaffc2436/newname.jpg', 43, 1, '2017-12-06 07:45:26', NULL),
(18, 'public/docs/user/8/b0f482164ef9fd317f9d1db829a000ad/mopro_profile_1.png', 53, 1, '2017-12-06 07:51:56', NULL),
(19, 'public/docs/user/8/a2868fa271a676afeb82773784c688c3/mopro_profile.png', 57, 1, '2017-12-06 07:57:09', NULL),
(20, 'public/docs/user/8/c686f654fc60dd54e96adc025562f506/mopro_profile_1.png', 58, 1, '2017-12-06 08:00:38', NULL),
(21, 'public/docs/user/8/edb61501954d77fd13a87f2a917d4289/mopro_profile_1.png', 59, 1, '2017-12-06 08:06:38', NULL),
(22, 'public/docs/user/8/30b9878077817da55d96a1f1c2ff3ca1/mopro_profile_1.png', 60, 1, '2017-12-06 08:07:00', NULL),
(23, 'public/docs/user/8/5dc95ef9102b6f9c3ed4b84692339ca8/mopro_profile.png', 61, 1, '2017-12-06 08:08:24', NULL),
(24, 'public/docs/user/8/2c71006852a0c48288c9a7817a164dce/newname.jpg', 62, 1, '2017-12-06 08:08:42', NULL),
(25, 'public/docs/user/8/fe45eaed61a5797652111824334158c4/mopro_profile.png', 63, 1, '2017-12-06 08:34:03', NULL),
(26, 'public/docs/user/8/7e15f20b577409ecf2f7ebf4038cc969/mopro_profile_1.png', 64, 1, '2017-12-06 08:41:44', NULL);

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
(27, 8, 4, 0, 'Document is good', '2017-12-04 20:21:46', '2017-12-04 20:21:46'),
(28, 8, 4, 0, 'approved the document.', '2017-12-04 20:21:48', '2017-12-04 20:21:48'),
(29, 6, 4, 0, 'Document is also great', '2017-12-04 20:23:06', '2017-12-04 20:23:06'),
(30, 6, 4, 0, 'approved the document.', '2017-12-04 20:23:10', '2017-12-04 20:23:10'),
(31, 4, 4, 0, 'Document is (y)', '2017-12-04 20:24:02', '2017-12-04 20:24:02'),
(32, 4, 4, 0, 'approved the document.', '2017-12-04 20:24:04', '2017-12-04 20:24:04'),
(33, 1, 4, 0, 'good', '2017-12-04 20:24:27', '2017-12-04 20:24:27'),
(34, 1, 4, 0, 'approved the document.', '2017-12-04 20:25:38', '2017-12-04 20:25:38'),
(35, 1, 4, 0, 'All Approvers approved the documents', '2017-12-04 20:25:39', '2017-12-04 20:25:39'),
(36, 1, 4, 0, 'Document is ready!', '2017-12-04 20:25:50', '2017-12-04 20:25:50'),
(37, 8, 5, 0, 'Sent the document for approval', '2017-12-04 20:56:43', '2017-12-04 20:56:43'),
(38, 1, 5, 0, 'hi', '2017-12-04 20:59:11', '2017-12-04 20:59:11'),
(39, 1, 5, 0, 'approved the document.', '2017-12-04 21:07:30', '2017-12-04 21:07:30'),
(40, 23, 5, 0, 'approved the document.', '2017-12-04 21:09:05', '2017-12-04 21:09:05'),
(41, 23, 5, 0, 'All Approvers approved the documents', '2017-12-04 21:09:06', '2017-12-04 21:09:06'),
(42, 23, 5, 0, 'Document is ready!', '2017-12-04 21:09:21', '2017-12-04 21:09:21'),
(43, 8, 19, 0, 'Sent the document for approval', '2017-12-05 16:17:00', '2017-12-05 16:17:00'),
(44, 2, 19, 0, 'disapproved the document.', '2017-12-05 16:55:48', '2017-12-05 16:55:48'),
(45, 3, 19, 0, 'approved the document.', '2017-12-05 17:02:27', '2017-12-05 17:02:27'),
(46, 2, 19, 0, 'disapproved the document.', '2017-12-05 17:24:32', '2017-12-05 17:24:32'),
(47, 8, 19, 0, 'resent the document for approval.', '2017-12-05 17:25:01', '2017-12-05 17:25:01'),
(48, 2, 19, 0, 'approved the document.', '2017-12-05 17:26:49', '2017-12-05 17:26:49'),
(49, 0, 19, 0, 'All Approvers approved the documents', '2017-12-05 17:26:49', '2017-12-05 17:26:49'),
(50, 23, 19, 0, 'Document is ready!', '2017-12-05 17:38:13', '2017-12-05 17:38:13'),
(51, 8, 4, 0, 'please change churba', '2017-12-05 18:51:13', '2017-12-05 18:51:13'),
(52, 8, 18, 0, 'Sent the document for approval', '2017-12-05 22:59:25', '2017-12-05 22:59:25'),
(53, 8, 22, 0, 'Sent the document for approval', '2017-12-05 23:20:10', '2017-12-05 23:20:10'),
(54, 8, 60, 0, 'Sent the document for approval', '2017-12-06 00:07:09', '2017-12-06 00:07:09'),
(55, 8, 61, 0, 'Sent the document for approval', '2017-12-06 00:09:09', '2017-12-06 00:09:09'),
(56, 8, 63, 0, 'Sent the document for approval', '2017-12-06 00:34:14', '2017-12-06 00:34:14'),
(57, 62, 63, 0, 'approved the document.', '2017-12-06 00:34:46', '2017-12-06 00:34:46'),
(58, 62, 63, 0, 'approved the document.', '2017-12-06 00:35:25', '2017-12-06 00:35:25'),
(59, 62, 63, 0, 'approved the document.', '2017-12-06 00:36:50', '2017-12-06 00:36:50'),
(60, 0, 63, 0, 'All Approvers approved the document', '2017-12-06 00:36:57', '2017-12-06 00:36:57'),
(61, 8, 64, 0, 'Sent the document for approval', '2017-12-06 00:41:59', '2017-12-06 00:41:59');

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
(1, 62, 'Document Process Approval', 'Version 1.0.0', 3, '2017-12-01 07:12:45', NULL),
(2, 1, 'CX Process Update', 'Revision 1', 1, '2017-12-05 03:06:47', NULL),
(64, 8, 'Document Process Update', '1.0.1', 1, '2017-12-06 08:41:44', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `document_departments`
--

CREATE TABLE `document_departments` (
  `id` int(11) NOT NULL,
  `document_id` int(11) NOT NULL,
  `dept_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `document_departments`
--

INSERT INTO `document_departments` (`id`, `document_id`, `dept_id`, `created_at`, `updated_at`) VALUES
(1, 11, 1, '2017-12-04 22:14:03', '2017-12-04 22:14:03'),
(2, 11, 2, '2017-12-04 22:14:03', '2017-12-04 22:14:03'),
(3, 11, 3, '2017-12-04 22:14:03', '2017-12-04 22:14:03'),
(4, 11, 5, '2017-12-04 22:14:03', '2017-12-04 22:14:03'),
(5, 13, 1, NULL, NULL),
(6, 13, 2, NULL, NULL),
(7, 13, 3, NULL, NULL),
(8, 13, 5, NULL, NULL),
(9, 14, 1, NULL, NULL),
(10, 14, 2, NULL, NULL),
(11, 14, 3, NULL, NULL),
(12, 14, 5, NULL, NULL),
(13, 15, 1, NULL, NULL),
(14, 15, 2, NULL, NULL),
(15, 15, 3, NULL, NULL),
(16, 15, 5, NULL, NULL),
(17, 16, 1, NULL, NULL),
(18, 16, 2, NULL, NULL),
(19, 16, 3, NULL, NULL),
(20, 16, 5, NULL, NULL),
(21, 17, 1, NULL, NULL),
(22, 17, 2, NULL, NULL),
(23, 18, 1, NULL, NULL),
(24, 18, 4, NULL, NULL),
(25, 18, 5, NULL, NULL),
(26, 19, 16, NULL, NULL),
(27, 21, 3, NULL, NULL),
(28, 21, 16, NULL, NULL),
(29, 22, 3, NULL, NULL),
(30, 30, 1, NULL, NULL),
(31, 31, 1, NULL, NULL),
(32, 32, 3, NULL, NULL),
(33, 36, 2, NULL, NULL),
(34, 37, 3, NULL, NULL),
(35, 38, 2, NULL, NULL),
(36, 39, 2, NULL, NULL),
(37, 43, 2, NULL, NULL),
(38, 53, 2, NULL, NULL),
(39, 57, 2, NULL, NULL),
(40, 58, 2, NULL, NULL),
(41, 60, 2, NULL, NULL),
(42, 61, 2, NULL, NULL),
(43, 62, 3, NULL, NULL),
(44, 63, 1, NULL, NULL),
(45, 64, 2, NULL, NULL);

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
(0, 0, 'Document Management', NULL, 'System', 'docpro.admin@gmail.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, '2017-12-06', 21, 17, '2017-12-06 00:00:00', 1, 5, ''),
(1, 808, 'Ted', 'Bejoc', 'Saavedra', 'ted.saavedra@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, '1994-05-11', 14, 17, '2017-01-09 00:00:00', 1, 1, 'XC7e2bfPdY9A5itM7uXIMbKyHFF3Fx3Nrlnpbgg0FSy1Ja28d68VFGPD4t9c'),
(2, 872, 'Davinci', NULL, 'Solidarios', 'davinci.solidarios@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, '1990-01-01', 16, 9, '2017-01-09 00:00:00', 1, 1, 'M8YHaD00GuAUNYRLmCkECn6AByvrjzcespbSrHJRTSwTEEy9wzoYP4XX2Avx'),
(3, 997, 'Retchel', NULL, 'Tapayan', 'retchel.tapayan@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, '1988-05-11', 1, 1, '2017-01-09 00:00:00', 2, 2, 'Q2wdnASn1U57OxrhGuFB3X7XIX3LmldcmRIr4RoYlX0R2fcWj4rDHnbSNn7q'),
(4, 1038, 'Franz', NULL, 'Canares', 'franz.canares@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, '2017-09-14', 16, 4, '2017-02-27 00:00:00', 2, 2, '9H0TFDOAtaukRywlg1q9OOGUzAw59J8NCb9hUwIYdFXciDeZkUpuGx491SQY'),
(5, 801, 'Geoffrey', NULL, 'Honculada', 'geoffrey.honculada@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, '2017-09-01', 16, 9, '2017-01-09 00:00:00', 1, 1, ''),
(6, 1021, 'Arturo', NULL, 'Solito', 'arturo.solito@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 16, 4, '0000-00-00 00:00:00', 0, 0, 'aszptxAC8EqkD4TCIDMi9sAbxZBk1O6uPcHTUDCEfKgsfofanHjPPFbhWWHy'),
(7, 1419, 'Mars', NULL, 'Duterte', 'mars.duterte@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 16, 4, '0000-00-00 00:00:00', 0, 0, 'Wof9jIi3ejWRBGTGt2GxYWYQ25fgEGp9vHq7UUQ2IniYdHzhUp2ENG8AVHOW'),
(8, 1376, 'Jozette', NULL, 'Cortes', 'jozette.cortes@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 16, 4, '0000-00-00 00:00:00', 0, 0, 'y7vBuFBaOjYKrV7Jy6ZIOMSmk7V09KpcIti7NgCj3gKm6X6CoAK2qZU4C9th'),
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
(23, 1446, 'Rupert', NULL, 'Santillan', 'rupert.santillan@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, '5a6auMCX9ostX3I156wVoYmyGv9EnuUPYyqN8nYtdM2fnu0z6cRd8m7q1FKA'),
(24, 1309, 'Jerome', NULL, 'Ochia', 'jerome.ochia@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, ''),
(25, 1697, 'Aimee', NULL, 'Tuico', 'aimee.tuico@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, ''),
(26, 991, 'Cherry', NULL, 'Obsequies', 'cherry.obsequies@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, ''),
(27, 1559, 'Carlo', NULL, 'Aldemita', 'carlo.aldemita@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'RTWNQSD0UgP5ulVAt7cDbpFnQXmjDSe6O11OrJURAl12zBVCtCGLOcEJ6LYO'),
(28, 1691, 'Scott', NULL, 'Sim', 'scott.sim@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, ''),
(29, 725, 'Karen', NULL, 'Pinili', 'karen.pinili@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, ''),
(30, 1677, 'Samuel David', NULL, 'Miranda', 'samuel.miranda@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, ''),
(31, 734, 'Mia Carmel', NULL, 'Wong', 'm.wong@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'Rj1Lcowm78vt0IbLpmB41Nk3bdGsJZKpaFmkgGLtmLfYqg2R1rDt3ckXwcKc'),
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
(62, 1360, 'John Manuel', 'Sebusa', 'Derecho', 'john.derecho@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, '1995-12-06', 14, 17, '2017-04-17 00:00:00', 1, 5, 'aeEi1gJWYMXp855iTJlEy7scvq0nMEGtFApgw3huKQ8lYihIe813aEbaqsUD');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `attachments`
--
ALTER TABLE `attachments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `document_departments`
--
ALTER TABLE `document_departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

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
