const app = require('../express-config');
const passport = require('passport');
const connectionPool = require('../mysql2-config');

// For test
app.post('/testLogin',passport.authenticate('local'),function (req,res){
    res.sendStatus(200);
});

app.get('/api/user/checkLoggedIn',checkLoggedIn);
app.get('/api/user/courses',getUserCourses);


function checkLoggedIn(req,res){
    if (req.isAuthenticated()){
        res.json(req.user);
    } else{
        res.sendStatus(403);
    }
}

function getUserCourses(req,res){
    if (req.isAuthenticated()){
        const userId = req.user.id;
        connectionPool
            .getConnection()
            .then(
                function (conn){
                    conn
                        .execute(
                            "select acst.CourseId as CourseId, acst.Name as Name, acst.Icon as Icon, acst.PrimaryTopic as PrimaryTopic, group_concat(acst.SecondaryTopic separator ', ') as SecondaryTopic, ctr.AvgRating as AvgRating, acst.Category as Category, acst.EventTime as EventTime " +
                            "from " +
                            "(select ac.CourseId as CourseId, ac.Name as Name, ac.Icon as Icon, ac.PrimaryTopic as PrimaryTopic, CourseTopic.Name as SecondaryTopic, ac.Category as Category, ac.EventTime as EventTime " +
                            "from " +
                            "(select Course.CourseId as CourseId, Course.Name as Name, Course.Icon as Icon, CourseTopic.Name as PrimaryTopic, if(CourseTaken.CompletedTimestamp is null,'Enrolled','Completed') as Category, if(CourseTaken.CompletedTimestamp is null, CourseTaken.PaymentTimestamp,CourseTaken.CompletedTimestamp) as EventTime " +
                            "from CourseTaken inner join Course on CourseTaken.CourseId = Course.CourseId " +
                            "inner join CourseTopic on Course.PrimaryTopicId = CourseTopic.TopicId " +
                            "where CourseTaken.StudentId = ? union " +
                            "select Course.CourseId as CourseId, Course.Name as Name, Course.Icon as Icon, CourseTopic.Name as PrimaryTopic, 'Interested' as Category, null as EventTime " +
                            "from CourseInterested inner join Course on CourseInterested.CourseId = Course.CourseId " +
                            "inner join CourseTopic on Course.PrimaryTopicId = CourseTopic.TopicId " +
                            "where CourseInterested.StudentId = ?) ac " +
                            "left join SecondaryTopic on ac.CourseId = SecondaryTopic.CourseId " +
                            "left join CourseTopic on SecondaryTopic.TopicId = CourseTopic.TopicId) acst " +
                            "left join " +
                            "(select CourseId, avg(Rating) as AvgRating " +
                            "from CourseTaken " +
                            "group by CourseId) ctr " +
                            "on acst.CourseId = ctr.CourseId " +
                            "group by CourseId " +
                            "order by Category asc, AvgRating desc, CourseId asc",[userId,userId])
                        .then(
                            function ([rows,fields]){
                                var courses = {
                                    enrolled: [],
                                    completed: [],
                                    interested: []
                                };
                                for (var row in rows){
                                    var course ={
                                        id: rows[row].CourseId,
                                        name: rows[row].Name,
                                        icon: rows[row].Icon,
                                        primaryTopic: rows[row].PrimaryTopic,
                                        secondaryTopic: rows[row].SecondaryTopic,
                                        avgRating: rows[row].AvgRating,
                                        category: rows[row].Category,
                                        eventTime: rows[row].EventTime
                                    };
                                    if (course.eventTime){
                                        course.eventTime = [
                                            course.eventTime.getFullYear(),
                                            course.eventTime.getMonth() + 1,
                                            course.eventTime.getDate()].join('-');
                                    }
                                    switch (course.category){
                                        case 'Enrolled':
                                            courses.enrolled.push(course);
                                            break;
                                        case 'Completed':
                                            courses.completed.push(course);
                                            break;
                                        case 'Interested':
                                            courses.interested.push(course);
                                            break;
                                    }
                                }
                                res.json(courses);
                            },
                            function (err){
                                console.log(err);
                                res.sendStatus(500);
                            }
                        )
                }
            )
            .then(

            )
    } else{
        res.sendStatus(403);
    }
}





























