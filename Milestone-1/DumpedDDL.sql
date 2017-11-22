-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: us-cdbr-iron-east-05.cleardb.net    Database: heroku_37b5887ecf792b6
-- ------------------------------------------------------
-- Server version	5.6.36-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `completedmaterial`
--

DROP TABLE IF EXISTS `completedmaterial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `completedmaterial` (
  `CourseId` int(11) NOT NULL DEFAULT '0',
  `OrderId` int(11) NOT NULL DEFAULT '0',
  `StudentId` int(11) NOT NULL DEFAULT '0',
  `Timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`CourseId`,`OrderId`,`StudentId`),
  KEY `StudentId` (`StudentId`),
  CONSTRAINT `completedmaterial_ibfk_1` FOREIGN KEY (`CourseId`, `OrderId`) REFERENCES `coursematerial` (`CourseId`, `OrderId`),
  CONSTRAINT `completedmaterial_ibfk_2` FOREIGN KEY (`StudentId`) REFERENCES `user` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `completedmaterial`
--

LOCK TABLES `completedmaterial` WRITE;
/*!40000 ALTER TABLE `completedmaterial` DISABLE KEYS */;
/*!40000 ALTER TABLE `completedmaterial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `CourseId` int(11) NOT NULL,
  `Description` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `Name` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `PrimaryTopicId` int(11) DEFAULT NULL,
  `Icon` longblob,
  `Cost` int(11) DEFAULT NULL,
  PRIMARY KEY (`CourseId`),
  KEY `PrimaryTopicId` (`PrimaryTopicId`),
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`PrimaryTopicId`) REFERENCES `coursetopic` (`TopicId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coursecompleted`
--

DROP TABLE IF EXISTS `coursecompleted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coursecompleted` (
  `StudentId` int(11) NOT NULL DEFAULT '0',
  `CourseId` int(11) NOT NULL DEFAULT '0',
  `Rating` enum('1','2','3','4','5') COLLATE latin1_general_ci DEFAULT NULL,
  `Timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`StudentId`,`CourseId`),
  KEY `CourseId` (`CourseId`),
  CONSTRAINT `coursecompleted_ibfk_1` FOREIGN KEY (`StudentId`) REFERENCES `user` (`UserId`),
  CONSTRAINT `coursecompleted_ibfk_2` FOREIGN KEY (`CourseId`) REFERENCES `course` (`CourseId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coursecompleted`
--

LOCK TABLES `coursecompleted` WRITE;
/*!40000 ALTER TABLE `coursecompleted` DISABLE KEYS */;
/*!40000 ALTER TABLE `coursecompleted` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coursecreated`
--

DROP TABLE IF EXISTS `coursecreated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coursecreated` (
  `FacultyId` int(11) NOT NULL DEFAULT '0',
  `CourseId` int(11) NOT NULL DEFAULT '0',
  `Timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`FacultyId`,`CourseId`),
  KEY `CourseId` (`CourseId`),
  CONSTRAINT `coursecreated_ibfk_1` FOREIGN KEY (`FacultyId`) REFERENCES `user` (`UserId`),
  CONSTRAINT `coursecreated_ibfk_2` FOREIGN KEY (`CourseId`) REFERENCES `course` (`CourseId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coursecreated`
--

LOCK TABLES `coursecreated` WRITE;
/*!40000 ALTER TABLE `coursecreated` DISABLE KEYS */;
/*!40000 ALTER TABLE `coursecreated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courseenrolled`
--

DROP TABLE IF EXISTS `courseenrolled`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courseenrolled` (
  `ConfirmationCode` int(11) DEFAULT NULL,
  `PaymentTimestamp` datetime DEFAULT NULL,
  `StudentId` int(11) NOT NULL DEFAULT '0',
  `CourseId` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`StudentId`,`CourseId`),
  KEY `CourseId` (`CourseId`),
  CONSTRAINT `courseenrolled_ibfk_1` FOREIGN KEY (`StudentId`) REFERENCES `user` (`UserId`),
  CONSTRAINT `courseenrolled_ibfk_2` FOREIGN KEY (`CourseId`) REFERENCES `course` (`CourseId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courseenrolled`
--

LOCK TABLES `courseenrolled` WRITE;
/*!40000 ALTER TABLE `courseenrolled` DISABLE KEYS */;
/*!40000 ALTER TABLE `courseenrolled` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courseinterested`
--

DROP TABLE IF EXISTS `courseinterested`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courseinterested` (
  `StudentId` int(11) NOT NULL DEFAULT '0',
  `CourseId` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`StudentId`,`CourseId`),
  KEY `CourseId` (`CourseId`),
  CONSTRAINT `courseinterested_ibfk_1` FOREIGN KEY (`StudentId`) REFERENCES `user` (`UserId`),
  CONSTRAINT `courseinterested_ibfk_2` FOREIGN KEY (`CourseId`) REFERENCES `course` (`CourseId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courseinterested`
--

LOCK TABLES `courseinterested` WRITE;
/*!40000 ALTER TABLE `courseinterested` DISABLE KEYS */;
/*!40000 ALTER TABLE `courseinterested` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coursematerial`
--

DROP TABLE IF EXISTS `coursematerial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coursematerial` (
  `CourseId` int(11) NOT NULL,
  `OrderId` int(11) NOT NULL,
  `Name` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `Type` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`CourseId`,`OrderId`),
  CONSTRAINT `coursematerial_ibfk_1` FOREIGN KEY (`CourseId`) REFERENCES `course` (`CourseId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coursematerial`
--

LOCK TABLES `coursematerial` WRITE;
/*!40000 ALTER TABLE `coursematerial` DISABLE KEYS */;
/*!40000 ALTER TABLE `coursematerial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coursematerialquestion`
--

DROP TABLE IF EXISTS `coursematerialquestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coursematerialquestion` (
  `QuestionId` int(11) NOT NULL,
  `CourseId` int(11) NOT NULL,
  `OrderId` int(11) NOT NULL,
  PRIMARY KEY (`QuestionId`,`CourseId`,`OrderId`),
  KEY `CourseId` (`CourseId`,`OrderId`),
  CONSTRAINT `coursematerialquestion_ibfk_1` FOREIGN KEY (`QuestionId`) REFERENCES `coursequestion` (`QuestionId`),
  CONSTRAINT `coursematerialquestion_ibfk_2` FOREIGN KEY (`CourseId`, `OrderId`) REFERENCES `coursematerial` (`CourseId`, `OrderId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coursematerialquestion`
--

LOCK TABLES `coursematerialquestion` WRITE;
/*!40000 ALTER TABLE `coursematerialquestion` DISABLE KEYS */;
/*!40000 ALTER TABLE `coursematerialquestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coursequestion`
--

DROP TABLE IF EXISTS `coursequestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coursequestion` (
  `QuestionId` int(11) NOT NULL,
  `QuestionerId` int(11) DEFAULT NULL,
  `Question` text COLLATE latin1_general_ci,
  `Answer` text COLLATE latin1_general_ci,
  `AnswererId` int(11) DEFAULT NULL,
  `PublicFlag` tinyint(1) NOT NULL,
  `CourseId` int(11) DEFAULT NULL,
  PRIMARY KEY (`QuestionId`),
  KEY `QuestionerId` (`QuestionerId`),
  KEY `AnswererId` (`AnswererId`),
  CONSTRAINT `coursequestion_ibfk_1` FOREIGN KEY (`QuestionerId`) REFERENCES `user` (`UserId`),
  CONSTRAINT `coursequestion_ibfk_2` FOREIGN KEY (`AnswererId`) REFERENCES `user` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coursequestion`
--

LOCK TABLES `coursequestion` WRITE;
/*!40000 ALTER TABLE `coursequestion` DISABLE KEYS */;
/*!40000 ALTER TABLE `coursequestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coursetopic`
--

DROP TABLE IF EXISTS `coursetopic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coursetopic` (
  `TopicId` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(40) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`TopicId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coursetopic`
--

LOCK TABLES `coursetopic` WRITE;
/*!40000 ALTER TABLE `coursetopic` DISABLE KEYS */;
/*!40000 ALTER TABLE `coursetopic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `downloadablefile`
--

DROP TABLE IF EXISTS `downloadablefile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `downloadablefile` (
  `CourseId` int(11) NOT NULL DEFAULT '0',
  `OrderId` int(11) NOT NULL DEFAULT '0',
  `Path` varchar(60) COLLATE latin1_general_ci DEFAULT NULL,
  `Size` double unsigned DEFAULT NULL,
  `Type` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`CourseId`,`OrderId`),
  CONSTRAINT `downloadablefile_ibfk_1` FOREIGN KEY (`CourseId`, `OrderId`) REFERENCES `coursematerial` (`CourseId`, `OrderId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `downloadablefile`
--

LOCK TABLES `downloadablefile` WRITE;
/*!40000 ALTER TABLE `downloadablefile` DISABLE KEYS */;
/*!40000 ALTER TABLE `downloadablefile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likedquestion`
--

DROP TABLE IF EXISTS `likedquestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `likedquestion` (
  `QuestionId` int(11) NOT NULL,
  `StudentId` int(11) NOT NULL,
  PRIMARY KEY (`QuestionId`,`StudentId`),
  KEY `StudentId` (`StudentId`),
  CONSTRAINT `likedquestion_ibfk_1` FOREIGN KEY (`QuestionId`) REFERENCES `coursequestion` (`QuestionId`),
  CONSTRAINT `likedquestion_ibfk_2` FOREIGN KEY (`StudentId`) REFERENCES `user` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likedquestion`
--

LOCK TABLES `likedquestion` WRITE;
/*!40000 ALTER TABLE `likedquestion` DISABLE KEYS */;
/*!40000 ALTER TABLE `likedquestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `link`
--

DROP TABLE IF EXISTS `link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `link` (
  `CourseId` int(11) NOT NULL DEFAULT '0',
  `OrderId` int(11) NOT NULL DEFAULT '0',
  `Url` varchar(60) COLLATE latin1_general_ci DEFAULT NULL,
  `VideoFlag` tinyint(1) NOT NULL,
  PRIMARY KEY (`CourseId`,`OrderId`),
  CONSTRAINT `link_ibfk_1` FOREIGN KEY (`CourseId`, `OrderId`) REFERENCES `coursematerial` (`CourseId`, `OrderId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `link`
--

LOCK TABLES `link` WRITE;
/*!40000 ALTER TABLE `link` DISABLE KEYS */;
/*!40000 ALTER TABLE `link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phone`
--

DROP TABLE IF EXISTS `phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phone` (
  `UserId` int(11) NOT NULL DEFAULT '0',
  `PhoneNumber` varchar(10) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`UserId`,`PhoneNumber`),
  CONSTRAINT `phone_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `user` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phone`
--

LOCK TABLES `phone` WRITE;
/*!40000 ALTER TABLE `phone` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `CourseId` int(11) NOT NULL DEFAULT '0',
  `OrderId` int(11) NOT NULL DEFAULT '0',
  `Content` text COLLATE latin1_general_ci,
  PRIMARY KEY (`CourseId`,`OrderId`),
  CONSTRAINT `post_ibfk_1` FOREIGN KEY (`CourseId`, `OrderId`) REFERENCES `coursematerial` (`CourseId`, `OrderId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `secondarytopic`
--

DROP TABLE IF EXISTS `secondarytopic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `secondarytopic` (
  `TopicId` int(11) NOT NULL DEFAULT '0',
  `CourseId` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`TopicId`,`CourseId`),
  KEY `CourseId` (`CourseId`),
  CONSTRAINT `secondarytopic_ibfk_1` FOREIGN KEY (`TopicId`) REFERENCES `coursetopic` (`TopicId`),
  CONSTRAINT `secondarytopic_ibfk_2` FOREIGN KEY (`CourseId`) REFERENCES `course` (`CourseId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `secondarytopic`
--

LOCK TABLES `secondarytopic` WRITE;
/*!40000 ALTER TABLE `secondarytopic` DISABLE KEYS */;
/*!40000 ALTER TABLE `secondarytopic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `UserId` int(11) NOT NULL,
  `FirstName` varchar(40) COLLATE latin1_general_ci NOT NULL,
  `LastName` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `Email` varchar(80) COLLATE latin1_general_ci DEFAULT NULL,
  `Password` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `Street` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `City` varchar(40) COLLATE latin1_general_ci DEFAULT NULL,
  `Country` varchar(40) COLLATE latin1_general_ci DEFAULT NULL,
  `PostalCode` varchar(10) COLLATE latin1_general_ci DEFAULT NULL,
  `ProfilePic` longblob,
  `FacultyFlag` tinyint(1) NOT NULL DEFAULT '0',
  `Title` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `Affiliation` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `WorkWebsite` varchar(200) COLLATE latin1_general_ci DEFAULT NULL,
  `AdminFlag` tinyint(1) NOT NULL DEFAULT '0',
  `ValidationStatus` tinyint(1) DEFAULT NULL,
  `FacultyTimestamp` datetime DEFAULT NULL,
  `ValidatorId` int(11) DEFAULT NULL,
  `AdminTimestamp` datetime DEFAULT NULL,
  `GrantorId` int(11) DEFAULT NULL,
  PRIMARY KEY (`UserId`),
  UNIQUE KEY `Email` (`Email`),
  KEY `GrantorId` (`GrantorId`),
  KEY `ValidatorId` (`ValidatorId`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`GrantorId`) REFERENCES `user` (`UserId`),
  CONSTRAINT `user_ibfk_2` FOREIGN KEY (`ValidatorId`) REFERENCES `user` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-13 12:38:04
