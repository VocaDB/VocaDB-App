(function () {
    'use strict';
    angular
            .module('app.service')
            .factory('albumservice', albumservice);

    albumservice.$inject = ['dataservice', 'exception'];


    /* @ngInject */
    function albumservice(dataservice, exception)
    {
        var storageId = 'albums';
        
        var service = {
            ready: dataservice.ready,
            getAlbumById: getAlbumById,
            getTracks: getTracks,
            queryAlbum: queryAlbum,
            queryAlbumByTag : queryAlbumByTag,
            getFavoritesList : getFavoritesList,
            getAlbumByBarcode : getAlbumByBarcode,
            isFavorite : isFavorite,
            addFavorite : addFavorite
        };

        return service;

        ///////////////////////////////////////

        
        function getAlbumById(albumId) {
            var parms = {
                Id: albumId,
                fields: 'artists,names,pvs,tags,webLinks',
                nameMatchMode: 'Auto'
            };
            return dataservice.callApi('/api/albums/:Id', parms)
                    .then(getAlbumByIdComplete)
                    .catch(function (message) {
                        exception.catcher('Call API Failed for getAlbumById')(message);
                    });

            function getAlbumByIdComplete(data, status, headers, config) {
                return data;
            }
        }
        
        function getAlbumByBarcode(barcode) {
            var parms = {
                barcode: barcode,
                fields: 'artists,tags',
                maxResults:25,
                getTotalCount: false,
                nameMatchMode: 'Auto'
            };

            return dataservice.callApi('/api/albums', parms)
                    .then(getAlbumByBarcodeComplete)
                    .catch(function (message) {
                        exception.catcher('Call API Failed for getAlbumByBarcode')(message);
                    });

            function getAlbumByBarcodeComplete(data, status, headers, config) {
                return data;
            }
        }
        
        function getTracks(albumId) {
            var parms = {
                Id: albumId
            };
            var load = {
                'isArray': true
            };

            return dataservice.callApi('/api/albums/:Id/tracks', parms, load)
                    .then(getTracksComplete)
                    .catch(function (message) {
                        exception.catcher('Call API Failed for getTracks')(message);
                    });

            function getTracksComplete(data, status, headers, config) {
                return data;
            }
        }
        
        function queryAlbum(query,start) {
            var parms = {
                query: query,
                start: start,
                sort: (query)? 'Name' :'ReleaseDate',
                fields: 'artists,tags',
                maxResults:25,
                getTotalCount: false,
                nameMatchMode: 'Auto'
            };

            return dataservice.callApi('/api/albums', parms)
                    .then(queryAlbumComplete)
                    .catch(function (message) {
                        exception.catcher('Call API Failed for queryAlbum')(message);
                    });

            function queryAlbumComplete(data, status, headers, config) {
                return data;
            }
        }
        
        function queryAlbumByTag(tag) {
            var parms = {
                tag: tag,
                fields: 'artists,tags',
                maxResults:25,
                getTotalCount: false,
                nameMatchMode: 'Auto'
            };

            return dataservice.callApi('/api/albums', parms)
                    .then(queryAlbumByTagComplete)
                    .catch(function (message) {
                        exception.catcher('Call API Failed for queryAlbumByTag')(message);
                    });

            function queryAlbumByTagComplete(data, status, headers, config) {
                return data;
            }
        }
        
        function getFavoritesList() {
            var albumString = window.localStorage[storageId];
            if(albumString) {
              return angular.fromJson(albumString);
            }
            return [];
        }
        
        function isFavorite(albumId) {
            var albums = this.getFavoritesList();
            for(var i=0;i<albums.length;i++)
                if(albums[i].id==albumId) return true;
            return false;
        }
        
        function addFavorite(album) {
            var albums = this.getFavoritesList();
            for(var i=0;i<albums.length;i++)
            {   
                if(albums[i].id==album.id){
                    albums.splice(i,1);
                    window.localStorage[storageId] = angular.toJson(albums);
                    return;
                }
            }
            albums.push(album);
            window.localStorage[storageId] = angular.toJson(albums);
        }

    }
})();