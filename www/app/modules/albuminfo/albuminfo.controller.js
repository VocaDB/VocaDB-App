(function() {
    'use strict';

    angular
        .module('app.albuminfo')
        .controller('AlbumInfoController', AlbumInfoController);

    AlbumInfoController.$inject = ['albumservice','logger','$stateParams'];

    function AlbumInfoController(albumservice,logger,$stateParams) {
       
        /*jshint validthis: true */
        var vm = this;

        vm.id = $stateParams.Id;
        vm.trackGroup = [];
        vm.album = {};
        vm.tracks = [];
        
        
        init(); 
 
        function init() {
            var promises = [getAlbum(),getTracks()];
            return albumservice.ready(promises).then(function(){
                logger.info('Album loaded');
            });
        }
        
        function getAlbum() {
            return albumservice.getAlbumById(vm.id).then(function(data) {
                vm.album = data;
                return data;
            });
        }
        
        function getTracks() {
            return albumservice.getTracks(vm.id).then(function(data) {
                vm.tracks = data;
//                for (var i = 1; i < vm.tracks.length; i++)
//                    if (vm.tracks[i].discNumber != vm.tracks[i - 1].discNumber || i == 1)
//                        vm.trackGroup.push(vm.tracks[i].discNumber);
            });
        }
        
    }
})();