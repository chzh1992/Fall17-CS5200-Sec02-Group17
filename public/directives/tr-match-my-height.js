(function (){
    angular
        .module('TrainlyIo')
        .directive('trMatchMyHeight',trMatchMyHeight);

    function trMatchMyHeight(){
        return {
            link: linkFunction
        };

        function linkFunction(scope,element){
            var jqueryElement = angular.element(element);
            angular.element.fn.matchHeight._apply(jqueryElement.children(),{});
        }
    }
})();