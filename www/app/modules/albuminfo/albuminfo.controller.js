(function() {
    'use strict';

    angular
        .module('app.albuminfo')
        .controller('AlbumInfoController', AlbumInfoController);

    AlbumInfoController.$inject = ['albumservice','logger'];

    function AlbumInfoController(albumservice,logger) {
       
        /*jshint validthis: true */
        var vm = this;
        
    }
})();