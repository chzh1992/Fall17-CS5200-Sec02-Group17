
-- A. 
-- default user is registered as student
INSERT INTO `user` (`UserId`, `FirstName`, `LastName`, `Email`, `Password`, `Street`, `City`, `Country`, `PostalCode`, `ProfilePic`, `FacultyFlag`, `AdminFlag`)
VALUES (1001,'User1','User1','user1@gmail.com','user1','Street1','Boston','USA','02115',NULL,0,0);

-- G.
-- the CourseID and StudentID will come from user1
SELECT COALESCE( (select CourseTaken.`CompletedTimestamp` from CourseTaken 
where CourseTaken.CourseId = 5001  and CourseTaken.StudentId = 1001
), 0) as CompletedTimestamp ;



