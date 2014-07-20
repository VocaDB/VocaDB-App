/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

var app = angular.module('vocadb', ['ionic', 'ngResource','angularMoment']);


app.factory('Song', function($resource, $q, $cacheFactory) {
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
});

app.factory('Artist', function($resource, $q, $cacheFactory) {

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
});

app.factory('Album', function($resource, $q, $cacheFactory) {
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
});


app.factory('Entry', function($resource, $q, $cacheFactory) {

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
});


app.factory('Tag', function($resource, $q, $cacheFactory) {

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

app.config(function($stateProvider, $urlRouterProvider) {
    $stateProvider
            .state('tab', {
                url: "/tab",
                templateUrl: "menu.html",
                controller: function($scope, $ionicSideMenuDelegate) {
                    $scope.toggleLeft = function() {
                        $ionicSideMenuDelegate.toggleLeft();
                    };
                }
            })
            .state('tab.song', {
                url: "/song",
                views: {
                    'menuContent': {
                        templateUrl: "songlist.html",
                        controller: function($scope, Song)
                        {
                            //Init
                            $scope.songs = Song.songs;
                            $scope.query = Song.term;

                            //Function
                            $scope.selectSong = function(song) {
                                Song.selectSong = song;
                            };

                            $scope.search = function() {
                                $scope.loading = true;
                                Song.search($scope.query, function(resp) {
                                    Song.songs = resp.items;
                                    $scope.loading = false;
                                    $scope.songs = Song.songs;
                                });
                            };
                        }
                    }
                }
            }).state('tab.songdetail', {
        url: "/song/:Id",
        views: {
            'menuContent': {
                templateUrl: "songdetail.html",
                controller: function($scope, Song,$ionicScrollDelegate, $stateParams) {
                    $scope.accordian = [false,false,false];
                    $scope.toggle = function(index) {
                         $scope.accordian[index] =  !$scope.accordian[index];
                         $ionicScrollDelegate.resize();
                    };
                    $scope.isShown = function(index) {
                      return $scope.accordian[index];
                    };
                    //get song and fields
                    Song.getByField($stateParams.Id, 'ThumbUrl,Artists,PVs,Albums,Tags,Names', function(resp) {
                        $scope.song = resp;
                        $scope.artists = resp.artists;
                        $scope.PVs = resp.pVs;
                        $scope.albums = resp.albums;
                        
                    });
                }
            }
        }
    }).state('tab.artist', {
        url: "/artist",
        views: {
            'menuContent': {
                templateUrl: "artistlist.html",
                controller: function($scope, Artist) {

                    $scope.artists = Artist.artists;
                    $scope.query = Artist.term;

                    //Function
                    $scope.search = function() {
                        $scope.loading = true;
                        Artist.search($scope.query, function(resp) {
                            Artist.artists = resp.items;
                            $scope.loading = false;
                            $scope.artists = resp.items;
                        });
                    };


                }
            }
        }})
            .state('tab.artistdetail', {
                url: "/artist/:Id",
                views: {
                    'menuContent': {
                        templateUrl: "artistdetail.html",
                        controller: function($scope, $stateParams,$ionicScrollDelegate, Artist) {
                            Artist.getArtistInfo($stateParams.Id, 'Description,WebLinks,Tags,Names', function(resp) {
                                $scope.artist = resp;
                                $scope.latestAlbums = resp.relations.latestAlbums;
                                $scope.popularAlbums = resp.relations.popularAlbums;
                                 $scope.latestSongs = resp.relations.latestSongs;
                                $scope.popularSongs = resp.relations.popularSongs;

                                $scope.accordian = [false,false,false,false];
                                  $scope.toggle = function(index) {
                                       $scope.accordian[index] =  !$scope.accordian[index];
                                       $ionicScrollDelegate.resize();
                                  };
                                  $scope.isShown = function(index) {
                                    return $scope.accordian[index];
                                  };
                            });
                        }
                    }
                }
            })
            .state('tab.album', {
                url: "/album",
                views: {
                    'menuContent': {
                        templateUrl: "albumlist.html",
                        controller: function($scope, Album) {

                            $scope.albums = Album.albums;
                            $scope.query = Album.term;

                            $scope.selectAlbum = function(album) {
                                Album.selectAlbum = album;
                            };
                            
                            $scope.scan = function() {
                                var resp = function(result) { 
                                    if (!result.cancelled){
                                        $scope.query=result.text; 
                                        $scope.search();
                                    }
                                    
                                };
                                cordova.plugins.barcodeScanner.scan(resp);
                            }

                            $scope.search = function() {
                                $scope.loading = true;
                                Album.search($scope.query, function(resp) {
                                    Album.albums = resp.items;
                                    $scope.loading = false;
                                    $scope.albums = resp.items;
                                });
                            };
                        }
                    }
                }
            }).state('tab.albumdetail', {
        url: "/album/:Id",
        views: {
            'menuContent': {
                templateUrl: "albumdetail.html",
                controller: function($scope, Album,$ionicScrollDelegate, $stateParams) {
                    
                    $scope.trackGroup = [];
                    $scope.accordian = [false,false,false];
                            $scope.toggle = function(index) {
                                 $scope.accordian[index] =  !$scope.accordian[index];
                                 $ionicScrollDelegate.resize();
                            };
                            $scope.isShown = function(index) {
                              return $scope.accordian[index];
                    };
                 
                    Album.getAlbumById($stateParams.Id, function(resp) {
                            $scope.album = resp;
                            Album.getTracksById($stateParams.Id, function(resp) {
                                $scope.tracks = resp;
                                for(i=1;i<$scope.tracks.length;i++)
                                    if($scope.tracks[i].discNumber!=$scope.tracks[i-1].discNumber || i==1) $scope.trackGroup.push($scope.tracks[i].discNumber);
                            });
                        });



                }
            }
        }
    }).state('tab.recentPV', {
        url: "/recentPV",
        views: {
            'menuContent': {
                templateUrl: "recentPV.html",
                controller: function($scope, Song) {
                    $scope.songs = [];
                   
                    $scope.doRefresh = function() {
                        Song.loadRecentPVs(0, function(resp) {
                            $scope.songs = resp.items;
                            $scope.$broadcast('scroll.refreshComplete');
                            
                        });
                    };

                    $scope.loadMore = function() {
                        
                            Song.loadRecentPVs($scope.songs.length, function(resp) {
                                angular.forEach(resp.items, function(value, key) {
                                    $scope.songs.push(value);
                                });
                                $scope.$broadcast('scroll.infiniteScrollComplete');
                                
                            });

                    };


                }
            }
        }
    })
    .state('tab.tag', {
        url: "/tag",
        views: {
            'menuContent': {
                templateUrl: "taglist.html",
                controller: function($scope,Tag,$ionicScrollDelegate) {
                    
                    //$scope.categories = ["Copyrights","Genres"];
                    Tag.listCategories(function(resp){
                        $scope.categories = resp;
                    });
                    
                    $scope.selected = null;
                    $scope.search = function() {
                        if($scope.selected){
                            $scope.loading = true;
                             Tag.searchByCategory($scope.query,$scope.selected, function(resp) {
                                $scope.loading = false;
                                $scope.tags = resp.items;
                            });
                        }else{
                            
                            if(!$scope.query) $scope.tags=[];
                            else
                            {
                                $scope.loading = true;
                                 Tag.search($scope.query, function(resp) {
                                $scope.loading = false;
                                $scope.tags = resp.items;
                                });
                            }
                        }
                    }; 
                    $scope.isShow = function(){
                            return !($scope.tags.length && $scope.query);
                    }
                     $scope.select = function(category){
                         if($scope.selected!=category){
                            $scope.selected=category;
                            $scope.loading = true;
                            Tag.searchByCategory($scope.query,category, function(resp) {
                                $scope.loading = false;
                                $scope.tags = resp.items;
                            });
                         }else{
                             $scope.selected=null;
                             $scope.search();
                             
                         }
                        $ionicScrollDelegate.resize();
                    };
                }
            }
        }})
    .state('tab.tagdetail', {
        url: "/tag/detail/:tagName",
        views: {
            'menuContent': {
                templateUrl: "tagdetail.html",
                controller: function($scope,$stateParams,Album,Song,Artist) {
                    var tag = $stateParams.tagName;
                    $scope.title = "#"+tag;
                    $scope.tags = { songs:[],artists:[],albums:[]};
                    //Function
                    Song.searchByTag(tag, function(resp) {
                            $scope.tags.songs = resp.items;
                        });
                    Artist.searchByTag(tag, function(resp) {
                            $scope.tags.artists = resp.items;
                        }); 
                    Album.searchByTag(tag, function(resp) {
                            $scope.tags.albums = resp.items;
                        });   
                }
            }
        }}).state('tab.about', {
            url: "/about",
            views: {
              'menuContent' :{
                templateUrl: "about.html"
              }
            } 
          });


    $urlRouterProvider.otherwise("/tab/song");
});
app.controller('mainCtrl', function($scope, $ionicSideMenuDelegate, $ionicModal, Entry) {

    //Utility Function
    $scope.toggleRight = function() {
        $ionicSideMenuDelegate.toggleRight();
    };

    $scope.toggleLeft = function() {
        $ionicSideMenuDelegate.toggleLeft();
    };
    $scope.open = function(url) {
        navigator.app.loadUrl(url, {openExternal: true});
    };
    $scope.getArtistImage = function(artistId) {
        return 'http://vocadb.net/Artist/Picture/' + artistId;
    };
    $scope.getAlbumImage = function(albumId) {
        return 'http://vocadb.net/Album/CoverPicture/' + albumId;
    };
    
    $scope.shareSong = function(songId){
        window.plugins.socialsharing.share(null, null, null, 'http://vocadb.net/S/'+songId);
    }
    $scope.shareArtist = function(artistId){
        window.plugins.socialsharing.share(null, null, null, 'http://vocadb.net/Ar/'+artistId);
    }
    $scope.shareAlbum = function(albumId){
        window.plugins.socialsharing.share(null, null, null, 'http://vocadb.net/Al/'+albumId);
    }

    $scope.getMediaIcon = function(service) {
        if (angular.equals(service, 'NicoNicoDouga'))
            return 'img/niconico.png';
        if (angular.equals(service, 'Youtube'))
            return 'img/youtube.png';
        if (angular.equals(service, 'Piapro'))
            return 'img/Piapro.jpeg';
    };

    $scope.getOfficialLinks = function(weblinks) {
        $filter('filter')(weblinks, {category: 'Official'}, true);
    };

    $scope.getWeblinkIcon = function(domain) {
        if (domain.indexOf('nicovideo') >= 0)
            return 'img/niconico.png';
        if (domain.indexOf('youtube') >= 0)
            return 'img/youtube.png';
        if (domain.indexOf('piapro') >= 0)
            return 'img/Piapro.jpeg';
        if (domain.indexOf('facebook') >= 0)
            return 'img/facebook.png';
        if (domain.indexOf('twitter') >= 0)
            return 'img/twitter.jpg'
        else
            return 'img/web.png';
    };

    $scope.getIcon = function(domain) {
        if (domain.indexOf('youtube') >= 0)
            return 'ion-social-youtube';
        if (domain.indexOf('facebook') >= 0)
            return 'ion-social-facebook';
        if (domain.indexOf('twitter') >= 0)
            return 'ion-social-twitter'
        if (domain.indexOf('tumblr') >= 0)
            return 'ion-social-tumblr'
        else
            return 'ion-earth';
    };

    //Get moment
    $scope.getMoment = function(strDateTime) {
         return new Date(strDateTime + "+03:00");
    };
    
    //Get Calculate Duration
    $scope.getDuration = function(lengthSeconds) {
        if(lengthSeconds<=0) return "";
        var minutes = parseInt( lengthSeconds / 60 ) % 60;
        var seconds = lengthSeconds % 60;

        var result = (minutes < 10 ? "0" + minutes : minutes) + ":" + (seconds  < 10 ? "0" + seconds : seconds);
        return "("+result+")";
    };
    
    $scope.getRating = function(rating){
           var count = Math.round(rating);
           var star = "";
           for(x=0;x<5;x++) (x<count)? star+="★" : star+="☆";
           return star;
    };
    
    $scope.getAdditionName = function(names){
                  var additionName = "";
                  if(names.length>1){
                       for(i=1;i<names.length;i++)
                           additionName+=names[i].value+", ";
                       return additionName.slice(0,additionName.length-2);
                  }
    };
    
    //Get Disc type
    $scope.getDiscType = function(discType) {
           return (angular.equals(discType, 'Album')) ? 'Original album': discType;
        };

    //Create and load the Modal for display Image
    $ionicModal.fromTemplateUrl('imageModal.html', function(modal) {
        $scope.imageModal = modal;
    }, {
        scope: $scope,
        animation: 'slide-in-up'
    });

    $scope.openModal = function(title, url) {
        $scope.modal = {title: title, src: url};
        $scope.imageModal.show();
    };

    $scope.closeModal = function() {
        $scope.imageModal.hide();
    };
    
    $scope.stringToHTML = function(text) {
        return text.replace(/\n/g,'<br/>').replace(/\r/g,'<br/>').replace(/\r\n/g,'<br/>');
    };

    //Search Modal
    $ionicModal.fromTemplateUrl('searchModal.html', function(modal) {
        $scope.searchModal = modal;
    }, {
        scope: $scope,
        animation: 'slide-in-up'
    });

    $scope.openSearchModal = function() {
        $scope.searchModal.show();
    };

    $scope.closeSearchModal = function() {
        $scope.searchModal.hide();
    };
    
    //Test Collection Repeat
    $scope.getItemHeight = function() {
        return 100;
    };
    

});
app.controller('searchModal', function($scope, Entry) {
    $scope.search = function() {
        $scope.loading = true;
        Entry.search($scope.searchQuery, function(resp) {

            $scope.loading = false;
            $scope.items = resp.items;
        });

        $scope.getEntry = function(id, entryType) {
            if (angular.equals(entryType, 'Song'))
                return '#/tab/song/' + id;
            if (angular.equals(entryType, 'Artist'))
                return '#/tab/artist/' + id;
            if (angular.equals(entryType, 'Album'))
                return '#/tab/album/' + id;
        };
        
        
    };
});
