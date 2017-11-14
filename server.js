if (process.env.PORT === undefined){
    require('./env');
}

const connectionPool = require('./mysql2-config');

const app = require('./express-config');
const session = require('express-session');
const passport = require('passport');

app.use(app.express.json());
app.use(app.express.urlencoded({extended: true}));

var sessionOption = {
    secret: "Group 17",
    resave: false,
    saveUninitialized: false
};
app.use(session(sessionOption));

app.use(passport.initialize());
app.use(passport.session());

app.get('/',function(req,res){
    connectionPool
        .getConnection()
        .then(
            function (conn) {
                var result = conn.query(
                    'SELECT * FROM information_schema.columns WHERE table_schema = \'' + process.env.MYSQL_DATABASE_NAME +'\''
                );
                conn.release();
                return result;
            }
        )
        .then(
            function ([rows,fields]){
                res.write('<h1><a style="color:red" onclick="alert(\'Under Construction\')" href="">Trainly.io</a></h1>');
                for(var row in rows){
                    res.write(JSON.stringify(rows[row]));
                }
                res.end();
            }
        )
        .catch(
            function (err){
                console.log(err);
            }
        );
});

var port = process.env.PORT || 3000;
app.listen(port);

process.on('exit',function(){
    connectionPool.end(function (err){
        console.error(err.stack);
    });
});




