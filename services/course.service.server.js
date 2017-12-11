const app = require('../express-config');
const connectionPool = require('../mysql2-config');

app.get('/api/course/:courseId',getCourseInfo);
app.post('/api/material/complete',completeMaterial);
app.post('/api/course/enroll',enrollStudent);
app.get('/api/course',getAllCourses);

function timeStringToDisplay(jsDate){
    return jsDate ? [jsDate.getFullYear(),jsDate.getMonth()+1,jsDate.getDate()].join('-') : null;
}

function getCourseInfo(req,res){
    const courseId = req.params['courseId'];
    const courseInfo = {};
    connectionPool
        .getConnection()
        .then(
            function(conn){
                addNonExclusiveInfo(courseInfo,conn,courseId)
                    .then(
                        function(courseInfo){
                            return addCreatorInfo(courseInfo,conn,courseId);
                        },
                        function (err){
                            conn.release();
                            console.log(err);
                            res.sendStatus(500);
                        }
                    )
                    .then(
                        function (courseInfo){
                            if (!req.isAuthenticated()){
                                res.json(courseInfo);
                            } else{
                                checkUserStatus(conn,req.user.id,courseId)
                                    .then(
                                        function (status){
                                            courseInfo.userStatus = status;
                                            if (courseInfo.userStatus.isEnrolled || courseInfo.userStatus.isCreator){
                                                addExclusiveInfo(courseInfo,conn,courseId)
                                                    .then(
                                                        function (courseInfo){
                                                            res.json(courseInfo);
                                                        }
                                                    );
                                            } else{
                                                res.json(courseInfo);
                                            }
                                        }
                                    );
                            }
                        },
                        function (err){
                            conn.release();
                            console.log(err);
                            res.sendStatus(500);
                        }
                    )
            }
        );
}

function addNonExclusiveInfo(courseInfo,conn,courseId){
    return conn
        .execute("select c.cid as cid, c.des as des, c.cname as cname, c.icon as icon, c.cost as cost, c.pt as pt, group_concat(CourseTopic.Name SEPARATOR ', ') as st, (select avg(Rating) from CourseTaken where CourseId = ?) as rating, (select `Timestamp` from CourseCreated where CourseId = ? order by `TimeStamp` asc limit 1) as time " +
            "from (select Course.CourseId as cid, Course.Description as des, Course.Name as cname, Course.Icon as icon, concat('$',Course.Cost) as cost, CourseTopic.Name as pt " +
            "from Course inner join CourseTopic on Course.PrimaryTopicId = CourseTopic.TopicId) c " +
            "left join SecondaryTopic on c.cid = SecondaryTopic.CourseId " +
            "left join CourseTopic on SecondaryTopic.TopicId = CourseTopic.TopicId "+
            "where c.cid = ?",[courseId,courseId,courseId])
        .then(
            function ([rows,fields]){
                const result = rows[0];
                courseInfo.course = {
                    id: result.cid,
                    description: result.des,
                    name: result.cname,
                    icon: result.icon,
                    cost: result.cost,
                    primaryTopic: result.pt,
                    secondaryTopic: result.st,
                    rating: result.rating,
                    date: timeStringToDisplay(result.time)
                };
                return courseInfo;
            }
        )
}

function addCreatorInfo(courseInfo,conn,courseId) {
    courseInfo.creators = [];
    return conn
        .execute("select concat(User.FirstName, ' ', User.LastName) as name, Faculty.Title as t, Faculty.Affiliation as a, Faculty.WorkWebsite as ww " +
            "from CourseCreated inner join Faculty on CourseCreated.FacultyId = Faculty.FacultyId " +
            "inner join `User` on Faculty.FacultyId = User.UserId " +
            "where CourseCreated.CourseId = ?", [courseId])
        .then(
            function ([rows, fields]) {
                for (var row in rows){
                    const creator = {
                        name: rows[row].name,
                        title: rows[row].t,
                        affiliation: rows[row].a,
                        workWebsite: rows[row].ww
                    };
                    courseInfo.creators.push(creator);
                }
                return courseInfo;
            }
        );
}

function checkUserStatus(conn,userId,courseId) {
    return conn
        .execute("select (select count(*) from CourseTaken where StudentId = ? and CourseId = ?) as e, " +
            "(select count(*) from CompletedMaterial inner join CourseMaterial on CompletedMaterial.CourseMaterialId = CourseMaterial.CourseMaterialId where CompletedMaterial.StudentId = ? and CourseMaterial.CourseId = ?) as l, " +
            "(select count(*) from CourseCreated where FacultyId = ? and CourseId = ?) as f", [userId, courseId, userId, courseId, userId, courseId])
        .then(
            function ([rows, fields]) {
                return {
                    id: userId,
                    isEnrolled: rows[0].e == 1,
                    lastCompleted: rows[0].l,
                    isCreator: rows[0].f == 1
                };
            }
        );
}

function addExclusiveInfo(courseInfo,conn,courseId){
    return addCourseMaterials(courseInfo,conn,courseId)
        .then(
            function (courseInfo){
                if (courseInfo.userStatus.isCreator){
                    courseInfo.userStatus.lastCompleted = courseInfo.courseMaterials.length;
                }
                return addCourseQuestions(courseInfo,conn,courseId);
            }
        );
}

