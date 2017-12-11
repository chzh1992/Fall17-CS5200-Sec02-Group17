const mysql = require('mysql2');
const bluebird = require('bluebird');

var pool;

if (process.env.PORT === undefined){
        pool = mysql.createPoolPromise(
            {
                connectionLimit: 10,
                host: "127.0.0.1",
                user: "root",
                password: "123456",
                database: "trainly_group17",
                Promise: bluebird
            }
        );
} else{
    pool = mysql.createPoolPromise(
        {
            connectionLimit: process.env.MYSQL_CONNECTION_LIMIT,
            host: process.env.MYSQL_HOST,
            user: process.env.MYSQL_USER,
            password: process.env.MYSQL_PASSWORD,
            Promise: bluebird
        }
    );
}

module.exports = pool;