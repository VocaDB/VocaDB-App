(function() {
    'use strict';

    angular
        .module('app.taginfo')
        .controller('TagInfoController', TagInfoController);

    TagInfoController.$inject = ['logger','$stateParams','albumservice','songservice','artistservice','tagservice','$ionicScrollDelegate'];

    function TagInfoController(logger,$stateParams,albumservice,songservice,artistservice,tagservice,$ionicScrollDelegate) {

        /*jshint validthis: true */
        var vm = this;
        vm.tag = $stateParams.tagId;
        vm.title = "#";
        vm.tags = {songs: [], artists: [], albums: []};
        vm.songLoaded = false;
        vm.artistLoaded = false;
        vm.albumLoaded = false;
        vm.querySongByTag = querySongByTag;
        vm.queryArtistByTag = queryArtistByTag;
        vm.queryAlbumByTag = queryAlbumByTag;
        vm.convertDiscType = convertDiscType;

        init();

        function init() {
          var promises = [getTagInfo()];
          return tagservice.ready(promises).then(function(){
              logger.info('Tag Info loaded');
              querySongByTag();
              queryArtistByTag();
              queryAlbumByTag();
          });
        }

        function getTagInfo() {
          return tagservice.getTagInfo(vm.tag).then(function(data) {
              vm.title = "#" + data.name;
              return data;
          });
        }

        function querySongByTag() {
            return songservice.querySongByTag(vm.tag).then(function(data) {
                vm.songLoaded = true;
                vm.tags.songs = data.items;
                $ionicScrollDelegate.resize();
                return data;
            });
        }

        function queryArtistByTag() {
            return artistservice.queryArtistByTag(vm.tag).then(function(data) {
                vm.tags.artists = data.items;
                vm.artistLoaded = true;
                $ionicScrollDelegate.resize();
                return data;
            });
        }

        function queryAlbumByTag() {
            return albumservice.queryAlbumByTag(vm.tag).then(function(data) {
                vm.tags.albums = data.items;
                vm.albumLoaded = true;
                $ionicScrollDelegate.resize();
                return data;
            });
        }

        function convertDiscType(discType) {
             return (angular.equals(discType, 'Album')) ? 'Original album' : discType;
        }
    }
})();
