(function (){
    angular
        .module('TrainlyIo')
        .factory('UserService',UserService);

    function UserService($http){
        return {
            checkLoggedIn: checkLoggedIn,
            getAccountInfo: getAccountInfo,
            assessFaculty: assessFaculty,
            getAllUsers: getAllUsers,
            grantAdminPower: grantAdminPower,
            login: login,
            register: register,
            logout: logout
        };

        function checkLoggedIn(){
            const url = '/api/user/checkLoggedIn';
            return $http.get(url)
                .then(
                    function (response){
                        return response.data;
                    }
                );
        }

        function getAccountInfo(){
            const url = '/api/user/accountInfo';
            return $http.get(url)
                .then(
                    function (response){
                        return response.data;
                    }
                );
        }

        function assessFaculty(facultyId,passed){
            const url = '/api/admin/assessFaculty';
            const assessment = {
                facultyId: facultyId,
                passed: passed
            };
            return $http.put(url,assessment)
                .then(
                    function (response){
                        return response.data;
                    }
                );
        }

        function getAllUsers(){
            const url = '/api/admin/getAllUsers';
            return $http.get(url)
                .then(
                    function (response){
                        return response.data;
                    }
                );
        }

        function grantAdminPower(userId){
            const url = '/api/admin/grantAdminPower/' + userId;
            return $http.put(url)
                .then(
                    function (response){
                        return response.data;
                    }
                );
        }

        function login(user){
            const url = '/api/user/login';
            return $http.post(url,user);
        }

        function register(user){
            const url = '/api/user/register';
            return $http.post(url,user);
        }

        function logout(){
            const url = '/api/user/logout';
            return $http.post(url);
        }
    }
})();