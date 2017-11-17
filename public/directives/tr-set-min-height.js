(function (){
    angular
        .module('TrainlyIo')
        .directive('trSetMinHeight',trSetMinHeight);

    function trSetMinHeight(){
        return {
            link: linkFunction
        };

        function linkFunction(scope,element,attrs){
            var minHeight = attrs.trSetMinHeight;
            angular.element(element).css("min-height",minHeight);
        }
    }
})();