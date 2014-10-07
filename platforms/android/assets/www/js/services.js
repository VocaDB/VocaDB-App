angular.module('vocadb.services', ['ngResource'])

.factory('Song', function($resource, $q, $cacheFactory,$ionicPopup) {
    var endPoint = 'http://vocadb.net/api/songs';
    var cacheEngine = $cacheFactory('Song');
    var querySong = $resource(endPoint, {
        getTotalCount: false,
        fields: 'ThumbUrl',
        nameMatchMode: 'Auto',
        callback: 'JSON_CALLBACK'
    }, {
        'load': {
            'method': 'JSONP',
            'cache': true
        }
    });
    var getById = $resource(endPoint + '/:Id',
            {
                callback: 'JSON_CALLBACK'
            },
    {
        'load': {
            'method': 'JSONP',
            'cache': true
        }
    });
    return {
        selectSong: null,
        songs: [],
        term: "",
        search: function(query, callback) {
            this.term = query;
            var doSearch = ionic.debounce(function(query, callback) {
                var cache = cacheEngine.get(query);
                var q = $q.defer();
                (cache) ? q.resolve(cache) :
                        querySong.load({
                            query: query
                        }, function(resp) {
                            cacheEngine.put(query, resp);
                            q.resolve(resp);
                        }, function(err) {
                            q.reject(err);
                        });
                q.promise.then(callback);
            }, 500);
            doSearch(query, callback);
        },
        loadMore: ionic.debounce(function(query,start, callback) {
            var q = $q.defer();
            querySong.load({
                query: query,
                start: start,
                maxResults: 15
            }, function(resp) {
                q.resolve(resp);
            }, function(err) {
                q.reject(err);
            });
            q.promise.then(callback);
        }, 500),
        searchByTag: function(tag, callback) {
            var doSearch = ionic.debounce(function(tag, callback) {
                var cache = cacheEngine.get(tag+"_song");
                var q = $q.defer();
                (cache) ? q.resolve(cache) : querySong.load({
                    tag: tag
                }, function(resp) {
                    cacheEngine.put(tag+"_song", resp);
                    q.resolve(resp);
                }, function(err) {
                    q.reject(err);
                });
                q.promise.then(callback);
            }, 500);
            doSearch(tag, callback);
        },
        getSongById: function(songId, callback) {
            var cache = cacheEngine.get(songId);
            var q = $q.defer();
            (cache) ? q.resolve(cache) : getById.load({
                Id: songId
            }, function(resp) {
                cacheEngine.put(songId, resp);
                q.resolve(resp);
            }, function(err) {
                q.reject(err);
            });
            q.promise.then(callback);
        },
        getByField: function(songId, field, callback) {
            var cache = cacheEngine.get(songId + "_" + field);
            var q = $q.defer();
            (cache) ? q.resolve(cache) : getById.load({
                Id: songId,
                fields: field
            }, function(resp) {
                cacheEngine.put(songId + "_" + field, resp);
                q.resolve(resp);
            }, function(err) {
                q.reject(err);
            });
            q.promise.then(callback);
        },
        loadRecentPVs: ionic.debounce(function(start, callback) {
            var q = $q.defer();
            querySong.load({
                onlyWithPvs: true,
                sort: 'AdditionDate',
                start: start,
                maxResults: 15
            }, function(resp) {
                q.resolve(resp);
            }, function(err) {
                q.reject(err);
            });
            q.promise.then(callback);
        }, 500),
        getFavoritesList : function() {
            var songString = window.localStorage['songs'];
            if(songString) {
              return angular.fromJson(songString);
            }
            return [];
        },
        isFavorites: function(songId) {
            var songs = this.getFavoritesList();
            for(var i=0;i<songs.length;i++)
                if(songs[i].id==songId) return true;
            return false;
        },
        addFavorites: function(song) {
            var songs = this.getFavoritesList();
            for(var i=0;i<songs.length;i++)
            {   
                if(songs[i].id==song.id){
                    songs.splice(i,1);
                    window.localStorage['songs'] = angular.toJson(songs);
                    return;
                }
            }
            songs.push(song);
            window.localStorage['songs'] = angular.toJson(songs);
        }
    };
})

