(function (){
    angular
        .module('TrainlyIo')
        .controller('UserController',UserController);

    function UserController(UserService,CurrentUser){
        const model = this;

        function init(){
            model.user = CurrentUser;
            UserService
                .getUserCourses()
                .then(
                    function (courses){
                        model.courses = courses;
                    }
                );
            if (model.user.isAdmin)[

            ]
            model.test = 0;
        }
        init();
    }
})();