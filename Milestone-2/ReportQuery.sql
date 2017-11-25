/* Query : Find the top rated faculty. 
		  This is calculated by getting the highest rating for a course
*/


drop table if exists test ;

create temporary table test as 
select a.CourseId, CONCAT(MAX(rating),"/",totalRating) as rating from  
(select CourseTaken.CourseId , SUM(CourseTaken.Rating) as rating , 5 * COUNT(*) as totalRating
from CourseTaken Group By CourseTaken.CourseId) a;

select User.FirstName, Course.Name as 'CourseName' , test.rating as 'Rating'
from Course 
inner join CourseCreated on CourseCreated.CourseId = Course.CourseId
inner join User on User.userId = CourseCreated.FacultyId
inner join test on test.CourseId = Course.CourseId;