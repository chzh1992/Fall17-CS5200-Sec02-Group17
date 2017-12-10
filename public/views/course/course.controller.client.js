(function (){
    angular
        .module('TrainlyIo')
        .controller('CourseController',CourseController);

    function CourseController($sce,$scope,CourseService,UserService){
        const model = this;

        function init(){

            UserService
                .checkLoggedIn()
                .then(
                    function (user){
                        model.user = user;
                    },
                    function (err){
                        model.user = null;
                    }
                );

            
            // $scope.lastCompleted = 0;
            // model.courseMaterials = [
            //     {
            //         type: "DownloadableFile",
            //         path: "https://course.ccs.neu.edu/cs5200f17/",
            //         size: "10mb",
            //         fileType: "A",
            //         ordinal: "1"
            //     },
            //     {
            //         type: "Link",
            //         isVideo: false,
            //         url: "https://course.ccs.neu.edu/cs5200f17/",
            //         ordinal: "2"
            //     },
            //     {
            //         type: "Link",
            //         isVideo: true,
            //         url: $sce.trustAsResourceUrl("https://www.youtube.com/embed/PIQSEq6tEVs"),
            //         ordinal: "3"
            //     },
            //     {
            //         type: "Post",
            //         content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
            //         ordinal: "4"
            //     }
            // ];
        }
        init();

        model.test = test;

        function test(){
            $scope.lastCompleted += 1;
        }

    }
})();