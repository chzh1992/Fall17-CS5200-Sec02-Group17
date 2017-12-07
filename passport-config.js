const passport = require('passport');
const passportLocal = require('passport-local');
const connectionPool = require('./mysql2-config');

function localStrategy(username,password,done){
    connectionPool
        .getConnection()
        .then(
            function(conn){
                conn
                    .execute("select UserId as userId, Password as password " +
                              "from `User` " +
                              "where Email=?", [username])
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
                   .query("select *, concat(User.FirstName, ' ', User.LastName) as Name " +
                          "from `User` left join " +
                          "(select Faculty.FacultyId as fid, Faculty.Title as title, Faculty.Affiliation as aff, " +
                          "Faculty.WorkWebsite as ws, concat(User.FirstName,' ',User.LastName) as vname, " +
                          "Faculty.FacultyTimestamp as fts " +
                          "from Faculty inner join `User` on Faculty.ValidatorId = User.UserId) fct " +
                          "on User.UserId = fct.fid left join " +
                          "(select Admin.AdminId as aid, concat(User.FirstName,' ',User.LastName) as gname, " +
                          "Admin.AdminTimestamp as ats " +
                          "from Admin inner join `User` on Admin.GrantorId = User.UserId) adm " +
                          "on User.UserId = adm.aid " +
                          "where User.UserId = " + id)
                   .then(
                       function([rows,fields]){
                           conn.release();
                           const result = rows[0];
                           const user = {
                               id: result.UserId,
                               name: result.Name,
                               email: result.Email,
                               street: result.Street,
                               city: result.City,
                               country: result.Country,
                               postalCode: result.PostalCode,
                               profilePic: result.ProfilePic,
                               isFaculty: result.FacultyFlag == 1,
                               isAdmin: result.AdminFlag == 1,
                               title: result.title,
                               affiliation: result.aff,
                               workWebsite: result.ws,
                               validator: result.vname,
                               validatedOn: result.fts,
                               grantor: result.gname,
                               grantedOn: result.ats
                           };
                           done(null,user);
                       },
                       function (err){
                           done(err);
                       });
            }
        );
});