.factory('Artist', function($resource, $q, $cacheFactory) {

    var cacheEngine = $cacheFactory('Artist');
    var queryArtist = $resource('http://vocadb.net/api/artists',
            {
                getTotalCount: false,
                nameMatchMode: 'Auto',
                callback: 'JSON_CALLBACK'
            },
    {
        'load': {
            'method': 'JSONP',
            'cache': true
        }
    });

    var getById = $resource('http://vocadb.net/api/artists/:Id',
            {
                getTotalCount: false,
                fields: 'WebLinks',
                callback: 'JSON_CALLBACK'
            },
    {
        'load': {
            'method': 'JSONP',
            'cache': true
        }
    });
    var artists = [];
    return {
        term: "",
        search: function(query, callback) {
            this.term = query;
            var doSearch = ionic.debounce(function(query, callback) {
                var cache = cacheEngine.get(query);
                var q = $q.defer();
                (cache) ? q.resolve(cache) : queryArtist.load({
                    query: query
                }, function(resp) {
                    cacheEngine.put(query, resp);
                    q.resolve(resp);
                }, function(err) {
                    q.reject(err);
                });
                q.promise.then(callback);
            }, 500);
            doSearch(query, callback);
        },
        loadMore: ionic.debounce(function(query,start, callback) {
            var q = $q.defer();
            queryArtist.load({
                query: query,
                start: start,
                maxResults: 15
            }, function(resp) {
                q.resolve(resp);
            }, function(err) {
                q.reject(err);
            });
            q.promise.then(callback);
        }, 500),
        searchByTag: function(tag, callback) {
            var doSearch = ionic.debounce(function(tag, callback) {
                var cache = cacheEngine.get(tag+"_artist");
                var q = $q.defer();
                (cache) ? q.resolve(cache) : queryArtist.load({
                    tag: tag
                }, function(resp) {
                    cacheEngine.put(tag+"_artist", resp);
                    q.resolve(resp);
                }, function(err) {
                    q.reject(err);
                });
                q.promise.then(callback);
            }, 500);
            doSearch(tag, callback);
        },
        getArtistInfo: function(artistId, field, callback) {
            var cache = cacheEngine.get(artistId);
            var q = $q.defer();
            (cache) ? q.resolve(cache) : getById.load({
                Id: artistId,
                fields: field,
                relations: 'All'
            }, function(resp) {
                cacheEngine.put(artistId, resp);
                q.resolve(resp);
            }, function(err) {
                q.reject(err);
            });
            q.promise.then(callback);
        },
        getFavoritesList : function() {
            var artistString = window.localStorage['artists'];
            if(artistString) {
              return angular.fromJson(artistString);
            }
            return [];
        },
        isFavorites: function(artistId) {
            var artists = this.getFavoritesList();
            for(var i=0;i<artists.length;i++)
                if(artists[i].id==artistId) return true;
            return false;
        },
        addFavorites: function(artist) {
            var artists = this.getFavoritesList();
            for(var i=0;i<artists.length;i++)
            {   
                if(artists[i].id==artist.id){
                    artists.splice(i,1);
                    window.localStorage['artists'] = angular.toJson(artist);
                    return;
                }
            }
            artists.push(artist);
            window.localStorage['artists'] = angular.toJson(artists);
        }
    };
})

