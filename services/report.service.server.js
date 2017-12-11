const app = require('../express-config');
const connectionPool = require('../mysql2-config');

app.get('/api/report/activity/:courseId',getActivityReport);

function getActivityReport(req,res){
    const courseId = req.params['courseId'];
    connectionPool
        .getConnection()
        .then(
            function (conn){
                conn
                    .execute("select f.fId as FacultyId, f.ffName as FirstName, f.flName as LastName, a.aNum as AnsweredQuestions " +
                             "from (select Faculty.FacultyId as fId, User.FirstName as ffName, User.LastName as flName " +
                             "from Faculty inner join CourseCreated on Faculty.FacultyId = CourseCreated.FacultyId " +
                             "inner join Course on CourseCreated.CourseId = Course.CourseId " +
                             "inner join User on Faculty.FacultyId = User.UserId " +
                             "where Course.CourseId = ?) f left join " +
                             "(select CourseQuestion.AnswererId as aId, count(CourseQuestion.AnswererId) as aNum " +
                             "from CourseQuestion inner join Course on CourseQuestion.CourseId = Course.CourseId " +
                             "where Course.CourseId = ? " +
                             "group by CourseQuestion.AnswererId) a " +
                             "on f.fId = a.aId " +
                             "order by AnsweredQuestions desc, LastName asc, FirstName asc",[courseId,courseId])
                    .then(
                        function ([rows,fields]){
                            conn.release();
                            const result = [];
                            for (const row in rows){
                                const faculty = {
                                    name: rows[row].FirstName + ' ' + rows[row].LastName,
                                    answerNum: rows[row].AnsweredQuestions ? rows[row].AnsweredQuestions : 0
                                };
                                result.push(faculty);
                            }
                            res.json(result);
                        }
                    )
            }
        )
}












