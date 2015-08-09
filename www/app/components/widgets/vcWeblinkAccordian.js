(function() {
    'use strict';

    angular
        .module('app.widgets')
        .directive('vcWeblinkAccordian', vcWeblinkAccordian);

    /* @ngInject */
    function vcWeblinkAccordian () {
        var directive = {
            scope: {
                'header' : '@',
                'items': '='
            },
            templateUrl: 'app/components/widgets/vcWeblinkAccordian.html',
            controller: WeblinkAccordianController,
            controllerAs: 'vm',
            bindToController: true ,
            restrict: 'E'
        };
        return directive;
    }
    
    WeblinkAccordianController.$inject = ['$scope','$ionicScrollDelegate'];
    
    function WeblinkAccordianController ($scope, $ionicScrollDelegate) {
        // Injecting $scope just for comparison
        var vm = this;
        
        vm.isShown = false;
        vm.toggle = toggle;
        vm.getWeblinkIcon = getWeblinkIcon;
  
        function toggle(isShown) {
            vm.isShown = !vm.isShown;
            $ionicScrollDelegate.resize();
        }
        
        vm.open = function(url) {
            if(ionic.Platform.isAndroid()) {
                navigator.app.loadUrl(url, {openExternal: true});
            }
            else
            {
                window.open(url, '_system');
            }
        };
        
        function getWeblinkIcon(domain) {
            if (domain.indexOf('nicovideo') >= 0)
                return 'assets/img/niconico.png';
            if (domain.indexOf('youtube') >= 0)
                return 'assets/img/youtube.png';
            if (domain.indexOf('piapro') >= 0)
                return 'assets/img/Piapro.jpeg';
            if (domain.indexOf('facebook') >= 0)
                return 'assets/img/facebook.png';
            if (domain.indexOf('twitter') >= 0)
                return 'assets/img/twitter.jpg'
            else
                return 'assets/img/web.png';
        };
 
    }
    
})();