.factory('Album', function($resource, $q, $cacheFactory) {
    var endPoint = 'http://vocadb.net/api/albums';
    var cacheEngine = $cacheFactory('Album');
    var queryAlbums = $resource(endPoint,
            {
                fields: 'artists,tags',
                maxResults:25,
                getTotalCount: false,
                nameMatchMode: 'Auto',
                callback: 'JSON_CALLBACK'
            },
    {
        'load': {
            'method': 'JSONP',
            'cache': true
        }
    });

    var getById = $resource(endPoint + '/:Id',
            {
                fields: 'artists,names,pvs,tags,webLinks',
                callback: 'JSON_CALLBACK'
            },
    {
        'load': {
            'method': 'JSONP',
            'cache': true
        }
    });

    var getTracks = $resource(endPoint + '/:Id/tracks',
            {
                callback: 'JSON_CALLBACK'
            },
    {
        'load': {
            'method': 'JSONP',
            'cache': true,
            'isArray': true
        }
    });

    var albums = [];
    return {
        selectAlbum: null,
        term: '',
        search: function(query, callback) {
            this.term = query;
            var doSearch = ionic.debounce(function(query, callback) {
                var cache = cacheEngine.get(query);
                var q = $q.defer();
                (cache) ? q.resolve(cache) : queryAlbums.load({
                    query: query,
                    sort: (query)? 'Name' :'ReleaseDate'
                }, function(resp) {
                    cacheEngine.put(query, resp);
                    q.resolve(resp);
                }, function(err) {
                    q.reject(err);
                });
                q.promise.then(callback);
            }, 500);
            doSearch(query, callback);
        },
        loadMore: ionic.debounce(function(query,start, callback) {
            var q = $q.defer();
            queryAlbums.load({
                query: query,
                sort: (query)? 'Name' :'ReleaseDate',
                start: start,
                maxResults: 15
            }, function(resp) {
                q.resolve(resp);
            }, function(err) {
                q.reject(err);
            });
            q.promise.then(callback);
        }, 500),
        searchByTag: function(tag, callback) {
            var doSearch = ionic.debounce(function(tag, callback) {
                var cache = cacheEngine.get(tag+"_album");
                var q = $q.defer();
                (cache) ? q.resolve(cache) : queryAlbums.load({
                    tag: tag
                }, function(resp) {
                    cacheEngine.put(tag+"_album", resp);
                    q.resolve(resp);
                }, function(err) {
                    q.reject(err);
                });
                q.promise.then(callback);
            }, 500);
            doSearch(tag, callback);
        },
        getAlbumById: function(albumId, callback) {
            var cache = cacheEngine.get(albumId);
            var q = $q.defer();
            (cache) ? q.resolve(cache) : getById.load({
                Id: albumId
            }, function(resp) {
                cacheEngine.put(albumId, resp);
                q.resolve(resp);
            }, function(err) {
                q.reject(err);
            });
            q.promise.then(callback);
        },
        getAlbumByFields: function(albumId, field, callback) {
            var cache = cacheEngine.get(albumId);
            var q = $q.defer();
            (cache) ? q.resolve(cache) : getById.load({
                Id: albumId,
                fields: field
            }, function(resp) {
                cacheEngine.put(albumId, resp);
                q.resolve(resp);
            }, function(err) {
                q.reject(err);
            });
            q.promise.then(callback);
        },
        getTracksById: function(albumId, callback) {
            var cache = cacheEngine.get(albumId + '_track');
            var q = $q.defer();
            (cache) ? q.resolve(cache) : getTracks.load({
                Id: albumId
            }, function(resp) {
                cacheEngine.put(albumId + '_track', resp);
                q.resolve(resp);
            }, function(err) {
                q.reject(err);
            });
            q.promise.then(callback);
        },
        getFavoritesList : function() {
            var albumString = window.localStorage['albums'];
            if(albumString) {
              return angular.fromJson(albumString);
            }
            return [];
        },
        isFavorites: function(albumId) {
            var albums = this.getFavoritesList();
            for(var i=0;i<albums.length;i++)
                if(albums[i].id==albumId) return true;
            return false;
        },
        addFavorites: function(album) {
            var albums = this.getFavoritesList();
            for(var i=0;i<albums.length;i++)
            {   
                if(albums[i].id==album.id){
                    albums.splice(i,1);
                    window.localStorage['albums'] = angular.toJson(album);
                    return;
                }
            }
            albums.push(album);
            window.localStorage['albums'] = angular.toJson(albums);
        }
    };
})


.factory('Entry', function($resource, $q, $cacheFactory) {

    var cacheEngine = $cacheFactory('Entry');
    var queryEntry = $resource('http://vocadb.net/api/entries',
            {
                fields:'MainPicture',
                getTotalCount: false,
                nameMatchMode: 'Auto',
                callback: 'JSON_CALLBACK'
            },
    {
        'load': {
            'method': 'JSONP',
            'cache': true
        }
    });

    return {
        term: "",
        search: function(query, callback) {
            this.term = query;
            var doSearch = ionic.debounce(function(query, callback) {
                var cache = cacheEngine.get(query);
                var q = $q.defer();
                (cache) ? q.resolve(cache) : queryEntry.load({
                    query: query
                }, function(resp) {
                    cacheEngine.put(query, resp);
                    q.resolve(resp);
                }, function(err) {
                    q.reject(err);
                });
                q.promise.then(callback);
            }, 500);
            doSearch(query, callback);
        }
    };
})


