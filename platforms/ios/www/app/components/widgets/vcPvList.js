(function() {
    'use strict';

    angular
        .module('app.widgets')
        .directive('vcPvList', vcPvList);

    /* @ngInject */
    function vcPvList () {
        var directive = {
            scope: {
                'items' : '=',
                'url' : '@',
                'title' : '@',
                'subtitle' : '@',
                'service' : '@'
            },
            templateUrl: 'app/components/widgets/vcPvList.html',
            controller: PvListController,
            controllerAs: 'vm',
            bindToController: true ,
            replace: true,
            restrict: 'E'
        };
        return directive;
    }
    
    PvListController.$inject = [];
    
    function PvListController () {
        var vm = this;
        
        vm.getMediaIcon = getMediaIcon;
        vm.open = open;
        
        function getMediaIcon(service) {
            if (angular.equals(service, 'NicoNicoDouga'))
                return 'assets/img/niconico.png';
            if (angular.equals(service, 'Youtube'))
                return 'assets/img/youtube.png';
            if (angular.equals(service, 'Piapro'))
                return 'assets/img/piapro.jpeg';
            if (angular.equals(service, 'SoundCloud'))
                return 'assets/img/soundcloud.png';
        }
        
        function open(url) {
           window.open(url, '_system');
        }
    }
    
})();