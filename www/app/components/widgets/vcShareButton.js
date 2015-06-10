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
    
    ShareButtonController.$inject = ['$scope'];
    
    function ShareButtonController ($scope) {
        // Injecting $scope just for comparison
        var vm = this;
        vm.share = share;
        
        function share() {
            alert("not implemented yet "+vm.id);
        }
        
    }
    
})();