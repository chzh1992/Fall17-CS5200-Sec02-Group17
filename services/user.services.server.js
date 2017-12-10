const app = require('../express-config');
const passport = require('passport');
const connectionPool = require('../mysql2-config');

// For test
app.post('/testLogin',passport.authenticate('local'),function (req,res){
    res.sendStatus(200);
});

app.get('/api/user/checkLoggedIn',checkLoggedIn);
app.get('/api/user/accountInfo',getAccountInfo);
app.put('/api/admin/assessFaculty',assessFaculty);
app.get('/api/admin/getAllUsers',getAllUsers);
app.put('/api/admin/grantAdminPower/:userId',grantAdminPower);


function checkLoggedIn(req,res){
    if (req.isAuthenticated()){
        res.json(req.user);
    } else{
        res.sendStatus(403);
    }
}

function getAccountInfo(req,res){
    if (req.isAuthenticated()){
        const userId = req.user.id;
        connectionPool
            .getConnection()
            .then(
                function (conn){
                    // get the user's courses
                    const accountInfo = {};
                    addCourseInfo(accountInfo,conn,userId)
                        .then(
                            // get account history
                            function (accountInfo){
                                return addHistoryInfo(accountInfo,conn,userId);
                            },
                            function (err){
                                conn.release();
                                console.log(err);
                                res.sendStatus(500);
                            }
                        )
                        .then(
                            function (accountInfo){
                                // get Admin info if the user is an admin
                                if (req.user.isAdmin){
                                    addAdminInfo(accountInfo,conn)
                                        .then(
                                            function (accountInfo){
                                                res.json(accountInfo);
                                            },
                                            function (err){
                                                // failed to get admin info
                                                conn.release();
                                                console.log(err);
                                                res.sendStatus(500);
                                            }
                                        );
                                } else{
                                    res.json(accountInfo);
                                }
                            },
                            function (err){
                                // failed to get account history
                                conn.release();
                                console.log(err);
                                res.sendStatus(500);
                            }
                        )
                },
                function (err){
                    console.log(err);
                    res.sendStatus(500);
                }
            )
    } else{
        // not logged in
        res.sendStatus(403);
    }
}

function addCourseInfo(accountInfo,conn,userId){
    return conn
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
            "where CourseInterested.StudentId = ? union " +
            "select Course.CourseId as CourseId, Course.Name as Name, Course.Icon as Icon, CourseTopic.Name as PrimaryTopic, 'Created' as Category, CourseCreated.Timestamp as EventTime " +
            "from CourseCreated inner join Course on CourseCreated.CourseId = Course.CourseId " +
            "inner join CourseTopic on Course.PrimaryTopicId = CourseTopic.TopicId " +
            "where CourseCreated.FacultyId =  ?) ac " +
            "left join SecondaryTopic on ac.CourseId = SecondaryTopic.CourseId " +
            "left join CourseTopic on SecondaryTopic.TopicId = CourseTopic.TopicId) acst " +
            "left join " +
            "(select CourseId, avg(Rating) as AvgRating " +
            "from CourseTaken " +
            "group by CourseId) ctr " +
            "on acst.CourseId = ctr.CourseId " +
            "group by CourseId " +
            "order by Category asc, AvgRating desc, CourseId asc",[userId,userId,userId])
        .then(
            function ([rows,fields]) {
                const courses = {
                    enrolled: [],
                    completed: [],
                    interested: [],
                    created: []
                };
                for (var row in rows) {
                    const course = {
                        id: rows[row].CourseId,
                        name: rows[row].Name,
                        icon: rows[row].Icon,
                        primaryTopic: rows[row].PrimaryTopic,
                        secondaryTopic: rows[row].SecondaryTopic,
                        avgRating: rows[row].AvgRating,
                        category: rows[row].Category,
                        eventTime: timeStringToDisplay(rows[row].EventTime)
                    };
                    switch (course.category) {
                        case 'Enrolled':
                            courses.enrolled.push(course);
                            break;
                        case 'Completed':
                            courses.completed.push(course);
                            break;
                        case 'Interested':
                            courses.interested.push(course);
                            break;
                        case 'Created':
                            courses.created.push(course);
                            break;
                    }
                }
                accountInfo.courses = courses;
                return accountInfo;
            });
}

function timeStringToDisplay(jsDate){
    return jsDate ? [jsDate.getFullYear(),jsDate.getMonth()+1,jsDate.getDate()].join('-') : null;
}

