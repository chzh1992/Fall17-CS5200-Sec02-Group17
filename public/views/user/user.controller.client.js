(function (){
    angular
        .module('TrainlyIo')
        .controller('UserController',UserController);

    function UserController(UserService,CurrentUser,$scope,$location){
        const model = this;

        model.assessFaculty = assessFaculty;
        model.getAllUsers = getAllUsers;
        model.grantAdminPower = grantAdminPower;
        model.logout = logout;

        function init(){
            model.user = CurrentUser;
            if (!model.user.profilePic){
                model.user.profilePic = '../avatar.png';
            }
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
            UserService
                .assessFaculty(facultyId,passed)
                .then(
                    function (doc){
                        $scope.operationSucceeded = true;
                        for (var i = 0; i< model.validationRequests.length; i++){
                            var request = model.validationRequests[i];
                            if (request.fromId == facultyId){
                                request.passed = passed;
                                break;
                            }
                        }
                    },
                    function (err){
                        $scope.operationSucceeded = false;
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
                        $scope.operationSucceeded = true;
                    },
                    function (err){
                        $scope.operationSucceeded = false;
                    }
                );
        }

        function logout(){
            UserService
                .logout()
                .then(
                    function (doc){
                        $location.url('/');
                    }
                )
        }

        // model.test = test;
        // function test(){
        //     if ($scope.operationSucceeded === undefined){
        //         $scope.operationSucceeded = true;
        //     } else{
        //         $scope.operationSucceeded = !$scope.operationSucceeded;
        //     }
        // }
    }
})();