const app = require('../express-config');
const connectionPool = require('../mysql2-config');

app.get('/api/course/:courseId',getCourseInfo);

function timeStringToDisplay(jsDate){
    return jsDate ? [jsDate.getFullYear(),jsDate.getMonth()+1,jsDate.getDate()].join('-') : null;
}

function getCourseInfo(req,res){
    const courseId = req.params['courseId'];
    var courseInfo = {};
    connectionPool
        .getConnection()
        .then(
            function(conn){
                conn
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
                    .then(
                        function (courseInfo){
                            addCourseCreators(courseInfo,conn,courseId)
                                .then(
                                    function (courseInfo){

                                    }
                                )
                        }
                    )
            }
        )
}

function addCourseCreators(courseInfo,conn,courseId){

}



