CREATE TABLE `Course` (
  `CourseId` int(11) NOT NULL primary key,
  `Description` varchar(100) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `PrimaryTopicId` int(11) DEFAULT NULL,
  `Icon` longblob,
  `Cost` int(11) DEFAULT NULL
);
create table `CourseCreated`(
FacultyId int(11),
CourseId int(11),
`Timestamp` datetime,
primary key (FacultyId, CourseId)
);
CREATE TABLE `CourseCompleted` (
  `StudentId` int(11) DEFAULT NULL,
  `CourseId` int(11) DEFAULT NULL,
  `Rating` enum('1','2','3','4','5') DEFAULT NULL,
  `Timestamp` datetime DEFAULT NULL,
  `Comment` text,
  primary key (StudentId, CourseId)
);
CREATE TABLE `CourseEnrolled` (
  `ConfirmationCode` int(11) DEFAULT NULL,
  `PaymentTimestamp` datetime DEFAULT NULL,
  `StudentId` int(11) DEFAULT NULL,
  `CourseId` int(11) DEFAULT NULL,
  primary key (StudentId, CourseId)
);
CREATE TABLE `CourseInterested` (
  `StudentId` int(11) DEFAULT NULL,
  `CourseId` int(11) DEFAULT NULL,
  primary key (StudentId, CourseId)
);
CREATE TABLE `CourseMaterial` (
  `CourseId` int(11) NOT NULL,
  `OrderId` int(11) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Type` varchar(20) DEFAULT NULL,
  primary key (CourseId,OrderId)
);
create table DownloadableFile(
CourseId int(11),
OrderId int(11),
Path varchar(60),
Size real unsigned,
`Type` varchar(50),
primary key (CourseId, OrderId)
);
create table Link(
CourseId int(11),
OrderId int(11),
Url varchar(60),
VideoFlag boolean not null,
primary key (CourseId, OrderId)
);
create table Post(
CourseId int(11),
OrderId int(11),
Content text,
primary key (CourseId, OrderId)
);
create table CompletedMaterial(
CourseId int(11),
OrderId int(11),
StudentId int(11),
`Timestamp` datetime,
primary key (CourseId,OrderId,StudentId)
);
CREATE TABLE `CourseQuestion` (
  `QuestionId` int(11) NOT NULL primary key,
  `QuestionerId` int(11) DEFAULT NULL,
  `Question` text,
  `Answer` text,
  `AnswererId` int(11) DEFAULT NULL,
  `PublicFlag` tinyint(1) NOT NULL,
  `CourseId` int(11) DEFAULT NULL
);
CREATE TABLE `LikedQuestion` (
  `QuestionId` int(11) NOT NULL,
  `StudentId` int(11) NOT NULL,
  primary key(QuestionId,StudentId)
);
CREATE TABLE `Phone` (
  `UserId` int(11) DEFAULT NULL,
  `PhoneNumber` varchar(10) DEFAULT NULL,
  primary key (UserId,PhoneNumber)
);
CREATE TABLE `CourseMaterialQuestion` (
  `QuestionId` int(11) NOT NULL,
  `CourseId` int(11) NOT NULL,
  `OrderId` int(11) NOT NULL,
  primary key (QuestionId,CourseId,OrderId)
);
CREATE TABLE `SecondaryTopic` (
  `TopicId` int(11) DEFAULT NULL,
  `CourseId` int(11) DEFAULT NULL,
  primary key (TopicId,CourseId)
);
CREATE TABLE `User` (
  `UserId` int(11) NOT NULL primary key,
  `FirstName` varchar(40) NOT NULL,
  `LastName` varchar(20) NOT NULL,
  `Email` varchar(80) DEFAULT NULL UNIQUE,
  `Password` varchar(20) DEFAULT NULL,
  `Street` varchar(20) DEFAULT NULL,
  `City` varchar(40) DEFAULT NULL,
  `Country` varchar(40) DEFAULT NULL,
  `PostalCode` varchar(10) DEFAULT NULL,
  `ProfilePic` longblob,
  `FacultyFlag` boolean NOT NULL DEFAULT false,
  `Title` varchar(20) DEFAULT NULL,
  `Affiliation` varchar(20) DEFAULT NULL,
  `WorkWebsite` varchar(200) DEFAULT NULL,
  `AdminFlag` boolean NOT NULL DEFAULT false,
  `ValidationStatus` tinyint(1) DEFAULT NULL,
  `FacultyTimestamp` datetime DEFAULT NULL,
  `ValidatorId` int(11) DEFAULT NULL,
  `AdminTimestamp` datetime DEFAULT NULL,
  `GrantorId` int(11) DEFAULT NULL
);
Create table CourseTopic (
TopicId int auto_increment primary key,
`Name` varchar(40)
);
Alter table User
add constraint foreign key (GrantorId) references User(UserId),
add constraint foreign key (ValidatorId) references User(UserId);
alter table Phone
add constraint foreign key (UserId) references User(UserId);
alter table CourseCompleted
add constraint foreign key (StudentId) references User(UserId),
add constraint foreign key (CourseId) references Course(CourseId);
alter table CourseInterested
add constraint foreign key (StudentId) references User(UserId),
add constraint foreign key (CourseId) references Course(CourseId);
alter table CourseEnrolled
add constraint foreign key (StudentId) references User(UserId),
add constraint foreign key (CourseId) references Course(CourseId);
alter table Course
add constraint foreign key (PrimaryTopicId) references CourseTopic(TopicId);
alter table CourseCreated
add constraint foreign key (FacultyId) references User(UserId),
add constraint foreign key (CourseId) references Course(CourseId);
alter table SecondaryTopic
add constraint foreign key (TopicId) references CourseTopic(TopicId),
add constraint foreign key (CourseId) references Course(CourseId);
alter table CourseMaterial
add constraint foreign key (CourseId) references Course(CourseId);
alter table DownloadableFile
add constraint foreign key (CourseId,OrderId) references CourseMaterial(CourseId,OrderId);
alter table Link
add constraint foreign key (CourseId,OrderId) references CourseMaterial(CourseId,OrderId);
alter table Post
add constraint foreign key (CourseId,OrderId) references CourseMaterial(CourseId,OrderId);
alter table CompletedMaterial
add constraint foreign key (CourseId,OrderId) references CourseMaterial(CourseId,OrderId),
add constraint foreign key (StudentId) references User(UserId);
alter table CourseQuestion
add constraint foreign key (QuestionerId) references User(UserId),
add constraint foreign key (AnswererId) references User(UserId);
alter table LikedQuestion
add constraint foreign key (QuestionId) references CourseQuestion(QuestionId),
add constraint foreign key (StudentId) references User(UserId);
alter table CourseMaterialQuestion
add constraint foreign key (QuestionId) references CourseQuestion(QuestionId),
add constraint foreign key (CourseId,OrderId) references CourseMaterial(CourseId,OrderId);


