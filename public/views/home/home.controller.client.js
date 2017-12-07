(function (){
    angular
        .module('TrainlyIo')
        .controller('HomeController',HomeController);

    function HomeController($http,$location){
        const model = this;

        model.login = login;

        function login(){
            $http
                .post('/testLogin',{username: 'Student1-zc@group17.com',password:'123'})
                .then(
                    function (status){
                        $location.url('/user');
                    }
                );
        }
    }
})();