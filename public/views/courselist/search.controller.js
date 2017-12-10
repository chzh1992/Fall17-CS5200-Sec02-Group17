(function(){
    "use strict";
    angular.module("TrainlyIo")
        .controller("SearchController",SearchController);

    function SearchController(SearchService){
        var vm = this;

        function init(){

            SearchService.search()
            .then(function (response) {
                renderSearchResult(response.data);
            },
            function (error){
                console.log(error);
            })

        }
        init();

        function renderSearchResult(response){

            vm.searchResult=response;

        }

    }
})();