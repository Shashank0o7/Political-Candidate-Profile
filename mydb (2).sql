-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 17, 2020 at 03:04 PM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mydb`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getcandidate` (IN `cid` INT)  NO SQL
select E.id,E.name
from pesdetail E 
where E.id =(SELECT congress FROM party1 where consti_id =cid)
OR
( E.id = (SELECT bjp FROM party1 where consti_id = cid))
OR
( E.id = (SELECT app FROM party1 where consti_id = cid))$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `percentage_calc` (IN `project_id` INT)  NO SQL
select project_name,((funs_spent / funds_provided)*100) as Amount_Used_percentage
from projects
where id = project_id$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `accomplishment`
--

CREATE TABLE `accomplishment` (
  `id` int(2) NOT NULL,
  `achievements` text DEFAULT NULL,
  `year` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accomplishment`
--

INSERT INTO `accomplishment` (`id`, `achievements`, `year`) VALUES
(10, 'GOT AWARD FOR BEST MINISTER OF THE GOVERNMENT .\r\nCOMPLETED TARGET OF BUILDING 10000 KM ROAD.', 2016),
(11, NULL, NULL),
(12, NULL, NULL),
(13, NULL, NULL),
(14, NULL, NULL),
(15, 'NULL', NULL),
(16, 'NULL', NULL),
(17, NULL, NULL),
(20, NULL, NULL),
(21, 'SUCCESSFULLY ACHIEVED TARGET OF COMPLETING SEWAGE TREATMENT PLANT IN 2 YRS.   ', 2019),
(22, 'AWARDED AS THE EMERGING POLITICIAN .\r\nBUT IT WAS WITHDREW DUE TO FIR REGISTERED AGAINST HIM.', 2018),
(23, 'GOLD MEDALIST DURING HER COLLEGE TIME.', 2010),
(24, 'AWARDED FOR THE BEST YOUTH ICON IN FIELD OF POLITICS. ', 2018),
(30, NULL, NULL),
(31, NULL, NULL),
(32, 'WAS A WELL KNOWN LEADER OF PREVIOUS PARTY HE WAS IN.', 2016),
(33, 'SUCCESSFULLY ACHIEVED THE TARGET OF COMPLETING THE K.R ROAD WITHIN A RECORD TIME.', 2018),
(34, NULL, NULL),
(40, 'AWARD FOR BRILLIANT WORK IN FLOOD RELIEF CAMPS.\r\nBUT AWARD WAS WITHDRAWN BECAUSE OF CRIMINAL ACTIVITY. ', 2017),
(41, NULL, NULL),
(42, 'AWARD FOR BRILLIANT WORK WHILE DROUGHT OF 2018. ', 2018);

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`username`, `password`) VALUES
('shank@gmail.com', '121212');

-- --------------------------------------------------------

--
-- Table structure for table `consti`
--

CREATE TABLE `consti` (
  `consti_id` int(5) NOT NULL,
  `consti_name` varchar(10) NOT NULL,
  `no_of_candi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `consti`
--

INSERT INTO `consti` (`consti_id`, `consti_name`, `no_of_candi`) VALUES
(10001, 'BG1', 4),
(10002, 'BG2', 4),
(10003, 'BG3', 4),
(10004, 'BG4', 4),
(10005, 'BG5', 3),
(10006, 'BG6', 3),
(10007, 'BG7', 4),
(10008, 'bg8', 4);

--
-- Triggers `consti`
--
DELIMITER $$
CREATE TRIGGER `trig1` AFTER INSERT ON `consti` FOR EACH ROW INSERT INTO logs1 VALUES(ID,NEW.CONSTI_ID,NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `logs1`
--

CREATE TABLE `logs1` (
  `id` int(5) NOT NULL,
  `consti_id` int(5) NOT NULL,
  `date_consti_was_made` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `logs1`
--

INSERT INTO `logs1` (`id`, `consti_id`, `date_consti_was_made`) VALUES
(1, 10004, '2019-11-02'),
(2, 10005, '2019-11-06'),
(7, 10008, '2019-11-14');

-- --------------------------------------------------------

--
-- Table structure for table `party1`
--

CREATE TABLE `party1` (
  `consti_id` int(5) NOT NULL,
  `congress` int(2) DEFAULT NULL,
  `bjp` int(2) DEFAULT NULL,
  `app` int(2) DEFAULT NULL,
  `other` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `party1`
--

INSERT INTO `party1` (`consti_id`, `congress`, `bjp`, `app`, `other`) VALUES
(10001, 10, 20, 30, 40),
(10002, 11, 21, 31, 41),
(10003, 12, 22, 32, 42),
(10004, 13, 23, 33, 43),
(10005, 14, 24, 34, NULL),
(10006, 15, 25, 35, NULL),
(10007, 16, 26, 36, 46),
(10008, 17, 27, 37, 47);

--
-- Triggers `party1`
--
DELIMITER $$
CREATE TRIGGER `12` AFTER INSERT ON `party1` FOR EACH ROW update consti 
set no_of_candi = 
(select (count(bjp) + count(app) + count(congress) + count(other)) from party1
where consti_id = new.consti_id)
where consti_id = new.consti_id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `perdetail`
--

CREATE TABLE `perdetail` (
  `id` int(2) NOT NULL,
  `gender` char(1) NOT NULL,
  `age` int(3) NOT NULL,
  `qualification` text NOT NULL,
  `assets` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `perdetail`
--

INSERT INTO `perdetail` (`id`, `gender`, `age`, `qualification`, `assets`) VALUES
(10, 'M', 40, 'COMPLETED 10TH IN 1980 C.B.S.E.\r\n', '2 CAR 1 3BHK FLAT IN DELHI\r\nANNUAL INCOME OF 7LAKHS\r\nSIDE BUSINESS OF IMPORT EXPORT. '),
(11, 'M', 41, 'STUDIED TILL 10TH KERALA STATE BOARD.', '3 3BHK FLAT IN DELHI.\r\n4 CARS.\r\nSIDE BUSINESS OF GARMENTS.'),
(12, 'M', 41, 'COMPLETED UNDER GRADUATION IN 2000. ', '2 3BHK FLAT IN NAGPUR.\r\n2 VEHICLES.'),
(13, 'F', 45, 'COMPLETED 10TH IN 2001.\r\nCOMPLETED UNDER GRADUATION IN 2006.', '1 3BHK FLAT IN BANGALORE.'),
(14, 'M', 50, 'COMPLETED HIS 10TH FROM KARNATAKA BOARD.\r\n', 'ANNUAL INCOME 5 LAKHS.\r\nFLAT IN BANGALORE.'),
(15, 'M', 40, 'COMPLETED 10TH IN 2008', 'ANNUAL INCOME 5LAKHS'),
(16, 'M', 45, 'STUDIED TILL 10TH GRADE.', 'NET WORTH OF 70LAKHS.\r\nANNUAL INCOME OF 4LAKHS. '),
(17, 'F', 41, 'PASSED 12TH GRADE IN 2001.\r\nCOMPLETED HER GRADUATION IN 2005.', 'ANNUAL INCOME OF 4LAKHS.\r\nTOTAL PROPERTY WORTH OF 70 LAKHS. '),
(20, 'M', 40, 'COMPLETED 10TH IN 1989 C.B.S.E.\r\nDONE GRADUATION FROM V.I.T COLLEGE.', '1 CAR 1 2BHK FLAT IN DELHI \r\nANNUAL INCOME OF 5 LAKHS,\r\nSIDE BUSINESS OF CONSTRUCTIONS.'),
(21, 'F', 30, 'STUDIED TILL 8TH CLASS FROM KARNATAKA BOARD.', '1 3BHK FLAT.'),
(22, 'M', 35, 'STUDIED TILL 9TH CLASS.\r\n', '2 3BHK FLAT.\r\nSIDE BUSINESS OF FARMING.'),
(23, 'F', 41, 'COMPLETED 10TH CLASS IN 2004.\r\nCOMPLETED 12TH CLASS IN 2006.\r\nCOMPLETED UNDER GRADUATE IN 2010.', '2 2BHK FLAT IN BANGALORE.\r\n4 VEHICLES.'),
(24, 'F', 41, 'COMPLETED HIS 10TH IN 2003.\r\nCOMPLETED HIS 12TH IN 2005.\r\n', 'ANNUAL INCOME 3 LAKHS.\r\nSTAYS IN RENTED HOUSE.'),
(30, 'M', 45, 'STUDIED TILL 7TH GRADE.', '4 CARS,2 3BHK FLATS.\r\nANNUAL INCOME 8LAKHS.\r\nSIDE BUSINESS OF LAND BROKER.'),
(31, 'F', 39, 'COMPLETED 10TH IN 2004.\r\n', 'ANNUAL INCOME 5LAKHS.\r\nSIDE INCOME FROM PRIMARY SCHOOL.'),
(32, 'M', 50, 'COMPLETED HIS 10TH IN 2003.\r\nCOMPLETED HIS 12TH IN 2005.', 'ANNUAL INCOME OF 6 LAKHS.\r\n3 VEHICLE.\r\nTOTAL ASSETS WORTH 50 LAKHS.'),
(33, 'M', 45, 'COMPLETED 10TH IN 2008 AND GRADUATION IN 2012', 'ANNUAL INCOME 5LAKHS'),
(34, 'M', 50, 'COMPLETED HIS 10TH IN 2004.', 'ANNUAL INCOME OF 9LAKHS.\r\n4 VEHICLES, 2 FLATS.\r\nTOTAL ASSETS WORTH 1CR.'),
(35, 'M', 41, 'COMPLETED HIS 12TH IN 2001.\r\nDONE HIS B.TECH IN YEAR 2007.', 'ANNUAL INCOME OF 4LAKHS.\r\nNET PROPERTY WORTH OF 40LAKHS. '),
(36, 'F', 45, 'STUDIED TILL 8TH GRADE.', 'NET PROPERTY OF WORTH 80LAKHS.\r\n2 VEHICLES, 2 3BHK FLATS.'),
(37, 'M', 40, 'COMPLETED HIS 12TH GRADE IN 2001 C.B.S.E BOARD.\r\nDONE HIS B.E IN 2006 FROM XYZ COLLEGE.\r\n', 'ANNUAL  INCOME OF 6LAKHS.\r\nPROPERTY OF NET WORTH 80LAKS.'),
(40, 'M', 45, 'COMPLETED HIS 10TH IN 2000.\r\nCOMPLETED HIS 12TH 2002.', 'ANNUAL INCOME 9LAKHS.\r\nTOTAL ASSETS 1CR.'),
(41, 'M', 45, 'COMPLETED HIS 10TH IN 2001.\r\nCOMPLETED HIS b.tech IN 2007.', 'ANNUAL INCOME 5 LAKHS.\r\n2 CARS 1 3BHK FLAT IN DELHI.\r\nNET PROPERTY WORTH OF 80 LAKHS.'),
(42, 'M', 45, 'COMPLETED HIS GRADUATION IN 2003 FROM VTU.', '3 CARS  2 3BHK FLATS IN BANGALORE.\r\nANNUAL INCOME 7LAKH.\r\nNET PROPERTY WORTH OF 1CR.'),
(43, 'F', 45, 'STUDIED TILL 8TH GRADE.', 'ANNUAL INCOME OF 5LAKHS PA.\r\nNET PROPERTY WORTH OF 70LAKHS.'),
(46, 'M', 45, 'PASSED HIS 12 TH IN YEAR 2002.', 'ANNUAL INCOME OF 5 LAKHS.\r\nTOTAL PROPERTY WORTH OF 70 LAKHS.'),
(47, 'M', 40, 'COMPLETED HIS 12TH IN YEAR 2002.\r\nCOMPLETED HIS GRADUATION IN YEAR 2006.\r\n', 'ANNUAL INCOME OF 5LAKHS.\r\nTOTAL PROPERTY WORTH OF OF 30 LAKHS.');

-- --------------------------------------------------------

--
-- Table structure for table `pesdetail`
--

CREATE TABLE `pesdetail` (
  `id` int(2) NOT NULL,
  `name` varchar(15) NOT NULL,
  `date_of_joining` date NOT NULL,
  `last_elec_recod` text NOT NULL,
  `criminal_rec` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pesdetail`
--

INSERT INTO `pesdetail` (`id`, `name`, `date_of_joining`, `last_elec_recod`, `criminal_rec`) VALUES
(10, 'MR.SANJAY', '2019-11-19', 'LOST LAST ELECTION BY VOTE DIFF OF 45K', 'NO CRIMINAL RECORDS.'),
(11, 'Mr.ramlal', '2019-11-06', 'WON HIS LAST ELECTION BY VOTE DIFF OF 6K', '2 CASES REGISTERED FOR NON PAYMENT OF INCOME TAX.'),
(12, 'MR.KS.KUMAR', '2019-06-10', 'IN PAST YEARS HE OPTED FOR TWO ELECTION .\r\nHE WON HIS FIRST ELECTION BUT LOST THE LAST ONE.', 'HE HAS A CASE AGAINST HIS NAME FOR CORRUPTION WHILE HIS LAST TENURE IN GOVERNMENT.'),
(13, 'MR.RAJ', '2018-06-05', 'AFTER JOINING PARTY HE HASN\'T GONE FOR ANY ELECTION.', 'NULL'),
(14, 'MR.KUMAR VISHAL', '2018-07-19', 'IT WILL BE HIS FIRST ELECTION.', 'NULL'),
(15, '.R.SHANK', '2019-11-01', 'FIRST ELECTION', 'NULL'),
(16, 'MR.HARSHWARDHAN', '2016-04-05', 'LOST HIS LAST ELECTION BY A VOTE DIFFERENCE OF 5K.', 'FIR AGAINST HIM FOR MONEY EXTORTION FROM BUSINESSMAN. '),
(17, 'MRS.HEMA', '2018-07-16', 'IT WILL BE HER FIRST ELECTION.', 'FIR FOR NON PAYMENT OF ANNUAL TAX LAST YEAR.'),
(20, 'MR.KUMAR', '2019-08-07', 'IT WILL BE HIS FIRST ELECTION.', 'NULL'),
(21, 'MRS.S.J HEGDE', '2019-06-11', 'SHE WON HER LAST ELECTION BY A VOTE DIFFERENCE OF 1K.', 'NULL'),
(22, 'MR. CHIRAAG', '2017-08-01', 'HE HAS OPTED FOR ONE ELECTION SINCE DAT OF JOINING AND HE GOT VICTORY by vote difference of 24K.', 'HAS A FIR REGISTERED AGAINST HIM FOR DOMESTIC VIOLENCE.'),
(23, 'MRS. KIRAN ', '2018-07-16', 'SHE WON HER LAST ELECTION WITH A VOTE DIFFERENCE OF 15K.', 'NULL.'),
(24, 'MRS. RANI', '2017-01-03', 'WON HER LAST ELECTION\r\nBY VOTE DIFFERENCE OF 4K VOTES.', 'NULL'),
(25, 'MR.K SINGH', '2017-08-07', 'WON HIS LAST ELECTION BY A VOTE DIFFERENCE OF 4K.\r\n', 'NULL'),
(26, 'MRS.JAYA KUMARI', '2017-11-14', 'LOST HER LAST ELECTION BY A VOTE DIFFERENCE OF 18K.\r\nHER CANDIDATURE WAS SIZED DUE TO BIG VOTE DIFFERENCE.', 'CORRUPTION CHARGES AGAINST HER.\r\nTHE CASE IS UNDER TRIAL FOR LAST 2 YEARS.'),
(27, 'MR.LAL', '2019-08-19', 'IT WILL BE HIS FIRST ELECTION.', 'NULL'),
(30, 'MR. K RAJ', '2017-06-05', 'HAS OPTED FOR ONE ELECTION SINCE DATE OF JOINING AND GOT ELECTED BY A VOTE DIFFERENCE OF 3K.', 'CASE OF ATTEMPT TO MURDER AGAINST HIM UNDER INVESTIGATION.'),
(31, 'MRS.K .R MURTHY', '2017-11-01', 'LOST HER LAST ELECTION BY A VOTE DIFFERENCE IF 7K.', 'NULL.'),
(32, 'MR. ALEX', '2017-08-24', 'LOST HIS LAST ELECTION BY VOTE DIFFERENCE OF 7K.', 'NULL.'),
(33, 'MR.SUDHIR', '2017-08-03', 'WON HIS LAST ELECTION BY VOTE DIFFERENCE OF 7K.', 'NULL'),
(34, 'MR.ABHI', '2017-07-14', 'LOST HIS LAST ELECTION BY A VOTE DIFFERENCE OF 7K.', 'CORRUPTION CHARGES FOR NOT PAYMENT OF INCOME TAX.'),
(35, 'MR.SAMAY', '2016-06-05', 'WON HIS LAST ELECTION BY A VOTE DIFFERENCE OF 7K.', 'NULL'),
(36, 'MRS.SHEELA', '2016-07-16', 'WON HER LAST ELECTION BY VOTE DIFFERENCE OF 8K. ', 'CORRUPTION CHARGES FOR NON PAYMENT OF TAX.'),
(37, 'MR.HEMANT', '2017-06-05', 'LOST HIS LAST ELECTION BY A VOTE DIFFERENCE OF 7K.', 'FIR IN CASE OF ROUGH DRIVING.\r\nCASE IS UNDER TRIAL. ');

--
-- Triggers `pesdetail`
--
DELIMITER $$
CREATE TRIGGER `female_esc` BEFORE INSERT ON `pesdetail` FOR EACH ROW update perdetail
set gender ='F'
where NEW.name like 'MRS.%' and NEW.id=id
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `male_esc` BEFORE INSERT ON `pesdetail` FOR EACH ROW update perdetail
set gender ='M'
where NEW.name like 'MR.%' and NEW.id=id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `pesdetail1`
--

CREATE TABLE `pesdetail1` (
  `id` int(2) NOT NULL,
  `party_name` varchar(10) NOT NULL,
  `name` varchar(20) NOT NULL,
  `date_of_joining` date NOT NULL,
  `last_elec_rec` text NOT NULL,
  `criminal_rec` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pesdetail1`
--

INSERT INTO `pesdetail1` (`id`, `party_name`, `name`, `date_of_joining`, `last_elec_rec`, `criminal_rec`) VALUES
(40, 'RSS', 'MR. KR SINGH', '2018-08-13', 'LOST HIS LAST ELECTION.', 'NULL'),
(41, 'RJD', 'MR. R KUMAR', '2019-05-06', 'IT\'S HIS FIRST ELECTION.', 'NULL'),
(42, 'NCC', 'MR. KESHABH', '2017-04-03', 'LOST HIS LAST ELECTION WITH THE VOTE DIFFERENCE OF 6K.', 'F.I.R AGAINST HIM FOR NON PAYMENT OF TAX.'),
(43, 'LJP', 'MRS. SHARVARI', '2017-05-03', 'WON HER LAST ELECTION BY VOTE DIFFERENCE OF 4K.', 'NULL'),
(46, 'NCC', 'MR.STALINI', '2016-07-16', 'WON HIS LAST ELECTION BY A VOTE DIFFERENCE OF 8K.', 'FIR FOR NON PAYMENT OF TAX LAST YEAR.'),
(47, 'RSS', 'MR.K SINGH', '2016-07-16', 'LOST HIS LAST ELECTION BY A VOTE DIFFERENCE OF 7K.', 'NULL');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int(2) NOT NULL,
  `project_name` text NOT NULL,
  `funds_provided` text NOT NULL,
  `funs_spent` text NOT NULL,
  `year` date DEFAULT NULL,
  `status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `project_name`, `funds_provided`, `funs_spent`, `year`, `status`) VALUES
(10, 'SARDAR PATEL BRIDGE.', '15 LAKHS', '10 LAKHS', '1999-03-30', 'ON GOING--80% COMPLETED.'),
(11, 'KUMARSWAMY LAYOUT ROAD PROJECT', '15 LAKHS', '14.5 LAKHS', '0000-00-00', 'ON GOING-90% COMPLETED'),
(12, 'NO PROJECT UNDERTAKEN', 'NO PROJECT UNDERTAKEN', 'NO PROJECT UNDERTAKEN', NULL, 'NO PROJECT UNDERTAKEN'),
(13, '1.BANGALORE CANT WATER PIPELINE PROJECT\r\n2.BANGALORE CANT ROAD PROJECT', '1. 5 LAKHS\r\n2. 15 LAKHS\r\n', '1. 5 LAKHS\r\n2. 6 LAKHS', '0000-00-00', '1. COMPLETED\r\n2. ON GOING-40% COMPLETED'),
(14, 'YASWANTPURAMA DOOR TO DOOR GARBAGE COLLECTION SYSTEM PROJECT.', '5 LAKHS.', '4 LAKHS.', '0000-00-00', 'ON GOING--40% COMPLETED.'),
(15, 'NULL', 'NULL', 'NULL', '0000-00-00', 'NULL'),
(20, 'NO PROJECT UNDERTAKEN', 'NO PROJECT UNDERTAKEN', 'NO PROJECT UNDERTAKEN', NULL, 'NO PROJECT UNDERTAKEN'),
(21, 'NO PROJECT UNDERTAKEN', 'NO PROJECT UNDERTAKEN', 'NO PROJECT UNDERTAKEN', NULL, 'NO PROJECT UNDERTAKEN'),
(22, 'SEWAGE TREATMENT PLANT ', '20 LAKHS', '5 LAKHS', '0000-00-00', 'WITHHELD '),
(23, 'VIDHAYA DAM PROJECT', '50 LAKHS', '10 LAKHS', '0000-00-00', 'ON GOING-20% COMPLETED'),
(24, 'M.G. ROAD CONSTRUCTION PROJECT.', '10LAKHS', '10LAKHS', '0000-00-00', 'ON GOING--80% COMPLETED.\r\nSHORTAGE OF FUND.'),
(30, 'J.P NAGAR RECONSTRUCTION PROJECT', '30 LAKHS', '10 LAKHS', '0000-00-00', 'WITHHELD DUE TO CRIMINAL RECORD OF CANDIDATE'),
(31, 'JAYANAGR ROAD CONSTRUCTION PROJECT', '10 LAKHS', '10 LAKHS', '0000-00-00', 'COMPLETED'),
(32, 'NO PROJECT UNDERTAKEN', 'NO PROJECT UNDERTAKEN', 'NO PROJECT UNDERTAKEN', NULL, 'NO PROJECT UNDERTAKEN'),
(33, 'K.R PURAM ROAD', '15LAKHS', '10LAKHS', '2018-03-11', 'ONGOING 70% COMPLETED'),
(34, 'J.P.NAGAR WATER PIPELINE PROJECT.', '14 LAKHS', '12 LAKHS', NULL, 'ON GOING-- 40% COMPLETED.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accomplishment`
--
ALTER TABLE `accomplishment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `consti`
--
ALTER TABLE `consti`
  ADD PRIMARY KEY (`consti_id`);

--
-- Indexes for table `logs1`
--
ALTER TABLE `logs1`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `party1`
--
ALTER TABLE `party1`
  ADD PRIMARY KEY (`consti_id`);

--
-- Indexes for table `perdetail`
--
ALTER TABLE `perdetail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pesdetail`
--
ALTER TABLE `pesdetail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pesdetail1`
--
ALTER TABLE `pesdetail1`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `logs1`
--
ALTER TABLE `logs1`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
