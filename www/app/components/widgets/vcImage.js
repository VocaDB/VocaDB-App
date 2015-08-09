(function() {
    'use strict';

    angular
        .module('app.widgets')
        .directive('vcImage', vcImage);

    /* @ngInject */
    function vcImage () {
        var directive = {
            scope: {
                'category' : '@',
                'url' : '@',
                'itemId' : '@'
            },
            template: '<img ng-src="{{vm.getImage()}}" >',
            controller: ImageController,
            controllerAs: 'vm',
            bindToController: true ,
            replace: true,
            restrict: 'E'
        };
        return directive;
    }
    
    ImageController.$inject = ['$scope'];
    
    function ImageController ($scope) {
        var vm = this;
        vm.getImage = getImage;
        
        
        
        function getImage() {
            
            if(!vm.itemId && !vm.url) 
                return "";
            
            switch(vm.category) {
                case "artist" :
                    return 'http://vocadb.net/Artist/Picture/' + vm.itemId;
                case "album" :
                    return 'http://vocadb.net/Album/CoverPicture/' + vm.itemId;
                case "song" :
                    return vm.url;
                default : 
                    return "";
            }
        }
    }
    
})();