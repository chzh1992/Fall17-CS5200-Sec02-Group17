(function (){
    angular
        .module('TrainlyIo')
        .controller('StatisticsController',StatisticsController);

    function StatisticsController(ReportService){
        const model = this;

        model.getActivityReport = getActivityReport;

        function getActivityReport(courseId){
            ReportService
                .getActivityReport(courseId)
                .then(
                    function (report){
                        model.activityReport = report;
                    }
                );
        }
    }
})();