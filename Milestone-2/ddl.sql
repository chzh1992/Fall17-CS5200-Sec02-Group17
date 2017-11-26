/*
	The database management system is MySQL.
*/
CREATE TABLE `Course` (
  `CourseId` int(11) NOT NULL primary key auto_increment,
  `Description` varchar(100) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `PrimaryTopicId` int(11) Not NULL,
  `Icon` longblob,
  `Cost` int(11) DEFAULT NULL
);
create table `CourseCreated`(
FacultyId int(11),
CourseId int(11),
`Timestamp` datetime not null,
primary key (FacultyId, CourseId)
);
CREATE TABLE `CourseTaken` (
  `StudentId` int(11),
  `CourseId` int(11),
  `Rating` enum('1','2','3','4','5') DEFAULT NULL,
  `CompletedTimestamp` datetime DEFAULT NULL,
  `Comment` text,
  `ConfirmationCode` int(11) DEFAULT NULL,
  `PaymentTimestamp` datetime DEFAULT NULL,
  primary key (StudentId, CourseId)
);
CREATE TABLE `CourseInterested` (
  `StudentId` int(11),
  `CourseId` int(11),
  primary key (StudentId, CourseId)
);
CREATE TABLE `CourseMaterial` (
  `CourseMaterialId` int(11) primary key auto_increment,
  `CourseId` int(11) NOT NULL,
  `Ordinal` int(11) NOT NULL,
  `Name` varchar(50) not NULL,
  `Type` varchar(20) NOT NULL,
  unique key (CourseId,Ordinal)
);
create table DownloadableFile(
`CourseMaterialId` int(11) primary key,
Path varchar(60),
Size real unsigned,
`Type` varchar(50)
);
create table Link(
`CourseMaterialId` int(11) primary key,
Url varchar(60) not null,
VideoFlag boolean not null
);
create table Post(
`CourseMaterialId` int(11) primary key,
Content text
);
create table CompletedMaterial(
`CourseMaterialId` int(11) primary key,
StudentId int(11),
`Timestamp` datetime not null
);
CREATE TABLE `CourseQuestion` (
  `QuestionId` int(11) NOT NULL primary key auto_increment,
  `QuestionerId` int(11) not null, 
  `Question` text,
  `Answer` text,
  `AnswererId` int(11) default NULL,
  `PublicFlag` tinyint(1) NOT NULL,
  `CourseId` int(11) not NULL
);
CREATE TABLE `LikedQuestion` (
  `QuestionId` int(11),
  `StudentId` int(11),
  primary key(QuestionId,StudentId)
);
CREATE TABLE `Phone` (
  `UserId` int(11),
  `PhoneNumber` varchar(10),
  primary key (UserId,PhoneNumber)
);
CREATE TABLE `CourseMaterialQuestion` (
  `QuestionId` int(11),
  `CourseMaterialId` int(11), 
  primary key (QuestionId,CourseMaterialId)
);
CREATE TABLE `SecondaryTopic` (
  `TopicId` int(11),
  `CourseId` int(11),
  primary key (TopicId,CourseId)
);
CREATE TABLE `User` (
  `UserId` int(11) primary key auto_increment,
  `FirstName` varchar(40) NOT NULL,
  `LastName` varchar(20) NOT NULL,
  `Email` varchar(80) UNIQUE,
  `Password` varchar(20) not null,
  `Street` varchar(20) DEFAULT NULL,
  `City` varchar(40) DEFAULT NULL,
  `Country` varchar(40) DEFAULT NULL,
  `PostalCode` varchar(10) DEFAULT NULL,
  `ProfilePic` longblob,
  `FacultyFlag` boolean NOT NULL DEFAULT false,
  `AdminFlag` boolean NOT NULL DEFAULT false
);
create table Faculty (
`FacultyId` int(11) primary key references User(UserId),
`Title` varchar(20) DEFAULT NULL,
`Affiliation` varchar(20) DEFAULT NULL,
`WorkWebsite` varchar(200) DEFAULT NULL,
`ValidationStatus` tinyint(1) DEFAULT NULL,
`ValidatorId` int(11) DEFAULT NULL,
`FacultyTimestamp` datetime DEFAULT NULL
);
create table Admin (
`AdminId` int(11) primary key references User(UserId),
`AdminTimestamp` datetime DEFAULT NULL,
`GrantorId` int(11) DEFAULT NULL
);
Create table CourseTopic (
TopicId int(11) auto_increment primary key,
`Name` varchar(40) not null
);
Alter table Faculty
add constraint foreign key (FacultyId) references User(UserId),
add constraint foreign key (ValidatorId) references User(UserId);
Alter table Admin
add constraint foreign key (AdminId) references User(UserId),
add constraint foreign key (GrantorId) references User(UserId);
alter table Phone
add constraint foreign key (UserId) references User(UserId);
alter table CourseTaken
add constraint foreign key (StudentId) references User(UserId),
add constraint foreign key (CourseId) references Course(CourseId);
alter table CourseInterested
add constraint foreign key (StudentId) references User(UserId),
add constraint foreign key (CourseId) references Course(CourseId);
alter table Course
add constraint foreign key (PrimaryTopicId) references CourseTopic(TopicId);
alter table CourseCreated
add constraint foreign key (FacultyId) references Faculty(FacultyId),
add constraint foreign key (CourseId) references Course(CourseId);
alter table SecondaryTopic
add constraint foreign key (TopicId) references CourseTopic(TopicId),
add constraint foreign key (CourseId) references Course(CourseId);
alter table CourseMaterial
add constraint foreign key (CourseId) references Course(CourseId);
alter table DownloadableFile
add constraint foreign key (CourseMaterialId) references CourseMaterial(CourseMaterialId);
alter table Link
add constraint foreign key (CourseMaterialId) references CourseMaterial(CourseMaterialId);
alter table Post
add constraint foreign key (CourseMaterialId) references CourseMaterial(CourseMaterialId);
alter table CompletedMaterial
add constraint foreign key (CourseMaterialId) references CourseMaterial(CourseMaterialId),
add constraint foreign key (StudentId) references User(UserId);
alter table CourseQuestion
add constraint foreign key (QuestionerId) references User(UserId),
add constraint foreign key (AnswererId) references Faculty(FacultyId);
alter table LikedQuestion
add constraint foreign key (QuestionId) references CourseQuestion(QuestionId),
add constraint foreign key (StudentId) references User(UserId);
alter table CourseMaterialQuestion
add constraint foreign key (QuestionId) references CourseQuestion(QuestionId),
add constraint foreign key (CourseMaterialId) references CourseMaterial(CourseMaterialId);

alter table `User` auto_increment=1000;
alter table `Course` auto_increment = 5000;
alter table `CourseMaterial` auto_increment = 1;
alter table `CourseQuestion` auto_increment = 1;
