angular.module('vocadb.controllers', [])

        .controller('menuCtrl', function($scope, $ionicSideMenuDelegate) {
            $scope.toggleLeft = function() {
                $ionicSideMenuDelegate.toggleLeft();
            };
        })
        
        .controller('homeCtrl',function($scope){
            
        })

        .controller('recentPVCtrl', function($scope, Song, Dialog) {
            $scope.songs = [];
            $scope.loadSuccess = false;
            $scope.doRefresh = function() {
                Song.loadRecentPVs(0, function(resp) {
                    $scope.songs = resp.items;
                    $scope.$broadcast('scroll.refreshComplete');
                });
            };
            $scope.loadMore = function() {
                Song.loadRecentPVs($scope.songs.length, function(resp) {
                   console.log("asddddddddddddasd");
                    angular.forEach(resp.items, function(value, key) {
                        $scope.songs.push(value);
                    });
                    $scope.$broadcast('scroll.infiniteScrollComplete');
                });
            };
            $scope.onRetry = function() {
                Dialog.showAlert("Title","And Message",null);
            };
        })

        .controller('songListCtrl', function($scope, Song) {
            //Init
            $scope.songs = [];
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
            
             $scope.loadMore = function() {
                Song.loadMore($scope.query,$scope.songs.length, function(resp) {
                    angular.forEach(resp.items, function(value, key) {
                        $scope.songs.push(value);
                    });
                    $scope.$broadcast('scroll.infiniteScrollComplete');
                });
            };
        })

        .controller('songInfoCtrl', function($scope, Song, $ionicScrollDelegate, $stateParams) {
            $scope.accordian = [false, false, false];
            $scope.toggle = function(index) {
                $scope.accordian[index] = !$scope.accordian[index];
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
            
            $scope.isFavorites = function(songId) {
                return Song.isFavorites(songId);
            };
            
            $scope.addFavorites = function(song) {
                Song.addFavorites(song);
            }
        })

        .controller('albumListCtrl', function($scope, Album) {
            $scope.albums = [];
            $scope.query = Album.term;
            $scope.selectAlbum = function(album) {
                Album.selectAlbum = album;
            };
            $scope.scan = function() {
                var resp = function(result) {
                    if (!result.cancelled) {
                        $scope.query = result.text;
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
            
            $scope.loadMore = function() {
                Album.loadMore($scope.query,$scope.albums.length, function(resp) {
                    
                    angular.forEach(resp.items, function(value, key) {
                        $scope.albums.push(value);
                    });
                    $scope.$broadcast('scroll.infiniteScrollComplete');
                });
            };
        })

        .controller('albumInfoCtrl', function($scope, Album, $ionicScrollDelegate, $stateParams) {
            $scope.trackGroup = [];
            $scope.accordian = [false, false, false];
            $scope.toggle = function(index) {
                $scope.accordian[index] = !$scope.accordian[index];
                $ionicScrollDelegate.resize();
            };
            $scope.isShown = function(index) {
                return $scope.accordian[index];
            };
            Album.getAlbumById($stateParams.Id, function(resp) {
                $scope.album = resp;
                Album.getTracksById($stateParams.Id, function(resp) {
                    $scope.tracks = resp;
                    for (i = 1; i < $scope.tracks.length; i++)
                        if ($scope.tracks[i].discNumber != $scope.tracks[i - 1].discNumber || i == 1)
                            $scope.trackGroup.push($scope.tracks[i].discNumber);
                });
            });
            
            $scope.isFavorites = function(albumId) {
                return Album.isFavorites(albumId);
            };
            
            $scope.addFavorites = function(album) {
                Album.addFavorites(album);
            }
        })

        .controller('artistListCtrl', function($scope, Artist) {
            $scope.artists = [];
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
            
            $scope.loadMore = function() {
                Artist.loadMore($scope.query,$scope.artists.length, function(resp) {
                    angular.forEach(resp.items, function(value, key) {
                        $scope.artists.push(value);
                    });
                    $scope.$broadcast('scroll.infiniteScrollComplete');
                });
            };
        })

        .controller('artistInfoCtrl', function($scope, $stateParams, $ionicScrollDelegate, Artist) {
            Artist.getArtistInfo($stateParams.Id, 'Description,WebLinks,Tags,Names', function(resp) {
                $scope.artist = resp;
                $scope.latestAlbums = resp.relations.latestAlbums;
                $scope.popularAlbums = resp.relations.popularAlbums;
                $scope.latestSongs = resp.relations.latestSongs;
                $scope.popularSongs = resp.relations.popularSongs;
                $scope.accordian = [false, false, false, false];
                $scope.toggle = function(index) {
                    $scope.accordian[index] = !$scope.accordian[index];
                    $ionicScrollDelegate.resize();
                };
                $scope.isShown = function(index) {
                    return $scope.accordian[index];
                };
                
                $scope.isFavorites = function(artistId) {
                    return Artist.isFavorites(artistId);
                };

                $scope.addFavorites = function(artist) {
                    Artist.addFavorites(artist);
                }
            });
        })
        
        .controller('favoriteCtrl', function($scope, Song, Artist, Album) {
            $scope.songs = Song.getFavoritesList();
            $scope.artists = Artist.getFavoritesList();
            $scope.albums = Album.getFavoritesList();
        })

        .controller('tagListCtrl', function($scope, Tag, $ionicScrollDelegate) {
            Tag.listCategories(function(resp) {
                $scope.categories = resp;
            });
            $scope.selected = null;
            $scope.search = function() {
                if ($scope.selected) {
                    $scope.loading = true;
                    Tag.searchByCategory($scope.query, $scope.selected, function(resp) {
                        $scope.loading = false;
                        $scope.tags = resp.items;
                    });
                } else {
                    if (!$scope.query)
                        $scope.tags = [];
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
            $scope.isShow = function() {
                return !($scope.tags.length && $scope.query);
            }
            $scope.select = function(category) {
                if ($scope.selected != category) {
                    $scope.selected = category;
                    $scope.loading = true;
                    Tag.searchByCategory($scope.query, category, function(resp) {
                        $scope.loading = false;
                        $scope.tags = resp.items;
                    });
                } else {
                    $scope.selected = null;
                    $scope.search();
                }
                $ionicScrollDelegate.resize();
            };
        })

        .controller('tagInfoCtrl', function($scope, $stateParams, Album, Song, Artist) {
            var tag = $stateParams.tagName;
            $scope.title = "#" + tag;
            $scope.tags = {songs: [], artists: [], albums: []};
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
        })

        .controller('aboutCtrl', function($scope) {

        })

        

        .controller('mainCtrl', function($scope, $ionicSideMenuDelegate, $ionicModal, Entry) {

            //Utility Function
            $scope.toggleRight = function() {
                $ionicSideMenuDelegate.toggleRight();
            };

            $scope.toggleLeft = function() {
                $ionicSideMenuDelegate.toggleLeft();
            };
            $scope.open = function(url) {
                navigator.app.loadUrl(url, {openExternal: true}); //for android
//                window.open(url, '_system');
            };
            $scope.getArtistImage = function(artistId) {
                return 'http://vocadb.net/Artist/Picture/' + artistId;
            };
            $scope.getAlbumImage = function(albumId) {
                return 'http://vocadb.net/Album/CoverPicture/' + albumId;
            };

            $scope.shareSong = function(songId) {
                window.plugins.socialsharing.share(null, null, null, 'http://vocadb.net/S/' + songId);
            }
            $scope.shareArtist = function(artistId) {
                window.plugins.socialsharing.share(null, null, null, 'http://vocadb.net/Ar/' + artistId);
            }
            $scope.shareAlbum = function(albumId) {
                window.plugins.socialsharing.share(null, null, null, 'http://vocadb.net/Al/' + albumId);
            }

            $scope.getMediaIcon = function(service) {
                if (angular.equals(service, 'NicoNicoDouga'))
                    return 'img/niconico.png';
                if (angular.equals(service, 'Youtube'))
                    return 'img/youtube.png';
                if (angular.equals(service, 'Piapro'))
                    return 'img/piapro.jpeg';
                if (angular.equals(service, 'SoundCloud'))
                    return 'img/soundcloud.jpeg';
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

            $scope.getMomentFromNow = function(strDateTime) {
                if(typeof strDateTime === 'undefined') return;
                return  moment(strDateTime + "+03:00").fromNow();
            };

            //Get Calculate Duration
            $scope.getDuration = function(lengthSeconds) {
                if (lengthSeconds <= 0)
                    return "";
                var minutes = parseInt(lengthSeconds / 60) % 60;
                var seconds = lengthSeconds % 60;

                var result = (minutes < 10 ? "0" + minutes : minutes) + ":" + (seconds < 10 ? "0" + seconds : seconds);
                return "(" + result + ")";
            };

            $scope.getRating = function(rating) {
                var count = Math.round(rating);
                var star = "";
                for (x = 0; x < 5; x++)
                    (x < count) ? star += "★" : star += "☆";
                return star;
            };

            $scope.getAdditionName = function(names) {
                var additionName = "";
                if(typeof names === 'undefined') return;
                if (names.length > 1) {
                    for (i = 1; i < names.length; i++)
                        additionName += names[i].value + ", ";
                    return additionName.slice(0, additionName.length - 2);
                }
            };

            //Get Disc type
            $scope.getDiscType = function(discType) {
                return (angular.equals(discType, 'Album')) ? 'Original album' : discType;
            };

            //Create and load the Modal for display Image
            $ionicModal.fromTemplateUrl('templates/imageModal.html', function(modal) {
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
                return text.replace(/\n/g, '<br/>').replace(/\r/g, '<br/>').replace(/\r\n/g, '<br/>');
            };

            //Search Modal
            $ionicModal.fromTemplateUrl('templates/searchModal.html', function(modal) {
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


        })

.controller('searchModal', function($scope, Entry) {
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
})

