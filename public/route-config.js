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
            })
            .when('/user',{
                templateUrl: 'views/user/user.view.client.html',
                controller: 'UserController',
                controllerAs: 'model'
            })
            .when('/course',{
                templateUrl: 'views/course/course.view.client.html',
                controller: 'CourseController',
                controllerAs: 'model'
            });
    }
})();