(function (){
    angular
        .module('TrainlyIo')
        .controller('UserController',UserController);

    function UserController(UserService,CurrentUser){
        const model = this;

        model.assessFaculty = assessFaculty;
        model.getAllUsers = getAllUsers;
        model.grantAdminPower = grantAdminPower;

        function init(){
            model.user = CurrentUser;
            model.actionDone = false;
            UserService
                .getAccountInfo()
                .then(
                    function (accountInfo){
                        model.courses = accountInfo.courses;
                        model.history = accountInfo.history;
                        model.total = accountInfo.total;
                        model.validationRequests = accountInfo.validationRequests;
                    }
                );
        }
        init();

        function assessFaculty(facultyId,passed){
            model.actionDone = true;
            UserService
                .assessFaculty(facultyId,passed)
                .then(
                    function (doc){
                        model.operationSucceeded = true;
                        for (var i = 0; i< model.validationRequests.length; i++){
                            var request = model.validationRequests[i];
                            if (request.fromId == facultyId){
                                request.processed = true;
                                break;
                            }
                        }
                    },
                    function (err){
                        model.operationSucceeded = false;
                    }
                );
        }

        function getAllUsers(){
            UserService
                .getAllUsers()
                .then(
                    function (allUsers){
                        model.allUsers = allUsers;
                    }
                );
        }

        function grantAdminPower(userId){
            model.actionDone = true;
            UserService
                .grantAdminPower(userId)
                .then(
                    function (doc){
                        for (var i = 0; i < model.allUsers.length; i++){
                            if (model.allUsers[i].id == userId){
                                model.allUsers[i].isAdmin = true;
                                break;
                            }
                        }
                        model.operationSucceeded = true;
                    },
                    function (err){
                        model.operationSucceeded = false;
                    }
                )
        }
    }
})();