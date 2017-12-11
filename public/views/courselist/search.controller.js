(function(){
    angular.module("TrainlyIo")
        .controller("SearchController",SearchController);

    function SearchController(CourseService){
        const vm = this;

        function init(){

            // SearchService.search()
            // .then(function (response) {
            //     renderSearchResult(response.data);
            // },
            // function (error){
            //     console.log(error);
            // })

            CourseService
                .getAllCourses()
                .then(
                    function (courses){
                        vm.courses = courses;
                    }
                )
        }
        init();
    }
})();