-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: trainlyio
-- ------------------------------------------------------
-- Server version	5.7.20-log

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `AdminId` int(11) NOT NULL,
  `AdminTimestamp` datetime DEFAULT NULL,
  `GrantorId` int(11) DEFAULT NULL,
  PRIMARY KEY (`AdminId`),
  KEY `GrantorId` (`GrantorId`),
  CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`AdminId`) REFERENCES `user` (`UserId`),
  CONSTRAINT `admin_ibfk_2` FOREIGN KEY (`GrantorId`) REFERENCES `user` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1151,'2017-11-23 21:14:10',NULL),(1161,'2017-11-23 21:14:10',1151),(1171,'2017-11-23 21:14:10',1151),(1181,'2017-11-23 21:14:10',1151),(1191,'2017-11-23 21:14:10',1151),(1201,'2017-11-23 21:14:10',1151),(1211,'2017-11-23 21:14:10',1151),(1221,'2017-11-23 21:14:10',1151),(1231,'2017-11-23 21:14:10',1151),(1241,'2017-11-23 21:14:10',1151);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `completedmaterial`
--

DROP TABLE IF EXISTS `completedmaterial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `completedmaterial` (
  `CourseMaterialId` int(11) NOT NULL,
  `StudentId` int(11) DEFAULT NULL,
  `Timestamp` datetime NOT NULL,
  PRIMARY KEY (`CourseMaterialId`),
  KEY `StudentId` (`StudentId`),
  CONSTRAINT `completedmaterial_ibfk_1` FOREIGN KEY (`CourseMaterialId`) REFERENCES `coursematerial` (`CourseMaterialId`),
  CONSTRAINT `completedmaterial_ibfk_2` FOREIGN KEY (`StudentId`) REFERENCES `user` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `completedmaterial`
--

LOCK TABLES `completedmaterial` WRITE;
/*!40000 ALTER TABLE `completedmaterial` DISABLE KEYS */;
INSERT INTO `completedmaterial` VALUES (1,1001,'2013-08-05 18:19:03'),(11,1001,'2013-08-05 18:19:03'),(21,1001,'2013-08-05 18:19:03'),(31,1001,'2013-08-05 18:19:03'),(41,1001,'2013-08-05 18:19:03'),(51,1001,'2013-08-05 18:19:03'),(61,1001,'2013-08-05 18:19:03'),(71,1001,'2013-08-05 18:19:03'),(81,1001,'2013-08-05 18:19:03'),(91,1001,'2013-08-05 18:19:03');
/*!40000 ALTER TABLE `completedmaterial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `CourseId` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `Name` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `PrimaryTopicId` int(11) NOT NULL,
  `Icon` longblob,
  `Cost` int(11) DEFAULT NULL,
  PRIMARY KEY (`CourseId`),
  KEY `PrimaryTopicId` (`PrimaryTopicId`),
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`PrimaryTopicId`) REFERENCES `coursetopic` (`TopicId`)
) ENGINE=InnoDB AUTO_INCREMENT=5110 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (5001,'course1','course1',1,NULL,1500),(5011,'course2','course2',2,NULL,1500),(5021,'course3','course3',3,NULL,1500),(5031,'course4','course4',4,NULL,1500),(5041,'course5','course5',5,NULL,1500),(5051,'course6','course7',6,NULL,1500),(5061,'course7','course7',7,NULL,1500),(5071,'course8','course8',8,NULL,1500),(5081,'course9','course9',9,NULL,1500),(5091,'course10','course10',10,NULL,1500),(5101,NULL,'Course1-zc',1,NULL,507),(5102,NULL,'Course2-zc',1,NULL,1427),(5103,NULL,'Course3-zc',1,NULL,1397),(5104,NULL,'Course4-zc',1,NULL,1306),(5105,NULL,'Course5-zc',1,NULL,1246),(5106,NULL,'Course6-zc',1,NULL,1500),(5107,NULL,'Course7-zc',1,NULL,542),(5108,NULL,'Course8-zc',1,NULL,510),(5109,NULL,'Course9-zc',1,NULL,1218);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
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
  `Timestamp` datetime NOT NULL,
  PRIMARY KEY (`FacultyId`,`CourseId`),
  KEY `CourseId` (`CourseId`),
  CONSTRAINT `coursecreated_ibfk_1` FOREIGN KEY (`FacultyId`) REFERENCES `faculty` (`FacultyId`),
  CONSTRAINT `coursecreated_ibfk_2` FOREIGN KEY (`CourseId`) REFERENCES `course` (`CourseId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coursecreated`
--

LOCK TABLES `coursecreated` WRITE;
/*!40000 ALTER TABLE `coursecreated` DISABLE KEYS */;
INSERT INTO `coursecreated` VALUES (1101,5001,'2013-08-05 18:19:03'),(1101,5011,'2013-08-05 18:19:03'),(1101,5021,'2013-08-05 18:19:03'),(1101,5031,'2013-08-05 18:19:03'),(1101,5041,'2013-08-05 18:19:03'),(1101,5051,'2013-08-05 18:19:03'),(1101,5061,'2013-08-05 18:19:03'),(1101,5071,'2013-08-05 18:19:03'),(1101,5081,'2013-08-05 18:19:03'),(1101,5091,'2013-08-05 18:19:03'),(1253,5101,'2017-11-26 23:18:02'),(1253,5102,'2017-11-26 23:18:02'),(1253,5103,'2017-11-26 23:18:02'),(1253,5104,'2017-11-26 23:18:02'),(1253,5105,'2017-11-26 23:18:02'),(1253,5106,'2017-11-26 23:18:02'),(1256,5101,'2017-11-27 00:06:23'),(1257,5101,'2017-11-27 00:06:23'),(1261,5107,'2017-11-27 00:20:10'),(1261,5108,'2017-11-27 00:20:10'),(1261,5109,'2017-11-27 00:20:10');
/*!40000 ALTER TABLE `coursecreated` ENABLE KEYS */;
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
INSERT INTO `courseinterested` VALUES (1001,5001),(1011,5001),(1041,5001),(1021,5021),(1061,5021),(1031,5031),(1051,5051),(1091,5061),(1071,5091),(1081,5091),(1251,5106);
/*!40000 ALTER TABLE `courseinterested` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coursematerial`
--

DROP TABLE IF EXISTS `coursematerial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coursematerial` (
  `CourseMaterialId` int(11) NOT NULL AUTO_INCREMENT,
  `CourseId` int(11) NOT NULL,
  `Ordinal` int(11) NOT NULL,
  `Name` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `Type` varchar(20) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`CourseMaterialId`),
  UNIQUE KEY `CourseId` (`CourseId`,`Ordinal`),
  CONSTRAINT `coursematerial_ibfk_1` FOREIGN KEY (`CourseId`) REFERENCES `course` (`CourseId`)
) ENGINE=InnoDB AUTO_INCREMENT=292 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coursematerial`
--

LOCK TABLES `coursematerial` WRITE;
/*!40000 ALTER TABLE `coursematerial` DISABLE KEYS */;
INSERT INTO `coursematerial` VALUES (1,5001,1,'Material1','Post'),(11,5011,1,'Material1','Post'),(21,5021,1,'Material1','Post'),(31,5031,1,'Material1','Post'),(41,5041,1,'Material1','Post'),(51,5051,1,'Material1','Post'),(61,5061,1,'Material1','Post'),(71,5071,1,'Material1','Post'),(81,5081,1,'Material1','Post'),(91,5091,1,'Material1','Post'),(101,5001,2,'Material2','Link'),(111,5011,2,'Material2','Link'),(121,5021,2,'Material2','Link'),(131,5031,2,'Material2','Link'),(141,5041,2,'Material2','Link'),(151,5051,2,'Material2','Link'),(161,5061,2,'Material2','Link'),(171,5071,2,'Material2','Link'),(181,5081,2,'Material2','Link'),(191,5091,2,'Material2','Link'),(201,5001,3,'Material3','DownloadableFile'),(211,5011,3,'Material3','DownloadableFile'),(221,5021,3,'Material3','DownloadableFile'),(231,5031,3,'Material3','DownloadableFile'),(241,5041,3,'Material3','DownloadableFile'),(251,5051,3,'Material3','DownloadableFile'),(261,5061,3,'Material3','DownloadableFile'),(271,5071,3,'Material3','DownloadableFile'),(281,5081,3,'Material3','DownloadableFile'),(291,5091,3,'Material3','DownloadableFile');
/*!40000 ALTER TABLE `coursematerial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coursematerialquestion`
--

DROP TABLE IF EXISTS `coursematerialquestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coursematerialquestion` (
  `QuestionId` int(11) NOT NULL DEFAULT '0',
  `CourseMaterialId` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`QuestionId`,`CourseMaterialId`),
  KEY `CourseMaterialId` (`CourseMaterialId`),
  CONSTRAINT `coursematerialquestion_ibfk_1` FOREIGN KEY (`QuestionId`) REFERENCES `coursequestion` (`QuestionId`),
  CONSTRAINT `coursematerialquestion_ibfk_2` FOREIGN KEY (`CourseMaterialId`) REFERENCES `coursematerial` (`CourseMaterialId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coursematerialquestion`
--

LOCK TABLES `coursematerialquestion` WRITE;
/*!40000 ALTER TABLE `coursematerialquestion` DISABLE KEYS */;
INSERT INTO `coursematerialquestion` VALUES (1,1),(11,1),(21,1),(31,1),(41,1),(51,1),(61,1),(71,1),(81,1),(91,1);
/*!40000 ALTER TABLE `coursematerialquestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coursequestion`
--

DROP TABLE IF EXISTS `coursequestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coursequestion` (
  `QuestionId` int(11) NOT NULL AUTO_INCREMENT,
  `QuestionerId` int(11) NOT NULL,
  `Question` text COLLATE latin1_general_ci,
  `Answer` text COLLATE latin1_general_ci,
  `AnswererId` int(11) DEFAULT NULL,
  `PublicFlag` tinyint(1) NOT NULL,
  `CourseId` int(11) NOT NULL,
  PRIMARY KEY (`QuestionId`),
  KEY `QuestionerId` (`QuestionerId`),
  KEY `AnswererId` (`AnswererId`),
  CONSTRAINT `coursequestion_ibfk_1` FOREIGN KEY (`QuestionerId`) REFERENCES `user` (`UserId`),
  CONSTRAINT `coursequestion_ibfk_2` FOREIGN KEY (`AnswererId`) REFERENCES `faculty` (`FacultyId`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coursequestion`
--

LOCK TABLES `coursequestion` WRITE;
/*!40000 ALTER TABLE `coursequestion` DISABLE KEYS */;
INSERT INTO `coursequestion` VALUES (1,1001,'Question1','Answer1',1101,1,5001),(11,1001,'Question1','Answer1',1101,1,5001),(21,1001,'Question1','Answer1',1101,1,5001),(31,1001,'Question1','Answer1',1101,1,5001),(41,1001,'Question1','Answer1',1101,1,5001),(51,1001,'Question1','Answer1',1101,1,5001),(61,1001,'Question1','Answer1',1101,1,5001),(71,1001,'Question1','Answer1',1101,1,5001),(81,1001,'Question1','Answer1',1101,1,5001),(91,1001,'Question1','Answer1',1101,1,5001),(101,1251,'question','answer',1253,1,5101),(102,1251,'question','answer',1253,1,5101),(103,1251,'question','answer',1253,1,5101),(104,1251,'question','answer',1253,1,5101),(105,1251,'question','answer',1256,1,5101);
/*!40000 ALTER TABLE `coursequestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coursetaken`
--

DROP TABLE IF EXISTS `coursetaken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coursetaken` (
  `StudentId` int(11) NOT NULL DEFAULT '0',
  `CourseId` int(11) NOT NULL DEFAULT '0',
  `Rating` enum('1','2','3','4','5') COLLATE latin1_general_ci DEFAULT NULL,
  `CompletedTimestamp` datetime DEFAULT NULL,
  `Comment` text COLLATE latin1_general_ci,
  `ConfirmationCode` int(11) DEFAULT NULL,
  `PaymentTimestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`StudentId`,`CourseId`),
  KEY `CourseId` (`CourseId`),
  CONSTRAINT `coursetaken_ibfk_1` FOREIGN KEY (`StudentId`) REFERENCES `user` (`UserId`),
  CONSTRAINT `coursetaken_ibfk_2` FOREIGN KEY (`CourseId`) REFERENCES `course` (`CourseId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coursetaken`
--

LOCK TABLES `coursetaken` WRITE;
/*!40000 ALTER TABLE `coursetaken` DISABLE KEYS */;
INSERT INTO `coursetaken` VALUES (1001,5001,'1','2013-08-05 18:19:03','Good',1000,'2013-08-05 18:19:03'),(1001,5021,'1','2013-08-05 18:19:03','Good',3000,'2013-08-05 18:19:03'),(1001,5031,'1','2013-08-05 18:19:03','Good',4000,'2013-08-05 18:19:03'),(1001,5041,'1','2013-08-05 18:19:03','Good',5000,'2013-08-05 18:19:03'),(1001,5051,'1','2013-08-05 18:19:03','Good',6000,'2013-08-05 18:19:03'),(1001,5061,'1','2013-08-05 18:19:03','Good',7000,'2013-08-05 18:19:03'),(1001,5071,'1','2013-08-05 18:19:03','Good',8000,'2013-08-05 18:19:03'),(1001,5081,'1','2013-08-05 18:19:03','Good',9000,'2013-08-05 18:19:03'),(1001,5091,'1','2013-08-05 18:19:03','Good',9001,'2013-08-05 18:19:03'),(1011,5001,'5','2013-08-05 18:19:03','Good',2000,'2013-08-05 18:19:03'),(1101,5101,NULL,NULL,NULL,NULL,NULL),(1251,5101,'5','2017-11-26 23:23:32',NULL,NULL,NULL),(1251,5102,'4','2017-11-26 23:23:32',NULL,NULL,NULL),(1251,5103,'2','2017-11-26 23:23:32',NULL,NULL,NULL),(1251,5104,NULL,NULL,NULL,NULL,NULL),(1251,5105,NULL,NULL,NULL,NULL,NULL),(1258,5101,'1','2017-11-27 00:29:50',NULL,NULL,NULL),(1258,5107,'1','2017-11-27 00:21:03',NULL,NULL,NULL),(1259,5101,'5','2017-11-27 00:29:50',NULL,NULL,NULL),(1259,5107,'5','2017-11-27 00:21:03',NULL,NULL,NULL),(1260,5107,'2','2017-11-27 00:21:03',NULL,NULL,NULL),(1262,5108,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `coursetaken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coursetopic`
--

DROP TABLE IF EXISTS `coursetopic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coursetopic` (
  `TopicId` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(40) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`TopicId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coursetopic`
--

LOCK TABLES `coursetopic` WRITE;
/*!40000 ALTER TABLE `coursetopic` DISABLE KEYS */;
INSERT INTO `coursetopic` VALUES (1,'Topic1'),(2,'Topic2'),(3,'Topic3'),(4,'Topic4'),(5,'Topic5'),(6,'Topic6'),(7,'Topic7'),(8,'Topic8'),(9,'Topic9'),(10,'Topic10');
/*!40000 ALTER TABLE `coursetopic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `downloadablefile`
--

DROP TABLE IF EXISTS `downloadablefile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `downloadablefile` (
  `CourseMaterialId` int(11) NOT NULL,
  `Path` varchar(60) COLLATE latin1_general_ci DEFAULT NULL,
  `Size` double unsigned DEFAULT NULL,
  `Type` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`CourseMaterialId`),
  CONSTRAINT `downloadablefile_ibfk_1` FOREIGN KEY (`CourseMaterialId`) REFERENCES `coursematerial` (`CourseMaterialId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `downloadablefile`
--

LOCK TABLES `downloadablefile` WRITE;
/*!40000 ALTER TABLE `downloadablefile` DISABLE KEYS */;
INSERT INTO `downloadablefile` VALUES (201,'http://5001+021+03',2,'MIME'),(211,'http://5002+022+03',1.3,'Null'),(221,'http://5003+023+03',4,'MIME'),(231,'http://5004+024+03',1.4,'MIME'),(241,'http://5005+025+03',0.5,'Null'),(251,'http://5006+026+03',2.5,'MIME'),(261,'http://5007+027+03',2.4,'MIME'),(271,'http://5008+028+03',3.2,'Null'),(281,'http://5009+029+03',2.1,'MIME'),(291,'http://5010+030+03',2,'Null');
/*!40000 ALTER TABLE `downloadablefile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faculty` (
  `FacultyId` int(11) NOT NULL,
  `Title` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `Affiliation` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `WorkWebsite` varchar(200) COLLATE latin1_general_ci DEFAULT NULL,
  `ValidationStatus` tinyint(1) DEFAULT NULL,
  `ValidatorId` int(11) DEFAULT NULL,
  `FacultyTimestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`FacultyId`),
  KEY `ValidatorId` (`ValidatorId`),
  CONSTRAINT `faculty_ibfk_1` FOREIGN KEY (`FacultyId`) REFERENCES `user` (`UserId`),
  CONSTRAINT `faculty_ibfk_2` FOREIGN KEY (`ValidatorId`) REFERENCES `user` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty`
--

LOCK TABLES `faculty` WRITE;
/*!40000 ALTER TABLE `faculty` DISABLE KEYS */;
INSERT INTO `faculty` VALUES (1101,'Title1','Organization1','www.organization1.com',1,NULL,'2017-11-26 01:30:29'),(1111,'Title1','Organization1','www.organization1.com',0,NULL,NULL),(1121,'Title1','Organization1','www.organization1.com',0,NULL,NULL),(1131,'Title1','Organization1','www.organization1.com',0,NULL,NULL),(1141,'Title1','Organization1','www.organization1.com',0,NULL,NULL),(1151,'Title2','Organization2','www.organization2.com',1,1201,'2017-11-23 21:17:13'),(1161,'Title2','Organization2','www.organization2.com',1,1211,'2017-11-23 21:17:13'),(1171,'Title2','Organization2','www.organization2.com',1,1221,'2017-11-23 21:17:13'),(1181,'Title2','Organization2','www.organization2.com',1,1231,'2017-11-23 21:17:13'),(1191,'Title2','Organization2','www.organization2.com',1,1241,'2017-11-23 21:17:13'),(1253,NULL,NULL,NULL,1,1151,'2017-11-26 23:08:43'),(1256,NULL,NULL,NULL,1,1151,'2017-11-26 23:54:04'),(1257,NULL,NULL,NULL,1,1151,'2017-11-26 23:54:04'),(1261,NULL,NULL,NULL,1,1151,'2017-11-27 00:18:39');
/*!40000 ALTER TABLE `faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likedquestion`
--

DROP TABLE IF EXISTS `likedquestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `likedquestion` (
  `QuestionId` int(11) NOT NULL DEFAULT '0',
  `StudentId` int(11) NOT NULL DEFAULT '0',
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
INSERT INTO `likedquestion` VALUES (1,1001),(11,1001),(21,1001),(31,1001),(41,1001),(51,1001),(61,1001),(71,1001),(81,1001),(91,1001);
/*!40000 ALTER TABLE `likedquestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `link`
--

DROP TABLE IF EXISTS `link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `link` (
  `CourseMaterialId` int(11) NOT NULL,
  `Url` varchar(60) COLLATE latin1_general_ci NOT NULL,
  `VideoFlag` tinyint(1) NOT NULL,
  PRIMARY KEY (`CourseMaterialId`),
  CONSTRAINT `link_ibfk_1` FOREIGN KEY (`CourseMaterialId`) REFERENCES `coursematerial` (`CourseMaterialId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `link`
--

LOCK TABLES `link` WRITE;
/*!40000 ALTER TABLE `link` DISABLE KEYS */;
INSERT INTO `link` VALUES (101,'http://5001+011+02',1),(111,'http://5001+012+02',0),(121,'http://5001+013+02',1),(131,'http://5001+014+02',1),(141,'http://5001+015+02',0),(151,'http://5001+016+02',0),(161,'http://5001+017+02',1),(171,'http://5001+018+02',0),(181,'http://5001+019+02',0),(191,'http://5001+020+02',1);
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
INSERT INTO `phone` VALUES (1001,'1234567890'),(1011,'1234567890'),(1021,'1234567890'),(1031,'1234567890'),(1041,'1234567890'),(1051,'1234567890'),(1061,'1234567890'),(1071,'1234567890'),(1081,'1234567890'),(1091,'1234567890');
/*!40000 ALTER TABLE `phone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `CourseMaterialId` int(11) NOT NULL,
  `Content` text COLLATE latin1_general_ci,
  PRIMARY KEY (`CourseMaterialId`),
  CONSTRAINT `post_ibfk_1` FOREIGN KEY (`CourseMaterialId`) REFERENCES `coursematerial` (`CourseMaterialId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,'Text01'),(11,'Text02'),(21,'Text03'),(31,'Text04'),(41,'Text05'),(51,'Text06'),(61,'Text07'),(71,'Text08'),(81,'Text09'),(91,'Text10');
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
INSERT INTO `secondarytopic` VALUES (1,5001),(6,5001),(10,5001),(2,5011),(3,5011),(5,5021),(7,5021),(4,5031),(8,5071),(9,5081),(2,5101),(3,5103),(4,5103),(8,5103),(9,5103),(7,5105);
/*!40000 ALTER TABLE `secondarytopic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `UserId` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(40) COLLATE latin1_general_ci NOT NULL,
  `LastName` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `Email` varchar(80) COLLATE latin1_general_ci DEFAULT NULL,
  `HashAndSalt` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `Street` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `City` varchar(40) COLLATE latin1_general_ci DEFAULT NULL,
  `Country` varchar(40) COLLATE latin1_general_ci DEFAULT NULL,
  `PostalCode` varchar(10) COLLATE latin1_general_ci DEFAULT NULL,
  `ProfilePic` longblob,
  `FacultyFlag` tinyint(1) NOT NULL DEFAULT '0',
  `AdminFlag` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`UserId`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=1263 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1001,'User1','User1','user1@gmail.com','$2a$10$NL8bDFTzYh845pEaMYbpC..kNdMTzgZMbyHQ10i2LDnuSV1WEhhPC','Street1','Boston','USA','02115',NULL,0,0),(1011,'User2','User2','user2@gmail.com','$2a$10$NL8bDFTzYh845pEaMYbpC..kNdMTzgZMbyHQ10i2LDnuSV1WEhhPC','Street2','Boston','USA','02115',NULL,0,0),(1021,'User3','User3','user3@gmail.com','$2a$10$NL8bDFTzYh845pEaMYbpC..kNdMTzgZMbyHQ10i2LDnuSV1WEhhPC','Street3','NYC','USA','02115',NULL,0,0),(1031,'User4','User4','user4@gmail.com','$2a$10$NL8bDFTzYh845pEaMYbpC..kNdMTzgZMbyHQ10i2LDnuSV1WEhhPC','Street4','NYC','USA','02115',NULL,0,0),(1041,'User5','User5','user5@gmail.com','$2a$10$NL8bDFTzYh845pEaMYbpC..kNdMTzgZMbyHQ10i2LDnuSV1WEhhPC','Street5','Dallas','USA','02115',NULL,0,0),(1051,'User6','User6','user6@gmail.com','$2a$10$NL8bDFTzYh845pEaMYbpC..kNdMTzgZMbyHQ10i2LDnuSV1WEhhPC','Street6','Dallas','USA','02115',NULL,0,0),(1061,'User7','User7','user7@gmail.com','$2a$10$NL8bDFTzYh845pEaMYbpC..kNdMTzgZMbyHQ10i2LDnuSV1WEhhPC','Street7','Seattle','USA','02115',NULL,0,0),(1071,'User8','User8','user8@gmail.com','$2a$10$NL8bDFTzYh845pEaMYbpC..kNdMTzgZMbyHQ10i2LDnuSV1WEhhPC','Street8','Seattle','USA','02115',NULL,0,0),(1081,'User9','User9','user9@gmail.com','$2a$10$NL8bDFTzYh845pEaMYbpC..kNdMTzgZMbyHQ10i2LDnuSV1WEhhPC','Street9','SanFrancisco','USA','02115',NULL,0,0),(1091,'User10','User10','user10@gmail.com','$2a$10$NL8bDFTzYh845pEaMYbpC..kNdMTzgZMbyHQ10i2LDnuSV1WEhhPC','Street10','SanFrancisco','USA','02115',NULL,0,0),(1101,'User11','User11','user11@gmail.com','$2a$10$NL8bDFTzYh845pEaMYbpC..kNdMTzgZMbyHQ10i2LDnuSV1WEhhPC','Street11','Boston','USA','02115',NULL,1,0),(1111,'User12','User12','user12@gmail.com','$2a$10$NL8bDFTzYh845pEaMYbpC..kNdMTzgZMbyHQ10i2LDnuSV1WEhhPC','Street12','Boston','USA','02115',NULL,1,0),(1121,'User13','User13','user13@gmail.com','$2a$10$NL8bDFTzYh845pEaMYbpC..kNdMTzgZMbyHQ10i2LDnuSV1WEhhPC','Street13','Boston','USA','02115',NULL,1,0),(1131,'User14','User14','user14@gmail.com','$2a$10$NL8bDFTzYh845pEaMYbpC..kNdMTzgZMbyHQ10i2LDnuSV1WEhhPC','Street14','Boston','USA','02115',NULL,1,0),(1141,'User15','User15','user15@gmail.com','$2a$10$NL8bDFTzYh845pEaMYbpC..kNdMTzgZMbyHQ10i2LDnuSV1WEhhPC','Street15','Boston','USA','02115',NULL,1,0),(1151,'User16','User16','user16@gmail.com','$2a$10$NL8bDFTzYh845pEaMYbpC..kNdMTzgZMbyHQ10i2LDnuSV1WEhhPC','Street16','Boston','USA','02115',NULL,1,1),(1161,'User17','User17','user17@gmail.com','$2a$10$NL8bDFTzYh845pEaMYbpC..kNdMTzgZMbyHQ10i2LDnuSV1WEhhPC','Street17','Boston','USA','02115',NULL,1,1),(1171,'User18','User18','user18@gmail.com','$2a$10$NL8bDFTzYh845pEaMYbpC..kNdMTzgZMbyHQ10i2LDnuSV1WEhhPC','Street18','Boston','USA','02115',NULL,1,1),(1181,'User19','User19','user19@gmail.com','$2a$10$NL8bDFTzYh845pEaMYbpC..kNdMTzgZMbyHQ10i2LDnuSV1WEhhPC','Street19','Boston','USA','02115',NULL,1,1),(1191,'User20','User20','user20@gmail.com','$2a$10$NL8bDFTzYh845pEaMYbpC..kNdMTzgZMbyHQ10i2LDnuSV1WEhhPC','Street20','Boston','USA','02115',NULL,1,1),(1201,'User21','User21','user21@gmail.com','$2a$10$NL8bDFTzYh845pEaMYbpC..kNdMTzgZMbyHQ10i2LDnuSV1WEhhPC','Street21','Boston','USA','02115',NULL,0,1),(1211,'User22','User22','user22@gmail.com','$2a$10$NL8bDFTzYh845pEaMYbpC..kNdMTzgZMbyHQ10i2LDnuSV1WEhhPC','Street22','Boston','USA','02115',NULL,0,1),(1221,'User23','User23','user23@gmail.com','$2a$10$NL8bDFTzYh845pEaMYbpC..kNdMTzgZMbyHQ10i2LDnuSV1WEhhPC','Street23','Boston','USA','02115',NULL,0,1),(1231,'User24','User24','user24@gmail.com','$2a$10$NL8bDFTzYh845pEaMYbpC..kNdMTzgZMbyHQ10i2LDnuSV1WEhhPC','Street24','Boston','USA','02115',NULL,0,1),(1241,'User25','User25','user25@gmail.com','$2a$10$NL8bDFTzYh845pEaMYbpC..kNdMTzgZMbyHQ10i2LDnuSV1WEhhPC','Street25','Boston','USA','02115',NULL,0,1),(1251,'Student1-zc','Student1-zc','Student1-zc@group17.com','$2a$10$NL8bDFTzYh845pEaMYbpC..kNdMTzgZMbyHQ10i2LDnuSV1WEhhPC',NULL,NULL,NULL,NULL,NULL,0,0),(1253,'Faculty1-zc','Faculty1-zc','Faculty1-zc@group17.com','$2a$10$NL8bDFTzYh845pEaMYbpC..kNdMTzgZMbyHQ10i2LDnuSV1WEhhPC',NULL,NULL,NULL,NULL,NULL,1,0),(1256,'Faculty2-zc','Faculty2-zc','Faculty2-zc@group17.com','$2a$10$NL8bDFTzYh845pEaMYbpC..kNdMTzgZMbyHQ10i2LDnuSV1WEhhPC',NULL,NULL,NULL,NULL,NULL,1,0),(1257,'Faculty3-zc','Faculty3-zc','Faculty3-zc@group17.com','$2a$10$NL8bDFTzYh845pEaMYbpC..kNdMTzgZMbyHQ10i2LDnuSV1WEhhPC',NULL,NULL,NULL,NULL,NULL,1,0),(1258,'Student2-zc','Student2-zc','Student2-zc@group17.com','$2a$10$NL8bDFTzYh845pEaMYbpC..kNdMTzgZMbyHQ10i2LDnuSV1WEhhPC',NULL,NULL,NULL,NULL,NULL,0,0),(1259,'Student3-zc','Student3-zc','Student3-zc@group17.com','$2a$10$NL8bDFTzYh845pEaMYbpC..kNdMTzgZMbyHQ10i2LDnuSV1WEhhPC',NULL,NULL,NULL,NULL,NULL,0,0),(1260,'Student4-zc','Student4-zc','Student4-zc@group17.com','$2a$10$NL8bDFTzYh845pEaMYbpC..kNdMTzgZMbyHQ10i2LDnuSV1WEhhPC',NULL,NULL,NULL,NULL,NULL,0,0),(1261,'Faculty4-zc','Faculty4-zc','Faculty4-zc@group17.com','$2a$10$NL8bDFTzYh845pEaMYbpC..kNdMTzgZMbyHQ10i2LDnuSV1WEhhPC',NULL,NULL,NULL,NULL,NULL,1,0),(1262,'Student5-zc','Student5-zc','Student5-zc@group17.com','$2a$10$NL8bDFTzYh845pEaMYbpC..kNdMTzgZMbyHQ10i2LDnuSV1WEhhPC',NULL,NULL,NULL,NULL,NULL,0,0);
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

-- Dump completed on 2017-12-11 16:48:36
