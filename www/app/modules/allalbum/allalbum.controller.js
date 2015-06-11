(function() {
    'use strict';

    angular
        .module('app.allalbum')
        .controller('AllAlbumController', AllAlbumController);

    AllAlbumController.$inject = ['albumservice','logger'];

    function AllAlbumController(albumservice,logger) {
       
        /*jshint validthis: true */
        var vm = this;
        
    }
})();