function addHistoryInfo(accountInfo,conn,userId){
    return conn
        .execute("select Course.Name as cn, CourseTaken.PaymentTimestamp as pts, CourseTaken.CompletedTimestamp as cts, concat(Course.Cost, ' (', CourseTaken.ConfirmationCode, ')') as cost, (select sum(Course.Cost) from CourseTaken inner join Course on CourseTaken.CourseId = Course.CourseId where CourseTaken.StudentId = ?) as total " +
                 "from CourseTaken inner join Course on CourseTaken.CourseId = Course.CourseId " +
                 "where CourseTaken.StudentId = ?",[userId,userId])
        .then(
            function ([rows,fields]){
                console.log(rows);
                accountInfo.history = [];
                for (var row in rows){
                    var historyItem = {
                        courseName: rows[row].cn,
                        enrolledOn: timeStringToDisplay(rows[row].pts),
                        completedOn: timeStringToDisplay(rows[row].cts),
                        amountPaid: rows[row].cost
                    };
                    accountInfo.history.push(historyItem);
                }
                accountInfo.total = rows.length > 0? rows[0].total : 0;
                return accountInfo;
            }
        );
}

function addAdminInfo(accountInfo,conn){
    return conn
        .execute("select FacultyId as fid, concat(User.FirstName,' ',User.LastName) as name, User.Email as email, Title as t, Affiliation as a, WorkWebsite as ww " +
                 "from Faculty inner join `User` on Faculty.FacultyId = User.UserId " +
                 "where Faculty.ValidationStatus is null")
        .then(
            function ([rows,fields]){
                // all information gathered, connection released
                conn.release();
                accountInfo.validationRequests = [];
                for (var row in rows){
                    var request = {
                        fromId: rows[row].fid,
                        fromName: rows[row].name,
                        fromEmail: rows[row].emaiil,
                        title: rows[row].t,
                        affiliation: rows[row].a,
                        workWebsite: rows[row].ww
                    };
                    accountInfo.validationRequests.push(request);
                }
                return accountInfo;
            }
        );
}

function assessFaculty(req,res){
    const assessment = req.body;
    connectionPool
        .getConnection()
        .then(
            function (conn){
                conn
                    .execute("select * from Faculty where FacultyId = ? and ValidationStatus is null",[assessment.facultyId])
                    .then(
                        function ([rows,fields]){
                            if (rows.length == 0){
                                conn.release();
                                res.sendStatus(403);
                            } else{
                                conn
                                    .execute("update Faculty set ValidationStatus = ?, ValidatorId = ?, FacultyTimeStamp = curtime() where FacultyId = ?",
                                        [assessment.passed ? 1 : 0, req.user.id, assessment.facultyId])
                                    .then(
                                        function (){
                                            conn.release();
                                            res.sendStatus(200);
                                        },
                                        function (err){
                                            console.log(err);
                                            res.sendStatus(500);
                                        }
                                    );
                            }
                        }
                    );
            }
        );
}

function getAllUsers(req,res){
    if (req.isAuthenticated() && req.user.isAdmin){
        connectionPool
            .getConnection()
            .then(
                function (conn){
                    conn
                        .query("select UserId, concat(FirstName,' ',LastName) as Name, Email, AdminFlag, ProfilePic from `User`")
                        .then(
                            function ([rows,fields]){
                                conn.release();
                                var allUsers = [];
                                for (var row in rows){
                                    var user = {
                                        id: rows[row].UserId,
                                        name: rows[row].Name,
                                        email: rows[row].Email,
                                        isAdmin: rows[row].AdminFlag == 1,
                                        profilePic: rows[row].ProfilePic
                                    };
                                    allUsers.push(user);
                                }
                                res.json(allUsers);
                            },
                            function (err){
                                conn.release();
                                console.log(err);
                                res.sendStatus(500);
                            }
                        );
                }
            );
    } else{
        res.sendStatus(403);
    }
}

function grantAdminPower(req,res){
    const userId = req.params['userId'];
    connectionPool
        .getConnection()
        .then(
            function (conn){
                conn
                    .query('start transaction')
                    .then(
                        function (){
                            return conn.execute("update `User` set AdminFlag = 1 where UserId = ?",[userId]);
                        }
                    )
                    .then(
                        function (){
                            return conn.execute("insert into Admin (AdminId,AdminTimestamp,GrantorId) values (?, curtime(), ?)",[userId,req.user.id]);
                        }
                    )
                    .then(
                        function (){
                            return conn.query("commit");
                        }
                    )
                    .then(
                        function(){
                            res.sendStatus(200);
                        }
                    );
            },
            function (err){
                console.log(err);
                res.sendStatus(500);
            }
        )
}

