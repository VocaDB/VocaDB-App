(function() {
    'use strict';

    angular
        .module('app.songinfo')
        .controller('SongInfoController', SongInfoController);

    SongInfoController.$inject = ['songservice','$ionicScrollDelegate','logger','$stateParams'];

    function SongInfoController(songservice, $ionicScrollDelegate, logger, $stateParams) {
       
        /*jshint validthis: true */
        var vm = this;
        
        vm.id = $stateParams.Id;
        vm.song = {};
        vm.artists = [];
        vm.PVs = [];
        vm.albums = [];
        vm.accordian = [false, false, false];
        vm.toggle = toggle;
        vm.isShown = isShown;
        vm.isFavorites = isFavorites;
        vm.addFavorites = addFavorites;

        init(); 
 
        function init() {
            var promises = [getSongById()];
            return songservice.ready(promises).then(function(){
                logger.info('Song loaded');
            });
        }

        function getSongById() {
            return songservice.getSongById(vm.id).then(function(data) {
                vm.song = data;
                vm.artists = data.artists;
                vm.PVs = data.pVs;
                vm.albums = data.albums;;
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
        
        function isFavorites() {
            return false;
        }
        
        function addFavorites() {
            
        }
    }
})();