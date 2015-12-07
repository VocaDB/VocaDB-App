/**
 * ArtistService Factory
 * @namespace Factories
 */

(function () {
    'use strict';
    angular
            .module('app.service')
            .factory('artistservice', artistservice);

    artistservice.$inject = ['dataservice', 'exception'];

    /**
     * @namespace ArtistService
     * @desc Service for request artist information
     * @memberOf Factories
     */
    /* @ngInject */
    function artistservice(dataservice, exception)
    {
        var storageId = 'artists';

        var service = {
            ready: dataservice.ready,
            queryArtist: queryArtist,
            getArtistById : getArtistById,
            queryArtistByTag : queryArtistByTag,
            getFavoritesList : getFavoritesList,
            isFavorite : isFavorite,
            addFavorite : addFavorite
        };

        return service;

        ///////////////////////////////////////

        /**
         * @name queryArtist
         * @desc Find artists.
         * Reference : http://vocadb.net/apiHelp/Api/GET-api-artists_query_artistTypes_tag_followedByUserId_status_start_maxResults_getTotalCount_sort_preferAccurateMatches_nameMatchMode_fields_lang
         * @param {String} query Query string
         * @returns {promises}
         * @memberOf Factories.ArtistService
         */
        function queryArtist(query,start) {
            var parms = {
                query: query,
                start: start,
                getTotalCount: false,
                nameMatchMode: 'Auto'
            };

            return dataservice.callApi('/api/artists', parms)
                    .then(queryArtistComplete)
                    .catch(function (message) {
                        exception.catcher('Call API Failed for queryArtist')(message);
                        //$location.url('/');
                    });

            function queryArtistComplete(data, status, headers, config) {
                return data;
            }

        }


        /**
         * @name getArtistById
         * @desc Get an artist information from Id
         * Reference : http://vocadb.net/apiHelp/Api/GET-api-artists-id_fields_relations_lang
         * @param {String} artistId Id of artist
         * @returns {promises}
         * @memberOf Factories.ArtistService
         */
        function getArtistById(artistId) {
            var parms = {
                Id: artistId,
                fields: 'Description,WebLinks,Tags,Names',
                relations: 'All',
                getTotalCount: false,
                nameMatchMode: 'Auto'
            };

            return dataservice.callApi('/api/artists/:Id', parms)
                    .then(getArtistByIdComplete)
                    .catch(function (message) {
                        exception.catcher('Call API Failed for getArtistById')(message);
                        //$location.url('/');
                    });

            function getArtistByIdComplete(data, status, headers, config) {
                return transform(data);
            }

            function transform(data) {
                data.image = 'http://vocadb.net/Artist/Picture/' + artistId;
                data.description = data.description.replace(/\n/g, '<br/>').replace(/\r/g, '<br/>').replace(/\r\n/g, '<br/>');
                data.additionNames = displayAdditionNames(data.names);
                return data;
            }

            //Helper function
            function displayAdditionNames(names) {
                var additionName = "";
                if(typeof names === 'undefined') return;
                if (names.length > 1) {
                    for (var i = 1; i < names.length; i++)
                        additionName += names[i].value + ", ";
                    return additionName.slice(0, additionName.length - 2);
                }
            }

        }


        function queryArtistByTag(tag) {
            var parms = {
                tagId: tag,
                getTotalCount: false,
                nameMatchMode: 'Auto'
            };

            return dataservice.callApi('/api/artists', parms)
                    .then(queryArtistByTagComplete)
                    .catch(function (message) {
                        exception.catcher('Call API Failed for queryArtistByTag')(message);
                        //$location.url('/');
                    });

            function queryArtistByTagComplete(data, status, headers, config) {
                return data;
            }

        }

        function getFavoritesList() {
            var artistString = window.localStorage[storageId];
            if(artistString) {
              return angular.fromJson(artistString);
            }
            return [];
        }

        function isFavorite(artistId) {
            var artists = getFavoritesList();
            for(var i=0;i<artists.length;i++)
                if(artists[i].id==artistId) return true;
            return false;
        }

        function addFavorite(artist) {
            var artists = getFavoritesList();
            for(var i=0;i<artists.length;i++)
            {
                if(artists[i].id==artist.id){
                    artists.splice(i,1);
                    window.localStorage[storageId] = angular.toJson(artists);
                    return;
                }
            }
            artists.push(artist);
            window.localStorage[storageId] = angular.toJson(artists);
        }

    }
})();