// conn
//     .execute(
//         "select acst.CourseId as CourseId, acst.Name as Name, acst.Icon as Icon, acst.PrimaryTopic as PrimaryTopic, group_concat(acst.SecondaryTopic separator ', ') as SecondaryTopic, ctr.AvgRating as AvgRating, acst.Category as Category, acst.EventTime as EventTime " +
//         "from " +
//         "(select ac.CourseId as CourseId, ac.Name as Name, ac.Icon as Icon, ac.PrimaryTopic as PrimaryTopic, CourseTopic.Name as SecondaryTopic, ac.Category as Category, ac.EventTime as EventTime " +
//         "from " +
//         "(select Course.CourseId as CourseId, Course.Name as Name, Course.Icon as Icon, CourseTopic.Name as PrimaryTopic, if(CourseTaken.CompletedTimestamp is null,'Enrolled','Completed') as Category, if(CourseTaken.CompletedTimestamp is null, CourseTaken.PaymentTimestamp,CourseTaken.CompletedTimestamp) as EventTime " +
//         "from CourseTaken inner join Course on CourseTaken.CourseId = Course.CourseId " +
//         "inner join CourseTopic on Course.PrimaryTopicId = CourseTopic.TopicId " +
//         "where CourseTaken.StudentId = ? union " +
//         "select Course.CourseId as CourseId, Course.Name as Name, Course.Icon as Icon, CourseTopic.Name as PrimaryTopic, 'Interested' as Category, null as EventTime " +
//         "from CourseInterested inner join Course on CourseInterested.CourseId = Course.CourseId " +
//         "inner join CourseTopic on Course.PrimaryTopicId = CourseTopic.TopicId " +
//         "where CourseInterested.StudentId = ? union " +
//         "select Course.CourseId as CourseId, Course.Name as Name, Course.Icon as Icon, CourseTopic.Name as PrimaryTopic, 'Created' as Category, CourseCreated.Timestamp as EventTime " +
//         "from CourseCreated inner join Course on CourseCreated.CourseId = Course.CourseId " +
//         "inner join CourseTopic on Course.PrimaryTopicId = CourseTopic.TopicId " +
//         "where CourseCreated.FacultyId =  ?) ac " +
//         "left join SecondaryTopic on ac.CourseId = SecondaryTopic.CourseId " +
//         "left join CourseTopic on SecondaryTopic.TopicId = CourseTopic.TopicId) acst " +
//         "left join " +
//         "(select CourseId, avg(Rating) as AvgRating " +
//         "from CourseTaken " +
//         "group by CourseId) ctr " +
//         "on acst.CourseId = ctr.CourseId " +
//         "group by CourseId " +
//         "order by Category asc, AvgRating desc, CourseId asc",[userId,userId,userId])
//     .then(
//         function ([rows,fields]){
//             var courses = {
//                 enrolled: [],
//                 completed: [],
//                 interested: [],
//                 created: []
//             };
//             for (var row in rows){
//                 var course ={
//                     id: rows[row].CourseId,
//                     name: rows[row].Name,
//                     icon: rows[row].Icon,
//                     primaryTopic: rows[row].PrimaryTopic,
//                     secondaryTopic: rows[row].SecondaryTopic,
//                     avgRating: rows[row].AvgRating,
//                     category: rows[row].Category,
//                     eventTime: rows[row].EventTime
//                 };
//                 if (course.eventTime){
//                     course.eventTime = [
//                         course.eventTime.getFullYear(),
//                         course.eventTime.getMonth() + 1,
//                         course.eventTime.getDate()].join('-');
//                 }
//                 switch (course.category){
//                     case 'Enrolled':
//                         courses.enrolled.push(course);
//                         break;
//                     case 'Completed':
//                         courses.completed.push(course);
//                         break;
//                     case 'Interested':
//                         courses.interested.push(course);
//                         break;
//                     case 'Created':
//                         courses.created.push(course);
//                         break;
//                 }
//             }
//             var info = {};
//             info.courses = courses;
//             return(info);
//         },
//         function (err){
//             console.log(err);
//             res.sendStatus(500);
//         }
//     )
//     .then(
//         function (info){
//             // get account history
//         }
//     );





























