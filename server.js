require('./passport-config');
const connectionPool = require('./mysql2-config');

const app = require('./express-config');
const session = require('express-session');
const passport = require('passport');
const express = require('express');

app.use(express.json());
app.use(express.urlencoded({extended: true}));

const sessionOption = {
    secret: "Group 17",
    resave: false,
    saveUninitialized: false
};
app.use(session(sessionOption));

app.use(passport.initialize());
app.use(passport.session());

// configure a public directory to host static content
app.use(express.static(__dirname + '/public'));

// app.get('/',function(req,res){
//     connectionPool
//         .getConnection()
//         .then(
//             function (conn) {
//                 var result = conn.query(
//                     'SELECT * FROM information_schema.columns WHERE table_schema = \'' + process.env.MYSQL_DATABASE_NAME +'\''
//                 );
//                 conn.release();
//                 return result;
//             }
//         )
//         .then(
//             function ([rows,fields]){
//                 res.write('<h1><a style="color:red" onclick="alert(\'Under Construction\')" href="">Trainly.io</a></h1>');
//                 for(var row in rows){
//                     res.write(JSON.stringify(rows[row]));
//                 }
//                 res.end();
//             }
//         )
//         .catch(
//             function (err){
//                 console.log(err);
//             }
//         );
// });q


require('./services/user.service.server');
require('./services/course.service.server');
require('./services/report.service.server');

const port = process.env.PORT || 3000;
app.listen(port);

process.on('exit',function(){
    connectionPool.end(function (err){
        console.error(err.stack);
    });
});




