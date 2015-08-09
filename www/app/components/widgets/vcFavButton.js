(function() {
    'use strict';

    angular
        .module('app.widgets')
        .directive('vcFavButton', vcFavButton);

    /* @ngInject */
    function vcFavButton () {
        var directive = {
            scope: {
                'item' : '=',
                'category' : '@'
            },
            template: '<button ng-class="vm.isFavorites(vm.item.id)? \'button button-energized\' :  \'button button-light\' " ng-click="vm.addFavorites(vm.item)">' +
                      '<i class="icon ion-star"></i>&nbsp;Favorites' +
                      '</button>',
            controller: FavButtonController,
            controllerAs: 'vm',
            bindToController: true ,
            replace: true,
            restrict: 'E'
        };
        return directive;
    }
    
    FavButtonController.$inject = ['logger','songservice','artistservice','albumservice'];
    
    function FavButtonController (logger,songservice,artistservice,albumservice) {
        // Injecting $scope just for comparison
        var vm = this;
        vm.addFavorites = addFavorites;
        vm.isFavorites = isFavorites;
        function addFavorites(item) {
            
            if(vm.category=="song") {
                songservice.addFavorite(item);
            }
            
            else if(vm.category=="artist") {
                artistservice.addFavorite(item);
            }
            
            else if(vm.category=="album") {
                albumservice.addFavorite(item);
            }
        }
        
        function isFavorites(id) {
            
            if(vm.category=="song") {
                return songservice.isFavorite(id);
            }
            
            else if(vm.category=="artist") {
                return artistservice.isFavorite(id);
            }
            
            else if(vm.category=="album") {
                return albumservice.isFavorite(id);
            }
            else {
                
                return false
            }
        }
        
    }
    
})();