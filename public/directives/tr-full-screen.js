(function (){
    angular
        .module('TrainlyIo')
        .directive('trFullScreen',trFullScreen);

    function trFullScreen($window){
        return {
            link: linkFunction
        };

        function linkFunction(scope,element){
            angular.element(element).css('min-height',angular.element($window).height());
        }
    }
})();