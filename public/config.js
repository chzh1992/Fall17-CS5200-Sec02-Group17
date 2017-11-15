(function (){
    angular
        .module('TrainlyIo')
        .config(Config);

    function Config($routeProvider){
        $routeProvider
            .when('/',{
                templateUrl: 'views/home/home.view.client.html',
                controller: 'HomeController',
                controllerAs: 'model'
            });
    }
})();