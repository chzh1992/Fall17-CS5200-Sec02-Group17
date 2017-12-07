(function (){
    angular
        .module('TrainlyIo')
        .factory('UserService',UserService);

    function UserService($http){
        return {
            checkLoggedIn: checkLoggedIn,
            getUserCourses: getUserCourses
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

        function getUserCourses(){
            const url = '/api/user/courses';
            return $http.get(url)
                .then(
                    function (response){
                        return response.data;
                    }
                );
        }
    }
})();