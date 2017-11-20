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
                    jQueyrObj.css('color','red');
                    jQueyrObj.css('background-color','white');
                    jQueyrObj.find('#home-navbar li').hover(
                        function (){
                            angular.element(this)
                                .children('.tr-navbar-item-underline')
                                .show({effect: 'scale', direction: 'horizontal',duration: 300});
                        },
                        function (){
                            angular.element(this)
                                .children('.tr-navbar-item-underline')
                                .hide({effect: 'scale', direction: 'horizontal',duration: 300});
                        }
                    );
                    jQueyrObj.find('#home-navbar a').css('color','red');
                    jQueyrObj.find('.tr-navbar-opener').css('color','red');
                    jQueyrObj.find('.tr-navbar-closer').css('color','red');
                } else{
                    jQueyrObj.removeAttr('style');
                    jQueyrObj.find('#home-navbar li').unbind('mouseenter mouseleave');
                    jQueyrObj.find('#home-navbar a').removeAttr('style');
                    jQueyrObj.find('.tr-navbar-opener').removeAttr('style');
                    jQueyrObj.find('.tr-navbar-closer').removeAttr('style');
                }
            }
        }
    }
})();