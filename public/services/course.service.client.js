(function (){
    angular
        .module('TrainlyIo')
        .factory('CourseService',CourseService);

    function CourseService($http){
        return {
            getCourseInfo: getCourseInfo,
            completeMaterial: completeMaterial,
            enroll: enroll,
            getAllCourses: getAllCourses
        };

        function getCourseInfo(courseId){
            const url = "/api/course/" + courseId;
            return $http.get(url)
                .then(
                    function (response){
                        return response.data;
                    }
                );
        }

        function completeMaterial(completion){

            const url = "/api/material/complete";
            return $http.post(url,completion)
                .then(
                    function (response){
                        return response.data;
                    }
                );
        }

        function enroll(userId,courseId){
            const url = "/api/course/enroll";
            return $http.post(url,{userId: userId, courseId: courseId})
                .then(
                    function (response){
                        return response.data;
                    }
                );
        }

        function getAllCourses(){
            const url = '/api/course';
            return $http.get(url)
                .then(
                    function (response){
                        return response.data;
                    }
                );
        }
    }
})();