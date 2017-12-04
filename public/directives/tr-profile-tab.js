(function (){
    angular
        .module('TrainlyIo')
        .directive('trProfileTab',trProfileTab);

    function trProfileTab(){
        return {
            link: linkFunction
        };

        function linkFunction(scope,element){
            const jProfile = angular.element(element);
            const defaultTab = jProfile.find('#profile-tablist .tr-active');
            const defaultTabContent = jProfile.find('#profile-tabpane .tr-active');
            defaultTab.css('color','red');
            defaultTab.css('border-bottom','red 3px solid');
            defaultTabContent.css('display','block');
            jProfile.find('#profile-tablist a').click(
                function (){
                    jProfile.find('#profile-tablist a').removeAttr('style');
                    const thisElem = angular.element(this);
                    thisElem.css('color','red');
                    thisElem.css('border-bottom','red 3px solid');
                    jProfile.find('#profile-tabpane .tr-tab-content').hide();
                    const targetTabContent = jProfile.find(thisElem.attr('data-target'));
                    switch (targetTabContent.attr('data-tab-type')){
                        case 'list':
                            targetTabContent.show();
                            targetTabContent.find('li').each(
                                function(i){
                                    angular.element(this).hide().delay(i*20).show({
                                        effect: 'drop',
                                        duration: 500
                                    });
                                }
                            );
                            break;
                        case 'normal':
                            targetTabContent.show();
                            break;
                    }
                }
            )
        }
    }
})();