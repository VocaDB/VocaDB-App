(function() {
    'use strict';

    angular
        .module('app.widgets')
        .directive('vcTracks', vcTracks);

    /* @ngInject */
    function vcTracks () {
        var directive = {
            scope: {
            },
            template: '',
            controller: TracksController,
            controllerAs: 'vm',
            bindToController: true ,
            replace: true,
            restrict: 'E'
        };
        return directive;
    }
    
    TracksController.$inject = ['$scope'];
    
    function TracksController ($scope) {
        var vm = this;
        
    }
    
})();