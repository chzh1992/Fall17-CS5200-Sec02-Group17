(function (){
    angular
        .module('TrainlyIo')
        .directive('trActivityReport',trActivityReport);

    function trActivityReport(){
        return {
            link: linkFunction
        };

        function linkFunction(scope,element){
            scope.$watch('model',function (nv,ov){
                if (nv.activityReport !== ov.activityReport){
                    const ctx = angular.element(element).find('#activity-canvas');
                    const data_labels = [];
                    const datasets_data = [];
                    for (var f in nv.activityReport){
                        data_labels.push(nv.activityReport[f].name);
                        datasets_data.push(nv.activityReport[f].answerNum);
                    }
                    const pie = new Chart(ctx,{
                        type: 'pie',
                        data: {
                            datasets: [{
                                label: 'Activity',
                                data: datasets_data,
                                backgroundColor: [
                                    "red",
                                    "orange",
                                    "yellow",
                                    "green",
                                    "blue",
                                    "indigo",
                                    "violet"
                                ]}],
                            labels: data_labels
                        }
                    });
                }
            },true);
        }
    }
})();