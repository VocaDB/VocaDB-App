angular.module('vocadb.services', ['ngResource'])

.factory('Song', function($resource, $q, $cacheFactory) {
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
        }, 500)
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
});


