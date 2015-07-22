(function() {
    'use strict';

    angular
        .module('app.favorites')
        .controller('FavoritesController', FavoritesController);

    FavoritesController.$inject = ['logger','songservice','artistservice','albumservice'];

    function FavoritesController(logger,songservice,artistservice,albumservice) {
       
        /*jshint validthis: true */
        var vm = this;
        vm.songs = [];
        vm.artists = [];
        vm.albums = [];
        
        init();
        
        function init() {
            vm.songs = songservice.getFavoritesList();
            vm.artists = artistservice.getFavoritesList();
            vm.albums = albumservice.getFavoritesList();
        }
    }
})();