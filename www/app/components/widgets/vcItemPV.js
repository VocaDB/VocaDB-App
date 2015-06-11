(function() {
    'use strict';

    angular
        .module('app.widgets')
        .directive('vcItemPV', vcItemPV);

    /* @ngInject */
    function vcItemPV () {
        var directive = {
            scope: {
                'url' : '@',
                'name' : '@',
                'service' : '@'
            },
            template: '',
            controller: ItemPVController,
            controllerAs: 'vm',
            bindToController: true ,
            replace: true,
            restrict: 'E'
        };
        return directive;
    }
    
    ItemPVController.$inject = ['$scope'];
    
    function ItemPVController ($scope) {
        var vm = this;
    }
    
})();