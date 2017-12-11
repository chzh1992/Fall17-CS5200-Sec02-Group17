(function (){
    angular
        .module('TrainlyIo')
        .directive('trHomeHeader',trHomeHeader);

    function trHomeHeader($window){
        return {
            link: linkFunction
        };

        function linkFunction(scope,element){
            var jHeader = angular.element(element);
            var jWindow = angular.element($window);
            jWindow.scroll(changeStyle);

            function changeStyle(){
                if (jWindow.scrollTop() > 0){
                    jHeader.css('color','red');
                    jHeader.css('background-color','white');
                    jHeader.find('#home-navbar a').hover(
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
                    jHeader.find('#home-navbar a').css('color','red');
                    jHeader.find('.tr-navbar-opener').css('color','red');
                    jHeader.find('.tr-navbar-closer').css('color','red');
                } else{
                    jHeader.removeAttr('style');
                    jHeader.find('#home-navbar li').unbind('mouseenter mouseleave');
                    jHeader.find('#home-navbar a').removeAttr('style');
                    jHeader.find('.tr-navbar-opener').removeAttr('style');
                    jHeader.find('.tr-navbar-closer').removeAttr('style');
                }
            }
        }
    }
})();