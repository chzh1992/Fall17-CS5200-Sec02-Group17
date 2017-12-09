(function (){
    angular
        .module('TrainlyIo')
        .directive('trCourseMaterialList',trCourseMaterialList);

    function trCourseMaterialList(){
        return {
            link: linkFunction
        };

        function linkFunction(scope,element){
            const courseMaterialPanes = angular.element(element).find('li');
            scope.$watch('lastCompleted',function(nv,ov){
                if (ov === undefined){
                    courseMaterialPanes.each(function (i){
                        if (i > nv){
                            angular.element(this).find('.tr-course-material').hide();
                            angular.element(this).
                        }
                    });
                } else{

                }
            });
        }
    }

})();