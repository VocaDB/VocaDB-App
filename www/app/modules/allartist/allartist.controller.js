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
        vm.queryArtist = queryArtist;
        vm.search = search;

        //init(); 
 
        function init() {
            var promises = [queryArtist()];
            return artistservice.ready(promises).then(function(){
                logger.info('Artists loaded');
            });
        }

        function queryArtist() {
            return artistservice.queryArtist(vm.query,vm.artists.length).then(function(data) {
                //vm.artists = data.items;
                angular.forEach(data.items, function(value, key) {
                        vm.artists.push(value);
                });
                $scope.$broadcast('scroll.infiniteScrollComplete');
                return vm.artists;
            });
        }
        
        function search() {
            logger.info("Artist search..."+vm.query);
            artistservice.queryArtist(vm.query,0).then(function(data) {
                vm.artists = data.items;
            });
        }
    }
})();