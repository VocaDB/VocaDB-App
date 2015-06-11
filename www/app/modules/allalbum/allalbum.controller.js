(function() {
    'use strict';

    angular
        .module('app.allalbum')
        .controller('AllAlbumController', AllAlbumController);

    AllAlbumController.$inject = ['albumservice','logger'];

    function AllAlbumController(albumservice,logger) {
       
        /*jshint validthis: true */
        var vm = this;
        
        vm.query = "";
        vm.albums = [];
        vm.scan = scan;
        vm.search = search;
        
        init(); 
 
        function init() {
            var promises = [getAllAlbum()];
            return albumservice.ready(promises).then(function(){
                logger.info('Albums loaded');
            });
        }

        function getAllAlbum() {
            return albumservice.queryAlbum(vm.query).then(function(data) {
                vm.albums = data.items;
                return vm.albums;
            });
        }
        
        function scan() {
        }
        
        function search() {
            logger.info("Albums search..."+vm.query);
        }
    }
})();
    