-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 14, 2017 at 12:27 AM
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
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `approvers`
--

INSERT INTO `approvers` (`id`, `employee_details_id`, `document_ID`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 62, 1, 0, '2017-12-13 04:10:24', NULL, NULL),
(2, 64, 1, 0, '2017-12-13 04:10:24', NULL, NULL),
(3, 999, 1, 0, '2017-12-13 04:10:24', NULL, NULL),
(4, 23, 2, 1, '2017-12-13 04:45:27', NULL, NULL),
(5, 62, 2, 1, '2017-12-13 04:45:27', NULL, '2017-12-12 20:58:09'),
(6, 32, 2, 0, '2017-12-13 04:55:51', NULL, '2017-12-12 20:58:19');

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
(4, 'public/comment/user/62/991afe144520cfd5f91f64a421cfe0a6/test(1).docx', 2, 1, 2, '2017-12-13 04:52:17', NULL);

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
(1, 63, 2, 0, 'Sent the document for approval', '2017-12-12 20:46:14', '2017-12-12 20:46:14'),
(2, 62, 2, 0, 'new revision', '2017-12-12 20:52:14', '2017-12-12 20:52:14'),
(3, 62, 2, 0, 'approved the document.', '2017-12-12 20:52:31', '2017-12-12 20:52:31'),
(4, 23, 2, 0, 'approved', '2017-12-12 20:53:39', '2017-12-12 20:53:39'),
(5, 23, 2, 0, 'approved the document.', '2017-12-12 20:54:23', '2017-12-12 20:54:23'),
(6, 999, 2, 0, 'All Approvers approved the document', '2017-12-12 20:54:26', '2017-12-12 20:54:26'),
(7, 23, 2, 0, 'Document is ready!', '2017-12-12 20:56:11', '2017-12-12 20:56:11');

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
(2, 63, 'test', 'test', 3, '2017-12-13 04:45:27', NULL);

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
(2, 2, 4, NULL, NULL, NULL);

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
  `remember_token` varchar(200) NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee_details`
--

INSERT INTO `employee_details` (`id`, `emp_ID`, `emp_firstname`, `emp_middlename`, `emp_lastname`, `emp_email`, `emp_password`, `emp_status`, `emp_birthdate`, `emp_dept_ID`, `emp_position_ID`, `emp_date_hired`, `emp_gender`, `emp_wave_no`, `remember_token`, `updated_at`) VALUES
(1, 808, 'Ted', 'Bejoc', 'Saavedra', 'ted.saavedra@mopro.com', '$2y$10$ikWcItqFifnucfsdxbCOg.FhmrFaLrxF3uuDv/xTw2vqhVDIt9UnG', 1, '1994-05-11', 14, 17, '2017-01-09 00:00:00', 1, 1, 'NWjaakQU5zvQCsK2sQPlmy8Q8IDKjGQ8slr9YOJIXOojwHHysGgyMoStXtez', '2017-12-13 22:46:32'),
(2, 872, 'Davinci', NULL, 'Solidarios', 'davinci.solidarios@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, '1990-01-01', 16, 9, '2017-01-09 00:00:00', 1, 1, 'M8YHaD00GuAUNYRLmCkECn6AByvrjzcespbSrHJRTSwTEEy9wzoYP4XX2Avx', NULL),
(3, 997, 'Retchel', NULL, 'Tapayan', 'retchel.tapayan@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, '1988-05-11', 1, 1, '2017-01-09 00:00:00', 2, 2, 'Q2wdnASn1U57OxrhGuFB3X7XIX3LmldcmRIr4RoYlX0R2fcWj4rDHnbSNn7q', NULL),
(4, 1038, 'Franz', NULL, 'Canares', 'franz.canares@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, '2017-09-14', 16, 4, '2017-02-27 00:00:00', 2, 2, '9H0TFDOAtaukRywlg1q9OOGUzAw59J8NCb9hUwIYdFXciDeZkUpuGx491SQY', NULL),
(5, 801, 'Geoffrey', NULL, 'Honculada', 'geoffrey.honculada@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, '2017-09-01', 16, 9, '2017-01-09 00:00:00', 1, 1, '', NULL),
(6, 1021, 'Arturo', NULL, 'Solito', 'arturo.solito@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 16, 4, '0000-00-00 00:00:00', 0, 0, 'aszptxAC8EqkD4TCIDMi9sAbxZBk1O6uPcHTUDCEfKgsfofanHjPPFbhWWHy', NULL),
(7, 1419, 'Mars', NULL, 'Duterte', 'mars.duterte@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 16, 4, '0000-00-00 00:00:00', 0, 0, 'Wof9jIi3ejWRBGTGt2GxYWYQ25fgEGp9vHq7UUQ2IniYdHzhUp2ENG8AVHOW', NULL),
(8, 1376, 'Jozette', NULL, 'Cortes', 'jozette.cortes@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 16, 4, '0000-00-00 00:00:00', 0, 0, '1XIit5llEVJDyvaBxNGMvvuWjSeX9ZJ3FCZGOU2sFv62k7NtvAasJsnai6FF', NULL),
(9, 1070, 'Jude', NULL, 'Mag-asin', 'jude.magasin@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 16, 4, '0000-00-00 00:00:00', 0, 0, '', NULL),
(10, 864, 'Marjhann Kein', NULL, 'Pulvera', 'kein.pulvera@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 16, 4, '0000-00-00 00:00:00', 0, 0, '', NULL),
(11, 1008, 'Sarah', NULL, 'Macaspac', 'sarah.macaspac@mopro.com', '1234', 1, NULL, 6, 1, '0000-00-00 00:00:00', 0, 0, '', NULL),
(12, 1498, 'Cenon', NULL, 'Lees', 'cenon.lee@mopro.com', '1234', 1, NULL, 6, 18, '0000-00-00 00:00:00', 1, 2, '', NULL),
(13, 1510, 'Nine', NULL, 'Miller', 'nine.miller@mopro.com', '1234', 1, NULL, 6, 18, '0000-00-00 00:00:00', 0, 0, '', NULL),
(14, 1493, 'Edzel', NULL, 'Rubite', 'edzel.rubite@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, '', NULL),
(15, 1673, 'Garry', NULL, 'Gacusan', 'garry.gacusan@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, '', NULL),
(16, 1684, 'Akash', NULL, 'Chowdhury', 'akash.chowdhury@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, '', NULL),
(17, 1235, 'Prince Ace', NULL, 'Miranda', 'prince.miranda@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, '', NULL),
(18, 1226, 'James Michael Brandon', NULL, 'Sy', 'james.sy@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, '', NULL),
(19, 642, 'Ramon', NULL, 'Ganjehi', 'ryam.ganjehi@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, '', NULL),
(20, 727, 'Rowena', NULL, 'Alix', 'rowena.alix@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, '', NULL),
(21, 726, 'Roberto', NULL, 'Roa', 'roberto.roa@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, '', NULL),
(22, 1696, 'Jitendra', NULL, 'Chettri', 'jitendra.chettri@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, '', NULL),
(23, 1446, 'Rupert', NULL, 'Santillan', 'rupert.santillan@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'f2658JacfHdeBQ677uYSJ89JqH1C4uIo2UnyhsZ71S8npICchbKV3RKKXryr', NULL),
(24, 1309, 'Jerome', NULL, 'Ochia', 'jerome.ochia@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, '', NULL),
(25, 1697, 'Aimee', NULL, 'Tuico', 'aimee.tuico@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, '', NULL),
(26, 991, 'Cherry', NULL, 'Obsequies', 'cherry.obsequies@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, '', NULL),
(27, 1559, 'Carlo', NULL, 'Aldemita', 'carlo.aldemita@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'RTWNQSD0UgP5ulVAt7cDbpFnQXmjDSe6O11OrJURAl12zBVCtCGLOcEJ6LYO', NULL),
(28, 1691, 'Scott', NULL, 'Sim', 'scott.sim@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, '', NULL),
(29, 725, 'Karen', NULL, 'Pinili', 'karen.pinili@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, '', NULL),
(30, 1677, 'Samuel David', NULL, 'Miranda', 'samuel.miranda@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, '', NULL),
(31, 734, 'Mia Carmel', NULL, 'Wong', 'm.wong@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, 'Rj1Lcowm78vt0IbLpmB41Nk3bdGsJZKpaFmkgGLtmLfYqg2R1rDt3ckXwcKc', NULL),
(32, 888, 'Jake', NULL, 'Relampagos', 'jake.relampagos@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, '', NULL),
(33, 1006, 'Jan', NULL, 'Croonen', 'jan.croonen@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, '', NULL),
(34, 1466, 'Honey Mae', NULL, 'Verallo', 'honey.verallo@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, '', NULL),
(35, 1322, 'Cherry Mae', NULL, 'Pelayo', 'cherry.pelayo@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, '', NULL),
(36, 1347, 'Brewster', NULL, 'Smith', 'brewster.smith@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, '', NULL),
(37, 1349, 'Aiko May', NULL, 'Suralta', 'aiko.suralta@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, '', NULL),
(38, 802, 'Julieto', NULL, 'Ansing', 'julieto.ansing@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, '', NULL),
(39, 965, 'Levin Venus', NULL, 'Bendijo', 'levin.bendijo@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, '', NULL),
(40, 993, 'Carmela', NULL, 'Carlobos', 'carmela.carlobos@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, '', NULL),
(41, 1128, 'Ryan', NULL, 'Calda', 'ryan.calda@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, '', NULL),
(42, 684, 'Raul', NULL, 'Cepeda', 'raul.cepeda@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, '', NULL),
(43, 1221, 'Ian', NULL, 'Fajardo', 'ian.fajardo@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, '', NULL),
(44, 753, 'Jomar', NULL, 'Escasinas', 'jomar.escasinas@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, '', NULL),
(45, 1126, 'Gil', NULL, 'Antecristo', 'gil.antecristo@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, '', NULL),
(46, 940, 'Janice', NULL, 'Masapequena', 'janice.masapequena@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, '', NULL),
(47, 798, 'Norlan', NULL, 'Balazo', 'norlan.balazo@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, '', NULL),
(48, 1291, 'Darryll', NULL, 'Rapacon', 'darryll.rapacon@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, '', NULL),
(49, 1069, 'Ariel', NULL, 'Colinares', 'ariel.colinares@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, '', NULL),
(50, 754, 'Jonathan', NULL, 'Docil', 'jonathan.docil@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, '', NULL),
(51, 862, 'Vanz', NULL, 'Mariano', 'vanz.mariano@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, '', NULL),
(52, 829, 'Bernardine', NULL, 'Ragas', 'bernardine.ragas@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, '', NULL),
(53, 961, 'Art', NULL, 'Sandalo', 'art.sandalo@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, '', NULL),
(54, 756, 'Edsel', NULL, 'Tampos', 'edsel.tampos@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, '', NULL),
(55, 803, 'Fritzie', NULL, 'Tongo', 'fritzie.tongo@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, '', NULL),
(56, 891, 'Tyron', NULL, 'Rodriguez', 'tyron.rodriguez@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, '', NULL),
(57, 807, 'Jhenise', NULL, 'Estellore', 'jhenise.estellore@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, '', NULL),
(58, 830, 'Jan', NULL, 'Prieto', 'jan.prieto@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, '', NULL),
(59, 868, 'Marvin', NULL, 'Tabacon', 'marvin.tabacon@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, '', NULL),
(60, 1401, 'Alice', NULL, 'Carrillo', 'alice.carrillo@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0, '', NULL),
(61, 1505, 'Jays', NULL, 'Arthur', 'jay.arthur@mopro.com', '1234', 1, NULL, 6, 18, '0000-00-00 00:00:00', 0, 0, '', NULL),
(62, 1360, 'John Manuel', 'Sebusa', 'Derecho', 'john.derecho@mopro.com', '$2y$10$..0V/vGGeCtmu5RZZ.nXp.kliDU2.QDYy1CNfTwMXyLLZBdzMQyVm', 1, '1995-12-06', 14, 17, '2017-04-17 00:00:00', 1, 5, 'LP6ptoOfEBE197gsP4Y0CneMc7PrXyn39K5YXeRlKkh1rXY96A0LNaBpc7gw', '2017-12-13 22:44:08'),
(63, 780, 'Iryn Mae', '', 'Ocado', 'iryn.ocada@mopro.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, '1995-06-06', 4, 10, '2017-01-09 00:00:00', 2, 1, 'EUkgBqD0PKvs4qftPqiNrf0ixhoowEfXz4xBS9tX0RJiWMGBL0BeNP08CfK7', NULL),
(64, 9999, 'Temporary', NULL, 'User 1', 'jmanuel.derecho@gmail.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, NULL, 1, 1, '2017-12-05 00:00:00', 1, 5, '', NULL),
(999, 999, 'Document Management', NULL, 'System', 'docpro.system@gmail.com', '$2y$10$v8hvnK/Yc3glz.Yq0n2m1OR3FqHlpR7vJyanREDdWIACxi4nIyHG6', 1, '2017-12-06', 21, 17, '2017-12-06 00:00:00', 1, 5, 'uTdv1JUJUAGsHl79xGkPhcOLu1EQ5dp4o4FdWwNTR5LdxdFmKJsqYGrBen1k', NULL);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `attachments`
--
ALTER TABLE `attachments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `document_departments`
--
ALTER TABLE `document_departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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