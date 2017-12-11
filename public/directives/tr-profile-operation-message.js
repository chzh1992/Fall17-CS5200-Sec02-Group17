(function (){
    angular
        .module('TrainlyIo')
        .directive('trProfileOperationMessage',trProfileOperationMessage);

    function trProfileOperationMessage(){
        return {
            link: linkFunction
        };

        function linkFunction(scope,element){
            const messageBox = angular.element(element);
            const successMessage = messageBox.find('.tr-success-message');
            const failureMessage = messageBox.find('.tr-failure-message');
            successMessage.hide();
            failureMessage.hide();
            scope.$watch('operationSucceeded',function (nv,ov){
                if (nv){
                    successMessage.fadeIn().delay(1000).fadeOut();
                }
                if (nv == false){
                    failureMessage.fadeIn().delay(1000).fadeOut();
                }
            });
        }
    }
})();