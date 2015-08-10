(function() {
    'use strict';

    angular
        .module('app.widgets')
        .directive('vcArtistAccordian', vcArtistAccordian);

    /* @ngInject */
    function vcArtistAccordian () {
        var directive = {
            scope: {
                'header' : '@',
                'items': '=',
                'showImage' : '@'
            },
            templateUrl: 'app/components/widgets/vcArtistAccordian.html',
            controller: ArtistAccordianController,
            controllerAs: 'vm',
            bindToController: true ,
            restrict: 'E'
        };
        return directive;
    }
    
    ArtistAccordianController.$inject = ['$scope','$ionicScrollDelegate'];
    
    function ArtistAccordianController ($scope, $ionicScrollDelegate) {
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