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
                'items': '=',
                'official': '@'
            },
            templateUrl: 'app/components/widgets/vcWeblinkAccordian.html',
            controller: WeblinkAccordianController,
            controllerAs: 'vm',
            bindToController: true ,
            restrict: 'E'
        };
        return directive;
    }
    
    WeblinkAccordianController.$inject = ['$ionicScrollDelegate'];
    
    function WeblinkAccordianController ($ionicScrollDelegate) {
        // Injecting $scope just for comparison
        var vm = this;
        
        vm.isShown = false;
        vm.toggle = toggle;
        vm.getWeblinkIcon = getWeblinkIcon;
        vm.open = open;
        vm.filter = filter;
  
        function toggle() {
            vm.isShown = !vm.isShown;
            $ionicScrollDelegate.resize();
        }
        
        function filter() {
            return function(web) {
                if(vm.official == 'true') {
                    return web.category == 'Official';
                } else if(vm.official == 'false') {
                    return web.category != 'Official';
                } else {
                    return web.category != '';
                }
            }
        }
        
        
        function open(url) {
            if(ionic.Platform.isIOS()) {
                navigator.app.loadUrl(url, {openExternal: true});
            } else {
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