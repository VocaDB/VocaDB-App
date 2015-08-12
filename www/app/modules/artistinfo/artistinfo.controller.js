(function() {
    'use strict';

    angular
        .module('app.artistinfo')
        .controller('ArtistInfoController', ArtistInfoController);

    ArtistInfoController.$inject = ['artistservice','$ionicScrollDelegate','logger','$stateParams'];

    function ArtistInfoController(artistservice, $ionicScrollDelegate, logger, $stateParams) {
       
        /*jshint validthis: true */
        var vm = this;
        
        vm.id = $stateParams.Id;
        vm.trackGroup = [];
        vm.artist = {};
        vm.latestAlbums = [];
        vm.popularAlbums = [];
        vm.latestSongs = [];
        vm.popularSongs = [];
        vm.accordian = [false, false, false];
        vm.toggle = toggle;
        vm.isShown = isShown;

        init(); 
 
        function init() {
            var promises = [getArtist()];
            return artistservice.ready(promises).then(function(){
                logger.info('Artists loaded');
            });
        }

        function getArtist() {
            return artistservice.getArtistById(vm.id).then(function(data) {
                vm.artist = data;
                vm.latestAlbums = data.relations.latestAlbums;
                vm.popularAlbums = data.relations.popularAlbums;
                vm.latestSongs = data.relations.latestSongs;
                vm.popularSongs = data.relations.popularSongs;
                return data;
            });
        }
        
        function toggle(index) {
            vm.accordian[index] = !vm.accordian[index];
            $ionicScrollDelegate.resize();
        }
        
        function isShown(index) {
            return vm.accordian[index];
        }
    }
})();