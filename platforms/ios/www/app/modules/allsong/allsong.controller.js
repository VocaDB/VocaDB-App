(function() {
    'use strict';

    angular
        .module('app.allsong')
        .controller('SongListController', SongListController);

    SongListController.$inject = ['$scope', 'songservice','logger'];

    function SongListController($scope,songservice,logger) {
        
        logger.info('enter SongListController');
        
        /*jshint validthis: true */
        var vm = this;
        
        vm.songs = [];
        vm.title = 'Songs';
        vm.query = '';
        vm.loading = false;
        vm.search = search;
        vm.querySong = querySong;
        
        //init(); 
 
        function init() {
            var promises = [getSongList()];
            return songservice.ready(promises).then(function(){
                logger.info('Songs loaded');
            });
        }
        
        function search() {
            logger.info("Songs search..."+vm.query);
            songservice.querySongByName(vm.query,0).then(function(data) {
                vm.songs = data.items;
                vm.loading = false;
            });
        }

        function querySong() {
            vm.loading = true;
            return songservice.querySongByName(vm.query,vm.songs.length).then(function(data) {
                //vm.songs = data.items;
                angular.forEach(data.items, function(value, key) {
                        vm.songs.push(value);
                });
                vm.loading = false;
                $scope.$broadcast('scroll.infiniteScrollComplete');
                
                return vm.songs;
            });
        }
        
        
    }
})();