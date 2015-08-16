(function() {
    'use strict';

    angular
        .module('app.allartist')
        .controller('AllArtistController', AllArtistController);

    AllArtistController.$inject = ['$scope','artistservice','logger'];

    function AllArtistController($scope,artistservice,logger) {
       
        /*jshint validthis: true */
        var vm = this;
        
        vm.artists = [];
        vm.title = 'Artists';
        vm.query = '';
        vm.loading = false;
        vm.inited = false; //For check if data loaded at first time
        vm.enableLoadMore = true; //Need to prevent from infinite load when got empty result
        vm.queryArtist = queryArtist;
        vm.search = search;
        vm.loadMore = loadMore;
        
        function queryArtist(query,start,replace) {
            vm.loading = true;
            return artistservice.queryArtist(query,start).then(function(data) {
                vm.inited = true;
                vm.loading = false;
                
                if(replace) {
                    vm.artists = data.items;
                } else {
                  angular.forEach(data.items, function(value, key) {
                        vm.artists.push(value);
                   });                  
                }
                
                //Prevent from infinite load
                if(data.items.length==0)
                    vm.enableLoadMore = false;
                
                $scope.$broadcast('scroll.infiniteScrollComplete');
                return vm.artists;
            });
        }
        
        function loadMore() {
            if(vm.enableLoadMore)
                queryArtist(vm.query,vm.artists.length,false);
        }
        
        function search() {
            logger.info("Artist search..."+vm.query);
            queryArtist(vm.query,0,true);
            artistservice.queryArtist(vm.query,0).then(function(data) {
                vm.artists = data.items;
            });
        }
    }
})();