.factory('Tag', function($resource, $q, $cacheFactory) {

    var cacheEngine = $cacheFactory('Tag');
    var queryTag = $resource('http://vocadb.net/api/tags',
            {
                getTotalCount: false,
                maxResults:25,
                nameMatchMode: 'Auto',
                callback: 'JSON_CALLBACK'
            },
    {
        'load': {
            'method': 'JSONP',
            'cache': true
        }
    });
    
    var queryCategories = $resource('http://vocadb.net/api/tags/categoryNames',
            {
                callback: 'JSON_CALLBACK'
            },
        {
        'load': {
            'method': 'JSONP',
            'cache': true,
            'isArray': true
        }
    });

    return {
        term: "",
        search: function(query, callback) {
            this.term = query;
            var doSearch = ionic.debounce(function(query, callback) {
                var cache = cacheEngine.get(query);
                var q = $q.defer();
                (cache) ? q.resolve(cache) : queryTag.load({
                    query: query
                }, function(resp) {
                    cacheEngine.put(query, resp);
                    q.resolve(resp);
                }, function(err) {
                    q.reject(err);
                });
                q.promise.then(callback);
            }, 500);
            doSearch(query, callback);
        },
        searchByCategory: function(query,category, callback) {
            this.term = query;
            var doSearch = ionic.debounce(function(query,category, callback) {
                var cache = cacheEngine.get(query+"_"+category);
                var q = $q.defer();
                (cache) ? q.resolve(cache) : queryTag.load({
                    query: query,
                    categoryName:category
                }, function(resp) {
                    cacheEngine.put(query+"_"+category, resp);
                    q.resolve(resp);
                }, function(err) {
                    q.reject(err);
                });
                q.promise.then(callback);
            }, 500);
            doSearch(query,category, callback);
        },listCategories: function(callback) {
            var doSearch = ionic.debounce(function(callback) {
                var cache = cacheEngine.get("Categories");
                var q = $q.defer();
                (cache) ? q.resolve(cache) : queryCategories.load({}, function(resp) {
                    cacheEngine.put("Categories", resp);
                    q.resolve(resp);
                }, function(err) {
                    q.reject(err);
                });
                q.promise.then(callback);
            }, 500);
            doSearch(callback);
        }
    };
})

.service("Dialog",function($ionicPopup){
       this.showAlert = function(title,message,callback) {
           $ionicPopup.alert({
               title: title,
               template: message
           }).then(callback);
       }     
})

.service("Loading",function($ionicLoading){
    this.show = function() {
        $ionicLoading.show({
            template: 'Loading...'
        });
    };
            
    this.hide = function(){
        $ionicLoading.hide();
    };
 }) 
 
 .service("Storage",function(){
     this.addArtist = function(artistId) {
         var artists = getArtists();
         artists.push(artistId);
     };
     
     this.addAlbum = function(albumId) {
         var albums = getAlbums();
         albums.push(albumId);
     };
     
     this.addSong = function(songId) {
         var songs = getSongs();
         songs.push(songId);
     };
     
     this.getArtists = function() {
        var artistString = window.localStorage['artists'];
        if(artistString) {
          return angular.fromJson(artistString);
        }
        return [];
     };
     
     this.getAlbums = function() {
         var albumString = window.localStorage['albums'];
        if(albumString) {
          return angular.fromJson(albumString);
        }
        return [];
     };
     
     this.getSongs = function() {
        var songString = window.localStorage['songs'];
        if(songString) {
          return angular.fromJson(songString);
        }
        return [];
     };
     
     this.export = function() {
         
     };
     
     this.import = function(list) {
         
     };
     
     this.isFavoriteArtist = function(artist) {
         var artists = getArtists();
     };
     
     this.isFavoriteAlbum = function(album) {
         var albums = getAlbums();
     };
     
     this.isFavoriteSong = function(song) {
         var songs = getSongs();
     }
 })




