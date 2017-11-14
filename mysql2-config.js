const mysql = require('mysql2');
const bluebird = require('bluebird');

const pool = mysql.createPoolPromise(
    {
        connectionLimit: process.env.MYSQL_CONNECTION_LIMIT,
        host: process.env.MYSQL_HOST,
        user: process.env.MYSQL_USER,
        password: process.env.MYSQL_PASSWORD,
        Promise: bluebird
    }
);
module.exports = pool;