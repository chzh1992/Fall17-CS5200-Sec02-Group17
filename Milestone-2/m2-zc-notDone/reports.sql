/************************************************************************
Report How active each professor is in the course (based on how 
many questions each professor has answered)

-------------------------------------------------------------------------

Query:

select f.fId as FacultyId, f.ffName as FirstName, f.flName as LastName, a.aNum as AnsweredQuestions
from
(
select Faculty.FacultyId as fId, User.FirstName as ffName, User.LastName as flName
from Faculty inner join CourseCreated on Faculty.FacultyId = CourseCreated.FacultyId
			 inner join Course on CourseCreated.CourseId = Course.CourseId
			 inner join User on Faculty.FacultyId = User.UserId
where Course.Name = Parameter_1
) f
left join 
(
select CourseQuestion.AnswererId as aId, count(CourseQuestion.AnswererId) as aNum
from
CourseQuestion inner join Course on CourseQuestion.CourseId = Course.CourseId
where Course.Name = Parameter_1
group by CourseQuestion.AnswererId
) a 
on f.fId = a.aId
order by AnsweredQuestions desc, LastName asc, FirstName asc

-------------------------------------------------------------------------

Parameterization:

Parameter_1: The course the user wants to know about
 
-------------------------------------------------------------------------

Justification of Complexity:

1. # Tables joined: 3
2. Non-inner/natural join? yes
3. # of subqueries: 2
4. Aggregate function(s)? yes
5. Grouping? yes
6. # ordering ﬁelds: 3
7. Strong motivation/justiﬁcation for the query in the domain? yes

-------------------------------------------------------------------------

Example:
*************************************************************************/


/************************************************************************
Report A review on a professor's courses

-------------------------------------------------------------------------

Query:

select fc.cName as CourseName, avg(CourseTaken.Rating) as AvgRating, count(CourseTaken.StudentId) as StudentNum, fc.cCost * count(CourseTaken.StudentId) as Revenue 
from
(
select Course.CourseId as cId, Course.Name as cName, Course.Cost as cCost
from Course inner join CourseCreated on Course.CourseId = CourseCreated.CourseId
			inner join Faculty on Faculty.FacultyId = CourseCreated.FacultyId
			inner join User on Faculty.FacultyId = User.UserId
where User.FirstName = Parameter_1 and User.LastName = Parameter_2
) fc
left join CourseTaken on fc.cId = CourseTaken.CourseId
group by fc.cId
order by AvgRating desc, Revenue desc, StudentNum desc


-------------------------------------------------------------------------

Parameterization:

Parameter_1: the professor's first name
Parameter_2: the professor's last name
 
-------------------------------------------------------------------------

Justification of Complexity:

1. # Tables joined: 3
2. Non-inner/natural join? yes
3. # of subqueries: 1
4. Aggregate function(s)? yes
5. Grouping? yes
6. # ordering ﬁelds: 3
7. Non-aggregation functions or expressions in SELECT/WHERE? yes
8. Strong motivation/justiﬁcation for the query in the domain? yes

-------------------------------------------------------------------------

Example:
*************************************************************************/