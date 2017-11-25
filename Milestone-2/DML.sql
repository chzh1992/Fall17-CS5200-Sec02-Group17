INSERT INTO `user` (`UserId`, `FirstName`, `LastName`, `Email`, `Password`, `Street`, `City`, `Country`, `PostalCode`, `ProfilePic`, `FacultyFlag`, `AdminFlag`)
VALUES
	(1001,'User1','User1','user1@gmail.com','user1','Street1','Boston','USA','02115',NULL,0,0),
	(1011,'User2','User2','user2@gmail.com','user2','Street2','Boston','USA','02115',NULL,0,0),
	(1021,'User3','User3','user3@gmail.com','user3','Street3','NYC','USA','02115',NULL,0,0),
	(1031,'User4','User4','user4@gmail.com','user4','Street4','NYC','USA','02115',NULL,0,0),
	(1041,'User5','User5','user5@gmail.com','user5','Street5','Dallas','USA','02115',NULL,0,0),
	(1051,'User6','User6','user6@gmail.com','user6','Street6','Dallas','USA','02115',NULL,0,0),
	(1061,'User7','User7','user7@gmail.com','user7','Street7','Seattle','USA','02115',NULL,0,0),
	(1071,'User8','User8','user8@gmail.com','user8','Street8','Seattle','USA','02115',NULL,0,0),
	(1081,'User9','User9','user9@gmail.com','user9','Street9','SanFrancisco','USA','02115',NULL,0,0),
	(1091,'User10','User10','user10@gmail.com','user10','Street10','SanFrancisco','USA','02115',NULL,0,0),
	(1101,'User11','User11','user11@gmail.com','user11','Street11','Boston','USA','02115',NULL,1,0),
	(1111,'User12','User12','user12@gmail.com','user12','Street12','Boston','USA','02115',NULL,1,0),
	(1121,'User13','User13','user13@gmail.com','user13','Street13','Boston','USA','02115',NULL,1,0),
	(1131,'User14','User14','user14@gmail.com','user14','Street14','Boston','USA','02115',NULL,1,0),
	(1141,'User15','User15','user15@gmail.com','user15','Street15','Boston','USA','02115',NULL,1,0),
	(1151,'User16','User16','user16@gmail.com','user16','Street16','Boston','USA','02115',NULL,1,1),
	(1161,'User17','User17','user17@gmail.com','user17','Street17','Boston','USA','02115',NULL,1,1),
	(1171,'User18','User18','user18@gmail.com','user18','Street18','Boston','USA','02115',NULL,1,1),
	(1181,'User19','User19','user19@gmail.com','user19','Street19','Boston','USA','02115',NULL,1,1),
	(1191,'User20','User20','user20@gmail.com','user20','Street20','Boston','USA','02115',NULL,1,1),
	(1201,'User21','User21','user21@gmail.com','user21','Street21','Boston','USA','02115',NULL,0,1),
	(1211,'User22','User22','user22@gmail.com','user22','Street22','Boston','USA','02115',NULL,0,1),
	(1221,'User23','User23','user23@gmail.com','user23','Street23','Boston','USA','02115',NULL,0,1),
	(1231,'User24','User24','user24@gmail.com','user24','Street24','Boston','USA','02115',NULL,0,1),
	(1241,'User25','User25','user25@gmail.com','user25','Street25','Boston','USA','02115',NULL,0,1);



INSERT INTO `admin` (`AdminId`, `AdminTimestamp`, `GrantorId`)
VALUES
	(1151,'2017-11-23 21:14:10',NULL),
	(1161,'2017-11-23 21:14:10',1151),
	(1171,'2017-11-23 21:14:10',1151),
	(1181,'2017-11-23 21:14:10',1151),
	(1191,'2017-11-23 21:14:10',1151),
	(1201,'2017-11-23 21:14:10',1151),
	(1211,'2017-11-23 21:14:10',1151),
	(1221,'2017-11-23 21:14:10',1151),
	(1231,'2017-11-23 21:14:10',1151),
	(1241,'2017-11-23 21:14:10',1151);



INSERT INTO `faculty` (`FacultyId`, `Title`, `Affiliation`, `WorkWebsite`, `ValidationStatus`, `ValidatorId`, `FacultyTimestamp`)
VALUES
	(1101,'Title1','Organization1','www.organization1.com',0,1151,'2017-11-23 21:17:13'),
	(1111,'Title1','Organization1','www.organization1.com',0,1161,'2017-11-23 21:17:13'),
	(1121,'Title1','Organization1','www.organization1.com',0,1171,'2017-11-23 21:17:13'),
	(1131,'Title1','Organization1','www.organization1.com',0,1181,'2017-11-23 21:17:13'),
	(1141,'Title1','Organization1','www.organization1.com',0,1191,'2017-11-23 21:17:13'),
	(1151,'Title2','Organization2','www.organization2.com',1,1201,'2017-11-23 21:17:13'),
	(1161,'Title2','Organization2','www.organization2.com',1,1211,'2017-11-23 21:17:13'),
	(1171,'Title2','Organization2','www.organization2.com',1,1221,'2017-11-23 21:17:13'),
	(1181,'Title2','Organization2','www.organization2.com',1,1231,'2017-11-23 21:17:13'),
	(1191,'Title2','Organization2','www.organization2.com',1,1241,'2017-11-23 21:17:13');

