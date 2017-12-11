(function (){
    angular
        .module('TrainlyIo')
        .directive('trCourseMaterial',trCourseMaterial);

    function trCourseMaterial($timeout){
        return {
            link: linkFunction
        };

        function linkFunction(scope,element){

            const courseMatListItem = angular.element(element);
            var height,width;

            // $timeout(function(){
            //     height = courseMat.height();
            //     width = courseMat.width();
            //     console.log(height,width);
            //     if (scope.material.ordinal > nv + 1) {
            //         courseMat.find('.tr-course-material-shade').show();
            //         courseMat.find('.tr-course-material').hide();
            //     }
            // },false);

            scope.$watch('lastCompleted',function(nv,ov){
                if (nv === ov){
                    $timeout(function(){
                        height = courseMatListItem.height();
                        width = courseMatListItem.width();
                        if (scope.material.ordinal > nv + 1) {
                            courseMatListItem.find('.tr-course-material-shade').show();
                            courseMatListItem.find('.tr-course-material').hide();
                        }
                    },200,false);
                } else{
                    if (scope.material.ordinal == nv + 1){
                        courseMatListItem.find('.tr-course-material-shade').fadeOut();
                        courseMatListItem.find('.tr-course-material').hide().delay(500).show('slide');
                    }
                }
            });
        }
    }

})();