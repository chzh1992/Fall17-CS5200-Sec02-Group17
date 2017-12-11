const app = require('../express-config');
const passport = require('passport');
const connectionPool = require('../mysql2-config');
const bcrypt = require('bcrypt');

    app.post('/api/user/login', passport.authenticate('local'), login);
    app.post('/api/user/register',register);


    function login(req, res) {
        console.log(req);
        var user = req.user;
        res.json(user);
    }

    function register(req,res) {

        var user = req.body;

        console.log("-----");
        console.log(user);


        var email = user.email;
        var firstName = user.firstName;
        var lastName =  user.lastName;
        var password =  user.password;
        var street = user.street;
        var city = user.city;
        var country = user.country;
        var postalCode = user.postalcode;
        var profilePicture = user.profilePicture;
        var isFaculty = user.isFaculty;
        var isAdmin = user.isAdmin;
        var phone1 = user.phone1;
        var phone2 = user.phone2;
        var phone3 = user.phone3;
        var phone4 = user.phone4;

        var salt = bcrypt.genSaltSync(10);
        var encryptedPassword = bcrypt.hashSync(password,salt);


        if(isFaculty)
            isFaculty = 1;
        else
            isFaculty = 0;

        if(isAdmin)
            isAdmin = 1;
        else
            isAdmin = 0;


        connectionPool
            .getConnection()
            .then(
                function (conn){
                    var selectQuery = 'SELECT email FROM user WHERE email = ?';
                    conn
                        .query(selectQuery,[email])
                        .then(
                            function (user1,user2){

                                console.log("User", arguments[0][0])

                                if(arguments[0][0] != '')
                                {
                                    var message = "Email already taken";
                                    console.log(message);
                                    res.status(200).send(null);
                                }
                                else
                                {
                                     var insertQuery = "INSERT INTO user (FirstName, LastName, Email, Password, Street, " +
                                        "City, Country, PostalCode, ProfilePic, FacultyFlag, AdminFlag) VALUES " +
                                        "(?,?,?,?,?,?,?,?,?,?,?)";

                                    conn.query(insertQuery,[firstName,lastName,email,encryptedPassword,street,city,country,
                                        postalCode,profilePicture,isFaculty,isAdmin])
                                        .then(
                                            function(){
                                                var alert = "Inserted";
                                                console.log(alert);
                                            }
                                        )
                                        .then(
                                            function(){
                                                conn.query("SELECT userId from user where email = ?",[email])
                                                .then(
                                                    function (user) {
                                                        //console.log(userid)
                                                        var userid = user[0][0]['userId'];
                                                        var insertPhoneQuery = "INSERT INTO Phone (UserId, PhoneNumber) " +
                                                            "VALUES ?" ;
                                                        var values = [];
                                                        var phones = [];

                                                        phones.push(phone1);

                                                        values.push([userid,phone1]);

                                                        if (phone2) {
                                                            if(phones.indexOf(phone2) == -1){
                                                                phones.push(phone2);
                                                                values.push([userid,phone2]);
                                                            }
                                                        }
                                                        if (phone3) {
                                                            if(phones.indexOf(phone3) == -1){
                                                                phones.push(phone3);
                                                                values.push([userid,phone3]);
                                                            }
                                                        }
                                                        if (phone4) {
                                                            if(phones.indexOf(phone4) == -1){
                                                                phones.push(phone3);
                                                                values.push([userid,phone4]);
                                                            }
                                                        }

                                                        console.log(values);
                                                        console.log("phones numbers ..")
                                                        console.log(phones);

                                                        // phones = phones.keys();
                                                        //for (var i=0; i<phones.length; i++) {
                                                        //    values.push([userid, phones[i]]);
                                                        //}

                                                        conn.query(insertPhoneQuery,[values])
                                                            .then(
                                                            function(){
                                                                var alert = "Inserted Phone Number";
                                                                console.log(alert);
                                                            }
                                                            )
                                                    }
                                                )
                                            }
                                        )
                                    res.status(200).send('OK');
                                }
                            }
                        );
                },
                function (err){
                    console.log(err);
                    res.sendStatus(500);
                }
            )
    }







