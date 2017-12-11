(function (){
    angular
        .module('TrainlyIo')
        .controller('HomeController',HomeController);

    function HomeController($http,$route,UserService){
        const model = this;

        model.logout = logout;

        function init(){
            UserService
                .checkLoggedIn()
                .then(
                    function (user){
                        model.user = user;
                    }
                );
        }
        init();

        function logout(){
            UserService
                .logout()
                .then(
                    function (doc){
                        $route.reload();
                    }
                )
        }
    }
})();