function addCourseMaterials(courseInfo,conn,courseId){
    courseInfo.courseMaterials = [];
    return conn
        .execute("select CourseMaterial.CourseMaterialId as id, CourseMaterial.Ordinal as ord, CourseMaterial.Name as name, CourseMaterial.Type as type, DownloadableFile.Path as path, DownloadableFile.Size as size, DownloadableFile.type as ftype, Link.Url as url, Link.VideoFlag as vflag, Post.Content as content " +
                 "from CourseMaterial left join DownloadableFile on CourseMaterial.CourseMaterialId = DownloadableFile.CourseMaterialId " +
                 "left join Link on CourseMaterial.CourseMaterialId = Link.CourseMaterialId " +
                 "left join Post on CourseMaterial.CourseMaterialId = Post.CourseMaterialId " +
                 "where CourseMaterial.CourseId = ?",[courseId])
        .then(
            function ([rows,fields]){
                for (const row in rows){
                    const result = rows[row];
                    const material = {
                        id: result.id,
                        ordinal: result.ord,
                        name: result.name,
                        type: result.type
                    };
                    switch(material.type){
                        case "DownloadableFile":
                            material.path = result.path;
                            material.size = result.size;
                            material.fileType = result.ftype;
                            break;
                        case "Post":
                            material.content = result.content;
                            break;
                        case "Link":
                            material.url = result.url;
                            material.isVideo = result.vflag == 1;
                            break;
                    }
                    courseInfo.courseMaterials.push(material);
                }
                return courseInfo;
            }
        );
}

function addCourseQuestions(courseInfo,conn,courseId){
    const sqlParams = courseInfo.userStatus.isCreator ? [courseId] : [courseInfo.userStatus.id,courseId];
    courseInfo.courseQuestions = [];
    return conn
        .execute("select *, group_concat(CourseMaterial.Name separator ' ') as relMat " +
                 "from " +
                 "(select *, count(LikedQuestion.StudentId) as likes " +
                 "from " +
                 "(select cq.qid as qid, cq.cid as cid, cq.pflag as pflag, cq.qerid as qerid, cq.qest as qest, cq.ans as ans, cq.qername as qername, concat(User.FirstName, ' ', User.LastName) as aername " +
                 "from " +
                 "(select CourseQuestion.QuestionId as qid, CourseQuestion.PublicFlag as pflag, CourseQuestion.QuestionerId as qerid, CourseQuestion.CourseId as cid, CourseQuestion.Question as qest, CourseQuestion.Answer as ans, concat(User.FirstName, ' ', User.LastName) as qername, CourseQuestion.AnswererId as aerid " +
                 "from CourseQuestion inner join `User` on CourseQuestion.QuestionerId = User.UserId " +
                 (courseInfo.userStatus.isCreator ? "" : "where CourseQuestion.publicFlag = 1 or CourseQuestion.QuestionerId = ? ") + ") cq " +
                 "left join `User` on cq.aerid = User.UserId) cqa " +
                 "left join " +
                 "LikedQuestion on cqa.qid = LikedQuestion.QuestionId " +
                 "where cid = ? " +
                 "group by LikedQuestion.QuestionId) cqal " +
                 "left join " +
                 "CourseMaterialQuestion on cqal.qid = CourseMaterialQuestion.QuestionId " +
                 "left join " +
                 "CourseMaterial on CourseMaterialQuestion.CourseMaterialId = CourseMaterial.CourseMaterialId " +
                 "group by cqal.qid",sqlParams)
        .then(
            function ([rows,fields]){
                console.log(rows.length);
                for (const row in rows){
                    const result = rows[row];
                    const question = {
                        id: result.qid,
                        isPublic: result.pflag == 1,
                        questionerId: result.qerid,
                        questionText: result.qest,
                        answer: result.ans,
                        questioner: result.qername,
                        answerer: result.aername,
                        likes: result.likes,
                        relatedMaterials: result.relMat.split(' ')
                    };
                    courseInfo.courseQuestions.push(question);
                }
                return courseInfo;
            }
        );
}

function completeMaterial(req,res){
    const completion = req.body;
    const userId = req.user.id;
    connectionPool
        .getConnection()
        .then(
            function (conn){
                    conn
                        .query("start transaction")
                        .then(
                            function (){
                                return conn
                                    .execute("insert into CompletedMaterial values (?,?,curtime())",[completion.materialId,userId]);
                            }
                        )
                        .then(
                            function () {
                                if (completion.courseCompleted) {
                                    conn
                                        .execute("update CourseTaken set CompletedTimestamp = curtime() where StudentId = ? and CourseId = ?", [userId, completion.courseId])
                                        .then(
                                            function () {
                                                return conn.query("commit");
                                            }
                                        )
                                        .then(
                                            function () {
                                                res.sendStatus(200);
                                            }
                                        );
                                } else {
                                    conn
                                        .query("commit")
                                        .then(
                                            function (){
                                                res.sendStatus(200);
                                            }
                                        )
                                }
                            }
                        );
                }
        )
}

function enrollStudent(req,res){
    const userId = req.body.userId;
    const courseId = req.body.courseId;
    connectionPool
        .getConnection()
        .then(
            function (conn){
                conn
                    .execute("insert into CourseTaken (StudentId,CourseId,ConfirmationCode,PaymentTimestamp) values (?,?,1000,curtime())",[userId,courseId])
                    .then(
                        function (){
                            conn.release();
                            res.sendStatus(200);
                        }
                    );
            }
        );
}

function getAllCourses(req,res){
    const courses = [];
    connectionPool
        .getConnection()
        .then(
            function (conn){
                return conn.query("select * from Course")
                    .then(
                        function ([rows,fields]){
                            conn.release();
                            for (const row in rows){
                                const course = {
                                    id: rows[row].CourseId,
                                    name: rows[row].Name
                                };
                                courses.push(course);
                            }
                            res.json(courses);
                        }
                    );
            }
        );
}







