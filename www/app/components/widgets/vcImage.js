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
                'itemId' : '@',
                'canView' : '@'
            },
            template: '<img ng-src="{{vm.getImage()}}" ng-click="openModal()" err-src="{{vm.getErrorImage()}}">',
            controller: ImageController,
            controllerAs: 'vm',
            bindToController: true ,
            replace: true,
            restrict: 'E'
        };
        return directive;
    }
    
    ImageController.$inject = ['$scope','$ionicModal','$q','logger'];
    
    function ImageController ($scope,$ionicModal,$q,logger) {
        var vm = this;
        vm.getImage = getImage;
        vm.getErrorImage = getErrorImage;
        
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
        
        function getErrorImage() {
            switch(vm.category) {
                case "artist" :
                    return "assets/img/unknow_artist.png";
                case "album" :
                    return "assets/img/unknow_album.png";
                case "song" :
                    return "assets/img/unknow_song.png";
                default : 
                    return "assets/img/404.png";
            }    
        }
        
        if(vm.canView) {
            //Create and load the Modal for display Image
           $ionicModal.fromTemplateUrl('app/components/widgets/vcImageModal.html', function(modal) {
               $scope.imageModal = modal;
           }, {
               scope: $scope,
               animation: 'slide-in-up'
           });

           $scope.openModal = function() {
               $scope.modal = {title: "test", src: vm.getImage()};
               $scope.imageModal.show();
           };

           $scope.closeModal = function() {
               $scope.imageModal.hide();
           };          
        }
    }
    
})();