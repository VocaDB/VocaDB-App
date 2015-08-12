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
        vm.inited = false; //For check if data loaded at first time
        vm.enableLoadMore = true; //Need to prevent from infinite load when got empty result
        vm.search = search;
        vm.querySong = querySong;
        vm.loadMore = loadMore;
        
        function search() {
            querySong(vm.query,0,true);
        }
        
        function loadMore() {
            if(vm.enableLoadMore)
                querySong(vm.query,vm.songs.length,false);
        }

        function querySong(query,start,replace) {
            vm.loading = true;
            return songservice.querySongByName(query,start).then(function(data) {
                vm.loading = false;
                vm.inited = true;
                
                if(replace) {
                    vm.songs = data.items;              
                } else {
                    angular.forEach(data.items, function(value, key) {
                        vm.songs.push(value);
                    });   
                }
                
                //Prevent from infinite load
                if(data.items.length==0)
                    vm.enableLoadMore = false;
                
                $scope.$broadcast('scroll.infiniteScrollComplete');
                
                return vm.songs;
            });
        }
        
        
    }
})();