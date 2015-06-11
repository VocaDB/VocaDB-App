(function() {
    'use strict';

    angular
        .module('app.widgets')
        .directive('vcFavButton', vcFavButton);

    /* @ngInject */
    function vcFavButton () {
        var directive = {
            scope: {
                'item' : '@',
                'category' : '@'
            },
            template: '<button class="button button-light" >' +
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
    
    FavButtonController.$inject = ['$scope'];
    
    function FavButtonController ($scope) {
        // Injecting $scope just for comparison
        var vm = this;
        vm.addFavorites = addFavorites;
        vm.isFavorites = isFavorites;
        
        
        function addFavorites(item) {
            //alert("not implemented yet "+vm.item.id);
        }
        
        function isFavorites(id) {
        }
        
    }
    
})();