-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 10, 2017 at 08:46 PM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mopro`
--

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
  `emp_ID` int(11) NOT NULL,
  `emp_firstname` varchar(50) DEFAULT NULL,
  `emp_middlename` varchar(50) DEFAULT NULL,
  `emp_lastname` varchar(50) DEFAULT NULL,
  `emp_email` varchar(50) DEFAULT NULL,
  `emp_password` varchar(50) DEFAULT NULL,
  `emp_status` int(11) NOT NULL,
  `emp_birthdate` date DEFAULT NULL,
  `emp_dept_ID` int(11) NOT NULL,
  `emp_position_ID` int(11) NOT NULL,
  `emp_date_hired` datetime NOT NULL,
  `emp_gender` int(11) NOT NULL,
  `emp_wave_no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee_details`
--

INSERT INTO `employee_details` (`emp_ID`, `emp_firstname`, `emp_middlename`, `emp_lastname`, `emp_email`, `emp_password`, `emp_status`, `emp_birthdate`, `emp_dept_ID`, `emp_position_ID`, `emp_date_hired`, `emp_gender`, `emp_wave_no`) VALUES
(808, 'Ted', 'Bejoc', 'Saavedra', 'ted.saavedra@mopro.com', '1234', 1, '1994-05-11', 14, 17, '2017-01-09 00:00:00', 1, 1),
(872, 'Davinci', NULL, 'Solidarios', 'davinci.solidarios@mopro.com', '1234', 1, '1990-01-01', 16, 9, '2017-01-09 00:00:00', 1, 1),
(997, 'Retchel', NULL, 'Tapayan', 'retchel.tapayan@mopro.com', '1234', 1, '1988-05-11', 1, 1, '2017-01-09 00:00:00', 2, 2),
(1038, 'Franz', NULL, 'Canares', 'franz.canares@mopro.com', '1234', 1, '2017-09-14', 16, 4, '2017-02-27 00:00:00', 2, 2),
(801, 'Geoffrey', NULL, 'Honculada', 'geoffrey.honculada@mopro.com', '1234', 1, '2017-09-01', 16, 9, '2017-01-09 00:00:00', 1, 1),
(1021, 'Arturo', NULL, 'Solito', 'arturo.solito@mopro.com', '1234', 1, NULL, 16, 4, '0000-00-00 00:00:00', 0, 0),
(1419, 'Mars', NULL, 'Duterte', 'mars.duterte@mopro.com', '1234', 1, NULL, 16, 4, '0000-00-00 00:00:00', 0, 0),
(1376, 'Jozette', NULL, 'Cortes', 'jozette.cortes@mopro.com', '1234', 1, NULL, 16, 4, '0000-00-00 00:00:00', 0, 0),
(1070, 'Jude', NULL, 'Mag-asin', 'jude.magasin@mopro.com', '1234', 1, NULL, 16, 4, '0000-00-00 00:00:00', 0, 0),
(864, 'Marjhann Kein', NULL, 'Pulvera', 'kein.pulvera@mopro.com', '1234', 1, NULL, 16, 4, '0000-00-00 00:00:00', 0, 0),
(1008, 'Sarah', NULL, 'Macaspac', 'sarah.macaspac@mopro.com', '1234', 1, NULL, 6, 1, '0000-00-00 00:00:00', 0, 0),
(1498, 'Cenon', NULL, 'Lees', 'cenon.lee@mopro.com', '1234', 1, NULL, 6, 18, '0000-00-00 00:00:00', 1, 2),
(1510, 'Nine', NULL, 'Miller', 'nine.miller@mopro.com', '1234', 1, NULL, 6, 18, '0000-00-00 00:00:00', 0, 0),
(1493, 'Edzel', NULL, 'Rubite', 'edzel.rubite@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0),
(1673, 'Garry', NULL, 'Gacusan', 'garry.gacusan@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0),
(1684, 'Akash', NULL, 'Chowdhury', 'akash.chowdhury@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0),
(1235, 'Prince Ace', NULL, 'Miranda', 'prince.miranda@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0),
(1226, 'James Michael Brandon', NULL, 'Sy', 'james.sy@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0),
(642, 'Ramon', NULL, 'Ganjehi', 'ryam.ganjehi@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0),
(727, 'Rowena', NULL, 'Alix', 'rowena.alix@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0),
(726, 'Roberto', NULL, 'Roa', 'roberto.roa@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0),
(1696, 'Jitendra', NULL, 'Chettri', 'jitendra.chettri@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0),
(1446, 'Rupert', NULL, 'Santillan', 'rupert.santillan@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0),
(1309, 'Jerome', NULL, 'Ochia', 'jerome.ochia@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0),
(1697, 'Aimee', NULL, 'Tuico', 'aimee.tuico@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0),
(991, 'Cherry', NULL, 'Obsequies', 'cherry.obsequies@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0),
(1559, 'Carlo', NULL, 'Aldemita', 'carlo.aldemita@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0),
(1691, 'Scott', NULL, 'Sim', 'scott.sim@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0),
(725, 'Karen', NULL, 'Pinili', 'karen.pinili@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0),
(1677, 'Samuel David', NULL, 'Miranda', 'samuel.miranda@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0),
(734, 'Mia Carmel', NULL, 'Wong', 'm.wong@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0),
(888, 'Jake', NULL, 'Relampagos', 'jake.relampagos@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0),
(1006, 'Jan', NULL, 'Croonen', 'jan.croonen@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0),
(1466, 'Honey Mae', NULL, 'Verallo', 'honey.verallo@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0),
(1322, 'Cherry Mae', NULL, 'Pelayo', 'cherry.pelayo@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0),
(1347, 'Brewster', NULL, 'Smith', 'brewster.smith@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0),
(1349, 'Aiko May', NULL, 'Suralta', 'aiko.suralta@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0),
(802, 'Julieto', NULL, 'Ansing', 'julieto.ansing@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0),
(965, 'Levin Venus', NULL, 'Bendijo', 'levin.bendijo@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0),
(993, 'Carmela', NULL, 'Carlobos', 'carmela.carlobos@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0),
(1128, 'Ryan', NULL, 'Calda', 'ryan.calda@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0),
(684, 'Raul', NULL, 'Cepeda', 'raul.cepeda@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0),
(1221, 'Ian', NULL, 'Fajardo', 'ian.fajardo@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0),
(753, 'Jomar', NULL, 'Escasinas', 'jomar.escasinas@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0),
(1126, 'Gil', NULL, 'Antecristo', 'gil.antecristo@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0),
(940, 'Janice', NULL, 'Masapequena', 'janice.masapequena@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0),
(798, 'Norlan', NULL, 'Balazo', 'norlan.balazo@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0),
(1291, 'Darryll', NULL, 'Rapacon', 'darryll.rapacon@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0),
(1069, 'Ariel', NULL, 'Colinares', 'ariel.colinares@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0),
(754, 'Jonathan', NULL, 'Docil', 'jonathan.docil@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0),
(862, 'Vanz', NULL, 'Mariano', 'vanz.mariano@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0),
(829, 'Bernardine', NULL, 'Ragas', 'bernardine.ragas@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0),
(961, 'Art', NULL, 'Sandalo', 'art.sandalo@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0),
(756, 'Edsel', NULL, 'Tampos', 'edsel.tampos@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0),
(803, 'Fritzie', NULL, 'Tongo', 'fritzie.tongo@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0),
(891, 'Tyron', NULL, 'Rodriguez', 'tyron.rodriguez@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0),
(807, 'Jhenise', NULL, 'Estellore', 'jhenise.estellore@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0),
(830, 'Jan', NULL, 'Prieto', 'jan.prieto@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0),
(868, 'Marvin', NULL, 'Tabacon', 'marvin.tabacon@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0),
(1401, 'Alice', NULL, 'Carrillo', 'alice.carrillo@mopro.com', '1234', 1, NULL, 1, 1, '0000-00-00 00:00:00', 0, 0),
(1505, 'Jays', NULL, 'Arthur', 'jay.arthur@mopro.com', '1234', 1, NULL, 6, 18, '0000-00-00 00:00:00', 0, 0);

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
-- Indexes for table `employee_dept`
--
ALTER TABLE `employee_dept`
  ADD PRIMARY KEY (`dept_ID`);

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
-- AUTO_INCREMENT for table `employee_dept`
--
ALTER TABLE `employee_dept`
  MODIFY `dept_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

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
