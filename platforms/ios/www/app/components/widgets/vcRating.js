(function() {
    'use strict';

    angular
        .module('app.widgets')
        .directive('vcRating', vcRating);

    /* @ngInject */
    function vcRating () {
        var directive = {
            scope: {
                'rating' : '@',
                'count' : '@'
            },
            template: '<p class="rating">{{vm.drawRating(vm.rating)}} (<i class="icon ion-ios-person"></i>{{vm.count}})</p>',
            controller: RatingController,
            controllerAs: 'vm',
            bindToController: true ,
            replace: true,
            restrict: 'E'
        };
        return directive;
    }
    
    RatingController.$inject = ['$scope'];
    
    function RatingController ($scope) {
        var vm = this;
        vm.drawRating = drawRating;
        
        function drawRating(rating) {
                var count = Math.round(rating);
                var star = "";
                for (var x = 0; x < 5; x++)
                    (x < count) ? star += "★" : star += "☆";
                return star;  
        }
    }
    
})();