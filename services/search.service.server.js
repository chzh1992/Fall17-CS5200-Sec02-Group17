const app = require('../express-config');
const connectionPool = require('../mysql2-config');


    app.get('/api/courselist/search',courseList);


    function courseList(req,res) {

        connectionPool
            .getConnection()
            .then(
                function (conn){
                    var selectQuery = 'SELECT CourseId , Name FROM Course';
                    conn
                        .query(selectQuery)
                        .then(
                                function (courses){
                                    var allCourses = [];
                                    for (var row in courses[0]){

                                        var course = {
                                            id: courses[0][row].CourseId,
                                            name: courses[0][row].Name
                                        };
                                        allCourses.push(course);
                                    }
                                    res.json(allCourses);
                                },
                                function (err){
                                    conn.release();
                                    console.log(err);
                                    res.sendStatus(500);
                                }
                        );
                },
                function (err){
                    console.log(err);
                    res.sendStatus(500);
                }
            )
    }







