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
            .when('/login', {
                templateUrl: 'views/user/login.view.html',
                controller: 'LoginController',
                controllerAs: 'model'
            })
            .when('/register', {
                templateUrl: 'views/user/register.view.html',
                controller: 'RegisterController',
                controllerAs: 'model'
            })
            .when('/search', {
                templateUrl: 'views/courselist/search.view.html',
                controller: 'SearchController',
                controllerAs: 'model'
            })
            .when('/course',{
                templateUrl: 'views/course/course.view.client.html',
                controller: 'CourseController',
                controllerAs: 'model'
            });
    }
})();