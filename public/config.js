(function (){
    angular
        .module('TrainlyIo')
        .config(Config);

    function Config($routeProvider){
        $routeProvider
            .when('/',{
                template: 'views/home/hoem.view.client.html',
                controller: 'HomeController',
                controllerAs: 'model'
            })
            .otherwise('/');
    }
})();