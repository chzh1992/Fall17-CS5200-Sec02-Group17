(function (){
    angular
        .module('TrainlyIo')
        .factory('ReportService',ReportService);

    function ReportService($http){
        return {
            getActivityReport: getActivityReport
        };

        function getActivityReport(courseId){
            return $http.get('/api/report/activity/' + courseId)
                .then(
                    function (response){
                        return response.data;
                    }
                );
        }
    }
})();