(function() {
    'use strict';

    angular
        .module('app.favorites')
        .controller('FavoritesController', FavoritesController);

    FavoritesController.$inject = ['logger'];

    function FavoritesController(logger) {
       
        /*jshint validthis: true */
        var vm = this;
        
    }
})();