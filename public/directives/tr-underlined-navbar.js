(function (){
    angular
        .module('TrainlyIo')
        .directive('trUnderlinedNavbar',trUnderlinedNavbar);

    function trUnderlinedNavbar(){
        return {
            link: linkFunction
        };

        function linkFunction(scope,element){
            var jNavbar = angular.element(element);
            jNavbar.find('a').hover(
                function(){
                    angular.element(this)
                        .children('.tr-navbar-item-underline')
                        .show({effect: 'scale', direction: 'horizontal',duration: 300});
                },
                function(){
                    angular.element(this)
                        .children('.tr-navbar-item-underline')
                        .hide({effect: 'scale', direction: 'horizontal',duration: 300});
                }
            );
        }
    }
})();