(function(){
    angular
        .module("TrainlyIo")
        .factory("SearchService", SearchService);

    function SearchService($http) {
        var model = {
            search:search
        };
        return model;


        function search(){
            return $http.get('/api/courselist/search');
        };



    }
})();