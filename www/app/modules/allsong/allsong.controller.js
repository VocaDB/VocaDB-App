(function() {
    'use strict';

    angular
        .module('app.allsong')
        .controller('SongListController', SongListController);

    SongListController.$inject = ['songservice','logger'];

    function SongListController(songservice,logger) {
        
        logger.info('enter SongListController');
        
        /*jshint validthis: true */
        var vm = this;
        
        vm.songs = [];
        vm.title = 'Songs';
        vm.query = '';
        vm.loading = false;
        vm.search = search;

        init(); 
 
        function init() {
            var promises = [getSongList()];
            return songservice.ready(promises).then(function(){
                logger.info('Songs loaded');
            });
        }
        
        function search() {
            logger.info("Songs search..."+vm.query);
        }

        function getSongList() {
            vm.loading = true;
            return songservice.querySongByName(vm.query).then(function(data) {
                vm.songs = data.items;
                vm.loading = false;
                return vm.songs;
            });
        }
        
        
    }
})();