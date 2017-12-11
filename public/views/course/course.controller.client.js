(function (){
    angular
        .module('TrainlyIo')
        .controller('CourseController',CourseController);

    function CourseController($sce,$scope,CourseService,UserService,$routeParams,$location,$route){
        const model = this;

        model.completeMaterial = completeMaterial;
        model.enroll = enroll;
        model.logout = logout;

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

            CourseService
                .getCourseInfo($routeParams['courseId'])
                .then(
                    function (courseInfo){
                        model.course = courseInfo.course;
                        model.creators = courseInfo.creators;
                        model.courseMaterials = courseInfo.courseMaterials;
                        model.courseQuestions = courseInfo.courseQuestions;
                        if (courseInfo.userStatus){
                            model.userStatus = courseInfo.userStatus;
                            $scope.lastCompleted = courseInfo.userStatus.lastCompleted;
                        }
                        $scope.courseJustCompleted = false;

                        if (!model.course.icon){
                            model.course.icon = "../thom-schneider-108615.jpg";
                            /*Photo by Thom Schneider on Unsplash*/
                        }
                    }
                )
            
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

        // model.test = test;
        //
        // function test(){
        //     $scope.courseJustCompleted = true;
        // }

        function completeMaterial(material){
            if (material.ordinal > $scope.lastCompleted){
                const completion = {
                    materialId: material.id,
                    courseCompleted: material.ordinal == model.courseMaterials.length,
                    courseId: model.course.id
                };
                CourseService
                    .completeMaterial(completion)
                    .then(
                        function (doc){
                            $scope.lastCompleted += 1;
                            if ($scope.lastCompleted == model.courseMaterials.length){
                                $scope.courseJustCompleted = true;
                            }
                        }
                    )
            }
        }

        function enroll(userId){
            CourseService
                .enroll(userId,model.course.id)
                .then(
                    function (doc){
                        $route.reload();
                    }
                )
        }

        function logout(){
            UserService
                .logout()
                .then(
                    function (doc){
                        $location.url('/');
                    }
                )
        }
    }
})();