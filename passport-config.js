const passport = require('passport');
const passportLocal = require('passport-local');
const connectionPool = require('./mysql2-config');

function localStrategy(username,password,done){
    connectionPool
        .getConnection()
        .then(
            function(conn){

            }
        );
}