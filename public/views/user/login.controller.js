(function(){
    // "use strict";
    angular
        .module("TrainlyIo")
        .controller("LoginController",LoginController);

    function LoginController(UserService,$location, $rootScope) {
        var vm = this;
        vm.login = login;
        vm.message = null;
        console.log('Here!');

        function init() {
        }

        init();

        function login(user) {
            if(!user){
                vm.message = "Please enter login details";
                return;
            }
            UserService.login(user)
                .then(function(response) {
                    console.log(response);
                    //$rootScope.currentUser = response.data;
                    $location.url("/user");
                    },
                    function(err){
                        vm.message = "username or password not found";
                    }
                );

        }
    }
})();

