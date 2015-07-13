(function() {
    'use strict';

    angular
        .module('app.recentpv')
        .controller('RecentPvController', RecentPvController);

    RecentPvController.$inject = ['songservice','logger'];

    function RecentPvController(songservice,logger) {
        
        logger.info('enter RecentPvController');
        
        /*jshint validthis: true */
        var vm = this;
        
        vm.songs = [];
        vm.title = 'Recent PV';
        vm.query = '';
        vm.loading = false;
        vm.search = search;

        init(); 
 
        function init() {
            var promises = [getSongList()];
            return songservice.ready(promises).then(function(){
                logger.info('Songs pv loaded');
            });
        }
        
        function search() {
            logger.info("Songs pv search..."+vm.query);
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