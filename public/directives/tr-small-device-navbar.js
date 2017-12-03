(function (){
    angular
        .module('TrainlyIo')
        .directive('trSmallDeviceNavbar',trSmallDeviceNavbar);

    function trSmallDeviceNavbar($window){
        return {
            link: linkFunction
        };



        function linkFunction(scope,element){
            var jNavbar = angular.element(element);
            if ($window.innerWidth > 600){
                jNavbar.css('display','none');
            }
            angular.element($window).resize(changeVisibility);
            jNavbar.children('.tr-navbar-opener').click(openMenu);
            jNavbar.children('.tr-navbar-closer').click(closeMenu);


            function changeVisibility(){
                if ($window.innerWidth < 600){
                    jNavbar.css('display','block');
                } else{
                    jNavbar.css('display','none');
                }
            }

            function openMenu(){
                jNavbar.children('.tr-collapsed-navbar-menu').fadeIn();
                jNavbar.children('.tr-navbar-opener').css('display','none');
                jNavbar.children('.tr-navbar-closer').css('display','block');
            }

            function closeMenu(){
                jNavbar.children('.tr-collapsed-navbar-menu').fadeOut();
                jNavbar.children('.tr-navbar-opener').css('display','block');
                jNavbar.children('.tr-navbar-closer').css('display','none');
            }
        }
    }
})();