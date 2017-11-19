(function (){
    angular
        .module('TrainlyIo')
        .directive('trHomeHeader',trHomeHeader);

    function trHomeHeader($window){
        return {
            link: linkFunction
        };

        function linkFunction(scope,element){
            var jQueyrObj = angular.element(element);
            var windowObj = angular.element($window);
            windowObj.scroll(changeStyle);

            function changeStyle(){
                if (windowObj.scrollTop() > 0){
                    jQueyrObj.children('#home-header').css('color','red');
                    jQueyrObj.children('#home-header').css('background-color','white');
                    jQueyrObj.find('#home-navbar a').css('color','red');
                    jQueyrObj.find('.tr-navbar-opener').css('color','red');
                    jQueyrObj.find('.tr-navbar-closer').css('color','red');
                } else{
                    jQueyrObj.children('#home-header').css('color','whitesmoke');
                    jQueyrObj.children('#home-header').css('background-color','transparent');
                    jQueyrObj.find('#home-navbar a').removeAttr('style');
                    jQueyrObj.find('.tr-navbar-opener').removeAttr('style');
                    jQueyrObj.find('.tr-navbar-closer').removeAttr('style');
                }
            }
        }
    }
})();