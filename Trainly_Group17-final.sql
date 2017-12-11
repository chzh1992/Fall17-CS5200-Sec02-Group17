-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 11, 2017 at 05:31 PM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Trainly_Group17`
--


DROP DATABASE IF EXISTS `Trainly_Group17`;

CREATE Database Trainly_Group17 ;

Use Trainly_Group17;
-- --------------------------------------------------------

--
-- Table structure for table `Admin`
--

CREATE TABLE `Admin` (
  `AdminId` int(11) NOT NULL,
  `AdminTimestamp` datetime DEFAULT NULL,
  `GrantorId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Admin`
--

INSERT INTO `Admin` (`AdminId`, `AdminTimestamp`, `GrantorId`) VALUES
(1015, '2017-11-23 21:14:10', NULL),
(1016, '2017-11-23 21:14:10', 1015),
(1017, '2017-11-23 21:14:10', 1015),
(1018, '2017-11-23 21:14:10', 1015),
(1019, '2017-11-23 21:14:10', 1015),
(1020, '2017-11-23 21:14:10', 1015),
(1021, '2017-11-23 21:14:10', 1015),
(1022, '2017-11-23 21:14:10', 1015),
(1023, '2017-11-23 21:14:10', 1015),
(1024, '2017-11-23 21:14:10', 1015);

-- --------------------------------------------------------

--
-- Table structure for table `CompletedMaterial`
--

CREATE TABLE `CompletedMaterial` (
  `CourseMaterialId` int(11) NOT NULL,
  `StudentId` int(11) DEFAULT NULL,
  `Timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `CompletedMaterial`
--

INSERT INTO `CompletedMaterial` (`CourseMaterialId`, `StudentId`, `Timestamp`) VALUES
(1, 1001, '2013-08-05 18:19:03'),
(2, 1001, '2013-08-05 18:19:03'),
(3, 1001, '2013-08-05 18:19:03'),
(4, 1001, '2013-08-05 18:19:03'),
(5, 1001, '2013-08-05 18:19:03'),
(6, 1001, '2013-08-05 18:19:03'),
(7, 1001, '2013-08-05 18:19:03'),
(8, 1001, '2013-08-05 18:19:03'),
(9, 1001, '2013-08-05 18:19:03'),
(10, 1001, '2013-08-05 18:19:03');

-- --------------------------------------------------------

--
-- Table structure for table `Course`
--

