(function() {
    'use strict';

    angular
        .module('app.widgets')
        .directive('vcShareButton', vcShareButton);

    /* @ngInject */
    function vcShareButton () {
        var directive = {
            scope: {
                'id' : '@',
                'category' : '@'
            },
            template: '<button class="button button-light "  ng-click="vm.share()">' +
                        '<i class="icon ion-android-share"></i>&nbsp;Share' +
                      '</button>',
            controller: ShareButtonController,
            controllerAs: 'vm',
            bindToController: true ,
            replace: true,
            restrict: 'E'
        };
        return directive;
    }
    
    ShareButtonController.$inject = [];
    
    function ShareButtonController () {
        var vm = this;
        vm.share = share;
        
        function share() {
            if(vm.category=="song") {
                window.plugins.socialsharing.share(null, null, null, 'http://vocadb.net/S/' + vm.id);
            }
            
            else if(vm.category=="artist") {
                window.plugins.socialsharing.share(null, null, null, 'http://vocadb.net/Ar/' + vm.id);
            }
            
            else if(vm.category=="album") {
                window.plugins.socialsharing.share(null, null, null, 'http://vocadb.net/Al/' + vm.id);
            }
            else {
                return false
            }
        }
        
    }
    
})();