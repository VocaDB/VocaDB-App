(function() {
    'use strict';

    angular
        .module('app.widgets')
        .directive('vcDuration', vcDuration);

    /* @ngInject */
    function vcDuration () {
        var directive = {
            scope: {
                'lengthSecond' : '@'
            },
            template: '{{vm.getDuration()}}',
            controller: DurationController,
            controllerAs: 'vm',
            bindToController: true ,
            restrict: 'E'
        };
        return directive;
    }
    
    DurationController.$inject = ['$scope'];
    
    function DurationController ($scope) {
        var vm = this;
        
        vm.getDuration = getDuration;
        vm.lengthSecond = 120;
        
        function getDuration() {
            
            var lengthSeconds = vm.lengthSecond;
            
            if (lengthSeconds <= 0)
                return "";
            var minutes = parseInt(lengthSeconds / 60) % 60;
            var seconds = lengthSeconds % 60;

            var result = minutes + ":" + (seconds < 10 ? "0" + seconds : seconds);
            return "(" + result + ")";
        }
    }
    
})();