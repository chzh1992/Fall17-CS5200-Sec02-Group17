(function(){

    angular
        .module("TrainlyIo")
        .factory("UserService",UserService);

    function UserService($http){

        var model = {
            login:login,
            register: register
        };
        return model;

        function login(user) {
            return $http.post("/api/user/login",user);
        }

        function register(user){
            return $http.post("/api/user/register", user);
        }

    }
})();


