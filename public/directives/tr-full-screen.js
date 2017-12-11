(function (){
    angular
        .module('TrainlyIo')
        .directive('trFullScreen',trFullScreen);

    function trFullScreen($window){
        return {
            link: linkFunction
        };

        function linkFunction(scope,element){
            angular.element(element).height(angular.element($window).height());
        }
    }
})();