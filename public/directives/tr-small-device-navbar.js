(function (){
    angular
        .module('TrainlyIo')
        .directive('trSmallDeviceNavbar',trSmallDeviceNavbar);

    function trSmallDeviceNavbar($window){
        return {
            link: linkFunction
        };



        function linkFunction(scope,element){
            var jQueryObj = angular.element(element);
            if ($window.innerWidth > 600){
                jQueryObj.css('display','none');
            }
            angular.element($window).resize(changeVisibility);
            jQueryObj.children('.tr-navbar-opener').click(openMenu);
            jQueryObj.children('.tr-navbar-closer').click(closeMenu);


            function changeVisibility(){
                if ($window.innerWidth < 600){
                    jQueryObj.css('display','block');
                } else{
                    jQueryObj.css('display','none');
                }
            }

            function openMenu(){
                jQueryObj.children('.tr-hidden-navbar-menu').fadeIn();
                jQueryObj.children('.tr-navbar-opener').css('display','none');
                jQueryObj.children('.tr-navbar-closer').css('display','block');
            }

            function closeMenu(){
                jQueryObj.children('.tr-hidden-navbar-menu').fadeOut();
                jQueryObj.children('.tr-navbar-opener').css('display','block');
                jQueryObj.children('.tr-navbar-closer').css('display','none');
            }
        }
    }
})();