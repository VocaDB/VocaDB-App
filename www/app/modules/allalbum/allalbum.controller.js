(function() {
    'use strict';

    angular
        .module('app.allalbum')
        .controller('AllAlbumController', AllAlbumController);

    AllAlbumController.$inject = ['$scope','albumservice','logger'];

    function AllAlbumController($scope,albumservice,logger) {
       
        /*jshint validthis: true */
        var vm = this;
        
        vm.query = "";
        vm.albums = [];
        vm.scan = scan;
        vm.search = search;
        vm.queryAlbum = queryAlbum;
        
//        init(); 
 
        function init() {
            var promises = [queryAlbum()];
            return albumservice.ready(promises).then(function(){
                logger.info('Albums loaded');
            });
        }

        function queryAlbum() {
            albumservice.queryAlbum(vm.query,vm.albums.length).then(function(data) {
                angular.forEach(data.items, function(value, key) {
                        vm.albums.push(value);
                });
                $scope.$broadcast('scroll.infiniteScrollComplete');
            });
        }
        
        function scan() {
        }
        
        function search() {
            logger.info("Albums search..."+vm.query);
            albumservice.queryAlbum(vm.query,0).then(function(data) {
                vm.albums = data.items;
            });
        }
        
    }
})();
    