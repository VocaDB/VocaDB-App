(function() {
    'use strict';

    angular
        .module('app.widgets')
        .directive('vcAccordian', vcAccordian);

    /* @ngInject */
    function vcAccordian () {
        var directive = {
            scope: {
                'header' : '@',
                'items': '=',
                'href' : '@',
                'image' : '@',
                'title': '@',
                'subtitle' : '@',
                'showImage' : '@'
            },
            templateUrl: 'app/components/widgets/vcAccordian.html',
            controller: AccordianController,
            controllerAs: 'vm',
            bindToController: true ,
            restrict: 'E'
        };
        return directive;
    }
    
    AccordianController.$inject = ['$scope','$ionicScrollDelegate'];
    
    function AccordianController ($scope, $ionicScrollDelegate) {
        // Injecting $scope just for comparison
        var vm = this;
        
        vm.isShown = false;
        vm.toggle = toggle;
  
        function toggle(isShown) {
            vm.isShown = !vm.isShown;
            $ionicScrollDelegate.resize();
        }

    }
    
})();