CREATE TABLE `Course` (
  `CourseId` int(11) NOT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `PrimaryTopicId` int(11) NOT NULL,
  `Icon` varchar(100),
  `Cost` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Course`
--

INSERT INTO `Course` (`CourseId`, `Description`, `Name`, `PrimaryTopicId`, `Icon`, `Cost`) VALUES
(5000, 'Course1-ab', 'course1', 1, NULL, 1500),
(5001, 'Course2-ab', 'course2', 2, NULL, 1500),
(5002, 'Course3-ab', 'course3', 3, NULL, 1500),
(5003, 'Course4-ab', 'course4', 4, NULL, 1500),
(5004, 'Course5-ab', 'course5', 5, NULL, 1500),
(5005, 'Course6-ab', 'course7', 6, NULL, 1500),
(5006, 'Course7-ab', 'course7', 7, NULL, 1500),
(5007, 'Course8-ab', 'course8', 8, NULL, 1500),
(5008, 'Course9-ab', 'course9', 9, NULL, 1500),
(5009, 'Course10-ab', 'course10', 10, NULL, 1500);

-- --------------------------------------------------------

--
-- Table structure for table `CourseCreated`
--

CREATE TABLE `CourseCreated` (
  `FacultyId` int(11) NOT NULL,
  `CourseId` int(11) NOT NULL,
  `Timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `CourseCreated`
--

INSERT INTO `CourseCreated` (`FacultyId`, `CourseId`, `Timestamp`) VALUES
(1010, 5000, '2013-08-05 18:19:03'),
(1010, 5001, '2013-08-05 18:19:03'),
(1010, 5002, '2013-08-05 18:19:03'),
(1010, 5003, '2013-08-05 18:19:03'),
(1010, 5004, '2013-08-05 18:19:03'),
(1010, 5005, '2013-08-05 18:19:03'),
(1010, 5006, '2013-08-05 18:19:03'),
(1010, 5007, '2013-08-05 18:19:03'),
(1010, 5008, '2013-08-05 18:19:03'),
(1010, 5009, '2013-08-05 18:19:03');

-- --------------------------------------------------------

--
-- Table structure for table `CourseInterested`
--

CREATE TABLE `CourseInterested` (
  `StudentId` int(11) NOT NULL,
  `CourseId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `CourseInterested`
--

INSERT INTO `CourseInterested` (`StudentId`, `CourseId`) VALUES
(1001, 5000),
(1001, 5001),
(1001, 5002),
(1001, 5003),
(1001, 5004),
(1001, 5005),
(1001, 5006),
(1001, 5007),
(1001, 5008),
(1001, 5009);

-- --------------------------------------------------------

--
-- Table structure for table `CourseMaterial`
--

CREATE TABLE `CourseMaterial` (
  `CourseMaterialId` int(11) NOT NULL,
  `CourseId` int(11) NOT NULL,
  `Ordinal` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `CourseMaterial`
--

INSERT INTO `CourseMaterial` (`CourseMaterialId`, `CourseId`, `Ordinal`, `Name`, `Type`) VALUES
(1, 5000, 1, 'Material1', 'Post'),
(2, 5001, 1, 'Material1', 'Post'),
(3, 5002, 1, 'Material1', 'Post'),
(4, 5003, 1, 'Material1', 'Post'),
(5, 5004, 1, 'Material1', 'Post'),
(6, 5005, 1, 'Material1', 'Post'),
(7, 5006, 1, 'Material1', 'Post'),
(8, 5007, 1, 'Material1', 'Post'),
(9, 5008, 1, 'Material1', 'Post'),
(10, 5009, 1, 'Material1', 'Post'),
(11, 5000, 2, 'Material2', 'Link'),
(12, 5001, 2, 'Material2', 'Link'),
(13, 5002, 2, 'Material2', 'Link'),
(14, 5003, 2, 'Material2', 'Link'),
(15, 5004, 2, 'Material2', 'Link'),
(16, 5005, 2, 'Material2', 'Link'),
(17, 5006, 2, 'Material2', 'Link'),
(18, 5007, 2, 'Material2', 'Link'),
(19, 5008, 2, 'Material2', 'Link'),
(20, 5009, 2, 'Material2', 'Link'),
(21, 5000, 3, 'Material3', 'DownloadableFile'),
(22, 5001, 3, 'Material3', 'DownloadableFile'),
(23, 5002, 3, 'Material3', 'DownloadableFile'),
(24, 5003, 3, 'Material3', 'DownloadableFile'),
(25, 5004, 3, 'Material3', 'DownloadableFile'),
(26, 5005, 3, 'Material3', 'DownloadableFile'),
(27, 5006, 3, 'Material3', 'DownloadableFile'),
(28, 5007, 3, 'Material3', 'DownloadableFile'),
(29, 5008, 3, 'Material3', 'DownloadableFile'),
(30, 5009, 3, 'Material3', 'DownloadableFile');

-- --------------------------------------------------------

--
-- Table structure for table `CourseMaterialQuestion`
--

CREATE TABLE `CourseMaterialQuestion` (
  `QuestionId` int(11) NOT NULL,
  `CourseMaterialId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `CourseMaterialQuestion`
--

INSERT INTO `CourseMaterialQuestion` (`QuestionId`, `CourseMaterialId`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `CourseQuestion`
--

CREATE TABLE `CourseQuestion` (
  `QuestionId` int(11) NOT NULL,
  `QuestionerId` int(11) NOT NULL,
  `Question` text,
  `Answer` text,
  `AnswererId` int(11) DEFAULT NULL,
  `PublicFlag` tinyint(1) NOT NULL,
  `CourseId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `CourseQuestion`
--

INSERT INTO `CourseQuestion` (`QuestionId`, `QuestionerId`, `Question`, `Answer`, `AnswererId`, `PublicFlag`, `CourseId`) VALUES
(1, 1001, 'Question1', 'Answer1', 1010, 1, 5001),
(2, 1001, 'Question1', 'Answer1', 1010, 1, 5001),
(3, 1001, 'Question1', 'Answer1', 1010, 1, 5001),
(4, 1001, 'Question1', 'Answer1', 1010, 1, 5001),
(5, 1001, 'Question1', 'Answer1', 1010, 1, 5001),
(6, 1001, 'Question1', 'Answer1', 1010, 1, 5001),
(7, 1001, 'Question1', 'Answer1', 1010, 1, 5001),
(8, 1001, 'Question1', 'Answer1', 1010, 1, 5001),
(9, 1001, 'Question1', 'Answer1', 1010, 1, 5001),
(10, 1001, 'Question1', 'Answer1', 1010, 1, 5001);

-- --------------------------------------------------------

--
-- Table structure for table `CourseTaken`
--

CREATE TABLE `CourseTaken` (
  `StudentId` int(11) NOT NULL,
  `CourseId` int(11) NOT NULL,
  `Rating` enum('1','2','3','4','5') DEFAULT NULL,
  `CompletedTimestamp` datetime DEFAULT NULL,
  `Comment` text,
  `ConfirmationCode` int(11) DEFAULT NULL,
  `PaymentTimestamp` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `CourseTaken`
--

INSERT INTO `CourseTaken` (`StudentId`, `CourseId`, `Rating`, `CompletedTimestamp`, `Comment`, `ConfirmationCode`, `PaymentTimestamp`) VALUES
(1001, 5000, '1', '2013-08-05 18:19:03', 'Good', 1000, '2013-03-05 18:19:03'),
(1001, 5001, '1', '2013-08-05 18:19:03', 'Good', 2000, '2013-03-05 18:19:03'),
(1001, 5002, '1', '2013-08-05 18:19:03', 'Good', 3000, '2013-03-05 18:19:03'),
(1001, 5003, '1', '2013-08-05 18:19:03', 'Good', 4000, '2013-03-05 18:19:03'),
(1001, 5004, NULL, NULL, NULL, 5000, '2013-08-05 18:19:03'),
(1001, 5005, NULL, NULL, NULL, 6000, '2013-08-05 18:19:03'),
(1001, 5006, NULL, NULL, NULL, 7000, '2013-03-05 18:19:03'),
(1001, 5007, NULL, NULL, NULL, 8000, '2013-08-05 18:19:03'),
(1001, 5008, NULL, '2013-08-05 18:19:03', 'Good', 9000, '2013-08-05 18:19:03'),
(1001, 5009, NULL, '2013-08-05 18:19:03', 'Good', 10000, '2013-03-05 18:19:03');

-- --------------------------------------------------------

--
-- Table structure for table `CourseTopic`
--

CREATE TABLE `CourseTopic` (
  `TopicId` int(11) NOT NULL,
  `Name` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `CourseTopic`
--

INSERT INTO `CourseTopic` (`TopicId`, `Name`) VALUES
(1, 'Topic1'),
(2, 'Topic2'),
(3, 'Topic3'),
(4, 'Topic4'),
(5, 'Topic5'),
(6, 'Topic6'),
(7, 'Topic7'),
(8, 'Topic8'),
(9, 'Topic9'),
(10, 'Topic10');

-- --------------------------------------------------------

--
-- Table structure for table `DownloadableFile`
--

CREATE TABLE `DownloadableFile` (
  `CourseMaterialId` int(11) NOT NULL,
  `Path` varchar(60) DEFAULT NULL,
  `Size` double UNSIGNED DEFAULT NULL,
  `Type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `DownloadableFile`
--

INSERT INTO `DownloadableFile` (`CourseMaterialId`, `Path`, `Size`, `Type`) VALUES
(21, 'http://5001+021+03', 2, 'MIME'),
(22, 'http://5002+022+03', 1.3, 'Null'),
(23, 'http://5003+023+03', 1.5, 'MIME'),
(24, 'http://5004+024+03', 3, 'MIME'),
(25, 'http://5005+025+03', 8.4, 'Null'),
(26, 'http://5006+026+03', 3.9, 'MIME'),
(27, 'http://5007+027+03', 1.2, 'MIME'),
(28, 'http://5008+028+03', 1.5, 'Null'),
(29, 'http://5009+029+03', 7.9, 'MIME'),
(30, 'http://5010+030+03', 9.4, 'Null');

-- --------------------------------------------------------

--
-- Table structure for table `Faculty`
--

CREATE TABLE `Faculty` (
  `FacultyId` int(11) NOT NULL,
  `Title` varchar(20) DEFAULT NULL,
  `Affiliation` varchar(20) DEFAULT NULL,
  `WorkWebsite` varchar(200) DEFAULT NULL,
  `ValidationStatus` tinyint(1) DEFAULT NULL,
  `ValidatorId` int(11) DEFAULT NULL,
  `FacultyTimestamp` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Faculty`
--

INSERT INTO `Faculty` (`FacultyId`, `Title`, `Affiliation`, `WorkWebsite`, `ValidationStatus`, `ValidatorId`, `FacultyTimestamp`) VALUES
(1010, 'Title1', 'Organization1', 'www.organization1.com', 1, NULL, '2017-11-26 01:30:29'),
(1011, 'Title1', 'Organization1', 'www.organization1.com', 0, NULL, NULL),
(1012, 'Title1', 'Organization1', 'www.organization1.com', 0, NULL, NULL),
(1013, 'Title1', 'Organization1', 'www.organization1.com', 0, NULL, NULL),
(1014, 'Title1', 'Organization1', 'www.organization1.com', 0, NULL, NULL),
(1015, 'Title2', 'Organization2', 'www.organization2.com', 1, 1021, '2017-11-23 21:17:13'),
(1016, 'Title2', 'Organization2', 'www.organization2.com', 1, 1022, '2017-11-23 21:17:13'),
(1017, 'Title2', 'Organization2', 'www.organization2.com', 1, 1023, '2017-11-23 21:17:13'),
(1018, 'Title2', 'Organization2', 'www.organization2.com', 1, 1024, '2017-11-23 21:17:13'),
(1019, 'Title2', 'Organization2', 'www.organization2.com', 1, 1024, '2017-11-23 21:17:13');

-- --------------------------------------------------------

--
-- Table structure for table `LikedQuestion`
--

CREATE TABLE `LikedQuestion` (
  `QuestionId` int(11) NOT NULL,
  `StudentId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `LikedQuestion`
--

INSERT INTO `LikedQuestion` (`QuestionId`, `StudentId`) VALUES
(1, 1001),
(2, 1001),
(3, 1001),
(4, 1001),
(5, 1001),
(6, 1001),
(7, 1001),
(8, 1001),
(9, 1001),
(10, 1001);

-- --------------------------------------------------------

--
-- Table structure for table `Link`
--

CREATE TABLE `Link` (
  `CourseMaterialId` int(11) NOT NULL,
  `Url` varchar(60) NOT NULL,
  `VideoFlag` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Link`
--

INSERT INTO `Link` (`CourseMaterialId`, `Url`, `VideoFlag`) VALUES
(11, 'http://5001+011+02', 1),
(12, 'http://5001+012+02', 1),
(13, 'http://5001+013+02', 1),
(14, 'http://5001+014+02', 1),
(15, 'http://5001+015+02', 0),
(16, 'http://5001+016+02', 0),
(17, 'http://5001+017+02', 1),
(18, 'http://5001+018+02', 0),
(19, 'http://5001+019+02', 0),
(20, 'http://5001+020+02', 1);

-- --------------------------------------------------------

--
-- Table structure for table `Phone`
--

CREATE TABLE `Phone` (
  `UserId` int(11) NOT NULL,
  `PhoneNumber` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Phone`
--

INSERT INTO `Phone` (`UserId`, `PhoneNumber`) VALUES
(1000, '1234567890'),
(1001, '1234567890'),
(1002, '1234567890'),
(1003, '1234567890'),
(1004, '1234567890'),
(1005, '1234567890'),
(1006, '1234567890'),
(1007, '1234567890'),
(1008, '1234567890'),
(1009, '1234567890');

-- --------------------------------------------------------

--
-- Table structure for table `Post`
--

CREATE TABLE `Post` (
  `CourseMaterialId` int(11) NOT NULL,
  `Content` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Post`
--

INSERT INTO `Post` (`CourseMaterialId`, `Content`) VALUES
(1, 'Text01'),
(2, 'Text02'),
(3, 'Text03'),
(4, 'Text04'),
(5, 'Text05'),
(6, 'Text06'),
(7, 'Text07'),
(8, 'Text08'),
(9, 'Text09'),
(10, 'Text10');

-- --------------------------------------------------------

--
-- Table structure for table `SecondaryTopic`
--

CREATE TABLE `SecondaryTopic` (
  `TopicId` int(11) NOT NULL,
  `CourseId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `SecondaryTopic`
--

INSERT INTO `SecondaryTopic` (`TopicId`, `CourseId`) VALUES
(1, 5001),
(2, 5001),
(3, 5001),
(4, 5001),
(5, 5001),
(6, 5001),
(7, 5001),
(8, 5001),
(9, 5001),
(10, 5001);

-- --------------------------------------------------------

--
-- Table structure for table `User`
--

CREATE TABLE `User` (
  `UserId` int(11) NOT NULL,
  `FirstName` varchar(40) NOT NULL,
  `LastName` varchar(20) NOT NULL,
  `Email` varchar(80) DEFAULT NULL,
  `HashAndSalt` varchar(100) NOT NULL,
  `Street` varchar(20) DEFAULT NULL,
  `City` varchar(40) DEFAULT NULL,
  `Country` varchar(40) DEFAULT NULL,
  `PostalCode` varchar(10) DEFAULT NULL,
  `ProfilePic` longblob,
  `FacultyFlag` tinyint(1) NOT NULL DEFAULT '0',
  `AdminFlag` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `User`
--

INSERT INTO `User` (`UserId`, `FirstName`, `LastName`, `Email`, `HashAndSalt`, `Street`, `City`, `Country`, `PostalCode`, `ProfilePic`, `FacultyFlag`, `AdminFlag`) VALUES
(1000, 'User1', 'User1', 'user1@gmail.com', '$2a$10$Xuu7M1NNd3bL4X61uUglgONMIvUOwgPgz4WwEZqdIwBjjvT/XLWKa', 'Street1', 'Boston', 'USA', '02115', NULL, 0, 0),
(1001, 'User2', 'User2', 'user2@gmail.com', '$2a$10$/hiwXx1IBzmuV3ySLXkmR.uHuaVDInpxijI12Kw162nkMz2BFG73u', 'Street2', 'Boston', 'USA', '02115', NULL, 0, 0),
(1002, 'User3', 'User3', 'user3@gmail.com', '$2a$10$H0pUw/fwLDIdig5qS3ZS1e0MO6YogecKsxWf4qqXglXABESaZ7126', 'Street3', 'NYC', 'USA', '02115', NULL, 0, 0),
(1003, 'User4', 'User4', 'user4@gmail.com', '$2a$10$LfiwVpIsrRXPWpe1fKB.CuadyZoJC2KLAxOBozeMUUgfs2F.9dU82', 'Street4', 'NYC', 'USA', '02115', NULL, 0, 0),
(1004, 'User5', 'User5', 'user5@gmail.com', '$2a$10$FmJbiVS.Q67O/94pHSJruO/ZOOFi5tJ8C4d/wyBGPhFoHdFSLSEG6', 'Street5', 'Dallas', 'USA', '02115', NULL, 0, 0),
(1005, 'User6', 'User6', 'user6@gmail.com', '$2a$10$Xuu7M1NNd3bL4X61uUglgONMIvUOwgPgz4WwEZqdIwBjjvT/XLWKa', 'Street6', 'Dallas', 'USA', '02115', NULL, 0, 0),
(1006, 'User7', 'User7', 'user7@gmail.com', '$2a$10$Xuu7M1NNd3bL4X61uUglgONMIvUOwgPgz4WwEZqdIwBjjvT/XLWKa', 'Street7', 'Seattle', 'USA', '02115', NULL, 0, 0),
(1007, 'User8', 'User8', 'user8@gmail.com', '$2a$10$Xuu7M1NNd3bL4X61uUglgONMIvUOwgPgz4WwEZqdIwBjjvT/XLWKa', 'Street8', 'Seattle', 'USA', '02115', NULL, 0, 0),
(1008, 'User9', 'User9', 'user9@gmail.com', '$2a$10$Xuu7M1NNd3bL4X61uUglgONMIvUOwgPgz4WwEZqdIwBjjvT/XLWKa', 'Street9', 'SanFrancisco', 'USA', '02115', NULL, 0, 0),
(1009, 'User10', 'User10', 'user10@gmail.com', '$2a$10$Xuu7M1NNd3bL4X61uUglgONMIvUOwgPgz4WwEZqdIwBjjvT/XLWKa', 'Street10', 'SanFrancisco', 'USA', '02115', NULL, 0, 0),
(1010, 'User11', 'User11', 'user11@gmail.com', '$2a$10$Xuu7M1NNd3bL4X61uUglgONMIvUOwgPgz4WwEZqdIwBjjvT/XLWKa', 'Street11', 'Boston', 'USA', '02115', NULL, 1, 0),
(1011, 'User12', 'User12', 'user12@gmail.com', '$2a$10$Xuu7M1NNd3bL4X61uUglgONMIvUOwgPgz4WwEZqdIwBjjvT/XLWKa', 'Street12', 'Boston', 'USA', '02115', NULL, 1, 0),
(1012, 'User13', 'User13', 'user13@gmail.com', '$2a$10$Xuu7M1NNd3bL4X61uUglgONMIvUOwgPgz4WwEZqdIwBjjvT/XLWKa', 'Street13', 'Boston', 'USA', '02115', NULL, 1, 0),
(1013, 'User14', 'User14', 'user14@gmail.com', '$2a$10$Xuu7M1NNd3bL4X61uUglgONMIvUOwgPgz4WwEZqdIwBjjvT/XLWKa', 'Street14', 'Boston', 'USA', '02115', NULL, 1, 0),
(1014, 'User15', 'User15', 'user15@gmail.com', '$2a$10$Xuu7M1NNd3bL4X61uUglgONMIvUOwgPgz4WwEZqdIwBjjvT/XLWKa', 'Street15', 'Boston', 'USA', '02115', NULL, 1, 0),
(1015, 'User16', 'User16', 'user16@gmail.com', '$2a$10$Xuu7M1NNd3bL4X61uUglgONMIvUOwgPgz4WwEZqdIwBjjvT/XLWKa', 'Street16', 'Boston', 'USA', '02115', NULL, 1, 1),
(1016, 'User17', 'User17', 'user17@gmail.com', '$2a$10$Xuu7M1NNd3bL4X61uUglgONMIvUOwgPgz4WwEZqdIwBjjvT/XLWKa', 'Street17', 'Boston', 'USA', '02115', NULL, 1, 1),
(1017, 'User18', 'User18', 'user18@gmail.com', '$2a$10$Xuu7M1NNd3bL4X61uUglgONMIvUOwgPgz4WwEZqdIwBjjvT/XLWKa', 'Street18', 'Boston', 'USA', '02115', NULL, 1, 1),
(1018, 'User19', 'User19', 'user19@gmail.com', '$2a$10$Xuu7M1NNd3bL4X61uUglgONMIvUOwgPgz4WwEZqdIwBjjvT/XLWKa', 'Street19', 'Boston', 'USA', '02115', NULL, 1, 1),
(1019, 'User20', 'User20', 'user20@gmail.com', '$2a$10$Xuu7M1NNd3bL4X61uUglgONMIvUOwgPgz4WwEZqdIwBjjvT/XLWKa', 'Street20', 'Boston', 'USA', '02115', NULL, 1, 1),
(1020, 'User21', 'User21', 'user21@gmail.com', '$2a$10$Xuu7M1NNd3bL4X61uUglgONMIvUOwgPgz4WwEZqdIwBjjvT/XLWKa', 'Street21', 'Boston', 'USA', '02115', NULL, 0, 1),
(1021, 'User22', 'User22', 'user22@gmail.com', '$2a$10$Xuu7M1NNd3bL4X61uUglgONMIvUOwgPgz4WwEZqdIwBjjvT/XLWKa', 'Street22', 'Boston', 'USA', '02115', NULL, 0, 1),
(1022, 'User23', 'User23', 'user23@gmail.com', '$2a$10$Xuu7M1NNd3bL4X61uUglgONMIvUOwgPgz4WwEZqdIwBjjvT/XLWKa', 'Street23', 'Boston', 'USA', '02115', NULL, 0, 1),
(1023, 'User24', 'User24', 'user24@gmail.com', '$2a$10$Xuu7M1NNd3bL4X61uUglgONMIvUOwgPgz4WwEZqdIwBjjvT/XLWKa', 'Street24', 'Boston', 'USA', '02115', NULL, 0, 1),
(1024, 'User25', 'User25', 'user25@gmail.com', '$2a$10$Xuu7M1NNd3bL4X61uUglgONMIvUOwgPgz4WwEZqdIwBjjvT/XLWKa', 'Street25', 'Boston', 'USA', '02115', NULL, 0, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Admin`
--
ALTER TABLE `Admin`
  ADD PRIMARY KEY (`AdminId`),
  ADD KEY `GrantorId` (`GrantorId`);

--
-- Indexes for table `CompletedMaterial`
--
ALTER TABLE `CompletedMaterial`
  ADD PRIMARY KEY (`CourseMaterialId`),
  ADD KEY `StudentId` (`StudentId`);

--
-- Indexes for table `Course`
--
ALTER TABLE `Course`
  ADD PRIMARY KEY (`CourseId`),
  ADD KEY `PrimaryTopicId` (`PrimaryTopicId`);

--
-- Indexes for table `CourseCreated`
--
ALTER TABLE `CourseCreated`
  ADD PRIMARY KEY (`FacultyId`,`CourseId`),
  ADD KEY `CourseId` (`CourseId`);

--
-- Indexes for table `CourseInterested`
--
ALTER TABLE `CourseInterested`
  ADD PRIMARY KEY (`StudentId`,`CourseId`),
  ADD KEY `CourseId` (`CourseId`);

--
-- Indexes for table `CourseMaterial`
--
ALTER TABLE `CourseMaterial`
  ADD PRIMARY KEY (`CourseMaterialId`),
  ADD UNIQUE KEY `CourseId` (`CourseId`,`Ordinal`);

--
-- Indexes for table `CourseMaterialQuestion`
--
ALTER TABLE `CourseMaterialQuestion`
  ADD PRIMARY KEY (`QuestionId`,`CourseMaterialId`),
  ADD KEY `CourseMaterialId` (`CourseMaterialId`);

--
-- Indexes for table `CourseQuestion`
--
ALTER TABLE `CourseQuestion`
  ADD PRIMARY KEY (`QuestionId`),
  ADD KEY `QuestionerId` (`QuestionerId`),
  ADD KEY `AnswererId` (`AnswererId`);

--
-- Indexes for table `CourseTaken`
--
ALTER TABLE `CourseTaken`
  ADD PRIMARY KEY (`StudentId`,`CourseId`),
  ADD KEY `CourseId` (`CourseId`);

--
-- Indexes for table `CourseTopic`
--
ALTER TABLE `CourseTopic`
  ADD PRIMARY KEY (`TopicId`);

--
-- Indexes for table `DownloadableFile`
--
ALTER TABLE `DownloadableFile`
  ADD PRIMARY KEY (`CourseMaterialId`);

--
-- Indexes for table `Faculty`
--
ALTER TABLE `Faculty`
  ADD PRIMARY KEY (`FacultyId`),
  ADD KEY `ValidatorId` (`ValidatorId`);

--
-- Indexes for table `LikedQuestion`
--
ALTER TABLE `LikedQuestion`
  ADD PRIMARY KEY (`QuestionId`,`StudentId`),
  ADD KEY `StudentId` (`StudentId`);

--
-- Indexes for table `Link`
--
ALTER TABLE `Link`
  ADD PRIMARY KEY (`CourseMaterialId`);

--
-- Indexes for table `Phone`
--
ALTER TABLE `Phone`
  ADD PRIMARY KEY (`UserId`,`PhoneNumber`);

--
-- Indexes for table `Post`
--
ALTER TABLE `Post`
  ADD PRIMARY KEY (`CourseMaterialId`);

--
-- Indexes for table `SecondaryTopic`
--
ALTER TABLE `SecondaryTopic`
  ADD PRIMARY KEY (`TopicId`,`CourseId`),
  ADD KEY `CourseId` (`CourseId`);

--
-- Indexes for table `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`UserId`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Course`
--
ALTER TABLE `Course`
  MODIFY `CourseId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5010;
--
-- AUTO_INCREMENT for table `CourseMaterial`
--
ALTER TABLE `CourseMaterial`
  MODIFY `CourseMaterialId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `CourseQuestion`
--
ALTER TABLE `CourseQuestion`
  MODIFY `QuestionId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `CourseTopic`
--
ALTER TABLE `CourseTopic`
  MODIFY `TopicId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `User`
--
ALTER TABLE `User`
  MODIFY `UserId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1025;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `Admin`
--
ALTER TABLE `Admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`AdminId`) REFERENCES `User` (`UserId`),
  ADD CONSTRAINT `admin_ibfk_2` FOREIGN KEY (`GrantorId`) REFERENCES `User` (`UserId`);

--
-- Constraints for table `CompletedMaterial`
--
ALTER TABLE `CompletedMaterial`
  ADD CONSTRAINT `completedmaterial_ibfk_1` FOREIGN KEY (`CourseMaterialId`) REFERENCES `CourseMaterial` (`CourseMaterialId`),
  ADD CONSTRAINT `completedmaterial_ibfk_2` FOREIGN KEY (`StudentId`) REFERENCES `User` (`UserId`);

--
-- Constraints for table `Course`
--
ALTER TABLE `Course`
  ADD CONSTRAINT `course_ibfk_1` FOREIGN KEY (`PrimaryTopicId`) REFERENCES `CourseTopic` (`TopicId`);

--
-- Constraints for table `CourseCreated`
--
ALTER TABLE `CourseCreated`
  ADD CONSTRAINT `coursecreated_ibfk_1` FOREIGN KEY (`FacultyId`) REFERENCES `Faculty` (`FacultyId`),
  ADD CONSTRAINT `coursecreated_ibfk_2` FOREIGN KEY (`CourseId`) REFERENCES `Course` (`CourseId`);

--
-- Constraints for table `CourseInterested`
--
ALTER TABLE `CourseInterested`
  ADD CONSTRAINT `courseinterested_ibfk_1` FOREIGN KEY (`StudentId`) REFERENCES `User` (`UserId`),
  ADD CONSTRAINT `courseinterested_ibfk_2` FOREIGN KEY (`CourseId`) REFERENCES `Course` (`CourseId`);

--
-- Constraints for table `CourseMaterial`
--
ALTER TABLE `CourseMaterial`
  ADD CONSTRAINT `coursematerial_ibfk_1` FOREIGN KEY (`CourseId`) REFERENCES `Course` (`CourseId`);

--
-- Constraints for table `CourseMaterialQuestion`
--
ALTER TABLE `CourseMaterialQuestion`
  ADD CONSTRAINT `coursematerialquestion_ibfk_1` FOREIGN KEY (`QuestionId`) REFERENCES `CourseQuestion` (`QuestionId`),
  ADD CONSTRAINT `coursematerialquestion_ibfk_2` FOREIGN KEY (`CourseMaterialId`) REFERENCES `CourseMaterial` (`CourseMaterialId`);

--
-- Constraints for table `CourseQuestion`
--
ALTER TABLE `CourseQuestion`
  ADD CONSTRAINT `coursequestion_ibfk_1` FOREIGN KEY (`QuestionerId`) REFERENCES `User` (`UserId`),
  ADD CONSTRAINT `coursequestion_ibfk_2` FOREIGN KEY (`AnswererId`) REFERENCES `Faculty` (`FacultyId`);

--
-- Constraints for table `CourseTaken`
--
ALTER TABLE `CourseTaken`
  ADD CONSTRAINT `coursetaken_ibfk_1` FOREIGN KEY (`StudentId`) REFERENCES `User` (`UserId`),
  ADD CONSTRAINT `coursetaken_ibfk_2` FOREIGN KEY (`CourseId`) REFERENCES `Course` (`CourseId`);

--
-- Constraints for table `DownloadableFile`
--
ALTER TABLE `DownloadableFile`
  ADD CONSTRAINT `downloadablefile_ibfk_1` FOREIGN KEY (`CourseMaterialId`) REFERENCES `CourseMaterial` (`CourseMaterialId`);

--
-- Constraints for table `Faculty`
--
ALTER TABLE `Faculty`
  ADD CONSTRAINT `faculty_ibfk_1` FOREIGN KEY (`FacultyId`) REFERENCES `User` (`UserId`),
  ADD CONSTRAINT `faculty_ibfk_2` FOREIGN KEY (`ValidatorId`) REFERENCES `User` (`UserId`);

--
-- Constraints for table `LikedQuestion`
--
ALTER TABLE `LikedQuestion`
  ADD CONSTRAINT `likedquestion_ibfk_1` FOREIGN KEY (`QuestionId`) REFERENCES `CourseQuestion` (`QuestionId`),
  ADD CONSTRAINT `likedquestion_ibfk_2` FOREIGN KEY (`StudentId`) REFERENCES `User` (`UserId`);

--
-- Constraints for table `Link`
--
ALTER TABLE `Link`
  ADD CONSTRAINT `link_ibfk_1` FOREIGN KEY (`CourseMaterialId`) REFERENCES `CourseMaterial` (`CourseMaterialId`);

--
-- Constraints for table `Phone`
--
ALTER TABLE `Phone`
  ADD CONSTRAINT `phone_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `User` (`UserId`);

--
-- Constraints for table `Post`
--
ALTER TABLE `Post`
  ADD CONSTRAINT `post_ibfk_1` FOREIGN KEY (`CourseMaterialId`) REFERENCES `CourseMaterial` (`CourseMaterialId`);

--
-- Constraints for table `SecondaryTopic`
--
ALTER TABLE `SecondaryTopic`
  ADD CONSTRAINT `secondarytopic_ibfk_1` FOREIGN KEY (`TopicId`) REFERENCES `CourseTopic` (`TopicId`),
  ADD CONSTRAINT `secondarytopic_ibfk_2` FOREIGN KEY (`CourseId`) REFERENCES `Course` (`CourseId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
