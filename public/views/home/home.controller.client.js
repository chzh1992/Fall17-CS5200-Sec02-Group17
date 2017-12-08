(function (){
    angular
        .module('TrainlyIo')
        .controller('HomeController',HomeController);

    function HomeController($http,$location){
        const model = this;

        model.login = login;

        function login(){
            $http
                .post('/testLogin',{username: 'user1@gmail.com',password:'user1'})
                .then(
                    function (status){
                        $location.url('/user');
                    }
                );
        }
    }
})();