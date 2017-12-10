(function(){
       "use strict";
        angular.module("TrainlyIo")
        .controller("RegisterController",RegisterController);

    function RegisterController(UserService,$location,$scope, $window) {

        var vm=this;
        vm.register=register;
        vm.message=null;

        function init(){

        }
        init();

        function register(user){

            if (!user) {
                vm.message = "Please fill in the required details";
                return;
            }

            if (!user.firstName) {
                vm.message = "Please enter a valid first name";
                return;
            }

            if (!user.lastName) {
                vm.message = "Please enter a valid last name";
                return;
            }

            if (!user.email) {
                vm.message = "Enter an emailID";
                return;
            }

            if (!user.phone1) {
                vm.message = "Please enter a valid phone number";
                return;
            }

            if (!user.city) {
                vm.message = "Please enter a city";
                return;
            }
            if (!user.street) {
                vm.message = "Please enter a street";
                return;
            }
            if (!user.country) {
                vm.message = "Please enter a country";
                return;
            }

            if (!user.postalcode) {
                vm.message = "Please enter a postal code";
                return;
            }

            if (user.password == null) {
                vm.message = "Please enter a password";
                return;
            }

            UserService.register(user)
                .then(function (user) {
                    if(user.data === 'OK') {
                        $location.url("/");
                    }
                    else{
                        vm.message="Email/Username already exists";
                    }
                },
                    function (error){
                        console.log(error);
                    })

        }
    }


})();

