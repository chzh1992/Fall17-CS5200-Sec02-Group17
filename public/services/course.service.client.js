(function (){
    angular
        .module('TrainlyIo')
        .factory('CourseService',CourseService);

    function CourseService($http){
        return {
            getCourseInfo: getCourseInfo
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

    }
})();