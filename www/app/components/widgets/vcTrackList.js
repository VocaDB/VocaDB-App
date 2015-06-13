(function() {
    'use strict';

    angular
        .module('app.widgets')
        .directive('vcTrackList', vcTrackList);

    /* @ngInject */
    function vcTrackList () {
        var directive = {
            link : link,
            scope: {
                tracks : '='
            },
            templateUrl: 'app/components/widgets/vcTrackList.html',
            controller: TrackListController,
            controllerAs: 'vm',
            bindToController: true ,
            restrict: 'E'
        };
        return directive;
        
        
        function link(scope, element, attr) {
            scope.$watch(attr.tracks,function(newValue,oldValue){
                 if (newValue.length){           
                     var vm = scope.vm;
                     
                     vm.isShown = false;
                     vm.tracks = newValue;
                     
                    for (var i = 1; i < vm.tracks.length; i++)
                        if (vm.tracks[i].discNumber != vm.tracks[i - 1].discNumber || i == 1)
                            vm.trackGroup.push(vm.tracks[i].discNumber);
                 }
            });
        }
    }
    
    TrackListController.$inject = ['$scope','$ionicScrollDelegate'];
    
    function TrackListController ($scope, $ionicScrollDelegate) {
        var vm = this;
        vm.isShown = false;
        vm.trackGroup = [];
        vm.toggle = toggle;
  
        function toggle(isShown) {
            vm.isShown = !vm.isShown;
            $ionicScrollDelegate.resize();
        }
    }
    
})();