const passport = require('passport');
const passportLocal = require('passport-local');
const connectionPool = require('./mysql2-config');

function localStrategy(username,password,done){
    connectionPool
        .getConnection()
        .then(
            function(conn){
                conn
                    .prepare("select UserId as userId, Password as password from `User` where Email=?")
                    .then(
                        function(statement) {
                            const result = statement.execute([username]);
                            return result;
                        })
                    .then(
                        function ([rows,fields]){
                            conn.release();
                            if (rows.length == 0){
                                return done(null,false);
                            }
                            if (rows[0].password != password){
                                return done(null,false);
                            }
                            return done(null,rows[0]);
                        },
                        function (err){
                            conn.release();
                            return done(err);
                        }
                    );
            }
        );
}

// function (err, rows, columns){
//     if (err) return done(err);

// });

passport.use(new passportLocal.Strategy(localStrategy));

passport.serializeUser(function(user, done) {
    done(null, user.userId);
});

passport.deserializeUser(function(id, done) {
    connectionPool
        .getConnection()
        .then(
            function(conn){
               conn
                   .query('select * from `User` where UserId = '+ id)
                   .then(
                       function([rows,fields]){
                           conn.release();
                           done(null,rows[0]);
                       });
            }
        );
});