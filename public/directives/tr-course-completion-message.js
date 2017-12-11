(function (){
    angular
        .module('TrainlyIo')
        .directive('trCourseCompletionMessage',trCourseCompletionMessage);

    function trCourseCompletionMessage($window){
        return {
            link: linkFunction
        };

        function linkFunction(scope,element){
            const completionMessage = angular.element(element);
            completionMessage.height(angular.element($window).height());
            completionMessage.find('.tr-completion-message-closer').click(function(){
                completionMessage.fadeOut();
            });
            scope.$watch('courseJustCompleted',function (nv,ov){
                if (nv){
                    completionMessage.show();
                    completionMessage.find('.tr-full-screen-message-content').hide().delay(300).fadeIn();
                }
            });
        }
    }
})();