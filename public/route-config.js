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
                controllerAs: 'model',
                resolve:
                    {
                        CurrentUser: getCurrentUser
                    }
            })
            .when('/course/:courseId',{
                templateUrl: 'views/course/course.view.client.html',
                controller: 'CourseController',
                controllerAs: 'model'
            })
            .when('/search', {
                templateUrl: 'views/courselist/search.view.html',
                controller: 'SearchController',
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
            .when('/statistics',{
                templateUrl: 'views/statistics/statistics.view.client.html',
                controller: 'StatisticsController',
                controllerAs: 'model'
            });

        function getCurrentUser($q,$location,UserService){
            const deferred = $q.defer();
            UserService
                .checkLoggedIn()
                .then(
                    function(currentUser){
                        deferred.resolve(currentUser);
                    },
                    function (err){
                        deferred.reject();
                        $location.url('/');
                    }
                );
            return deferred.promise;
        }
    }
})();