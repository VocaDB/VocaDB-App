var app = angular.module('vocadb', ['ionic', 'vocadb.services', 'vocadb.controllers', 'vocadb.directives'])

        .run(function($ionicPlatform) {
            
//            $ionicPlatform.ready(function() {
                console.log("Ready...isAndroid : "+ionic.Platform.isAndroid());
//            });
        })
        
        .config(function($stateProvider, $urlRouterProvider) {
            $stateProvider
                    .state('tab', {
                        url: "/tab",
                        templateUrl: "templates/menu.html",
                        controller: "menuCtrl"
                    })
                    .state('tab.home', {
                        url: "/home",
                        views: {
                            'menuContent': {
                                templateUrl: "templates/home.html",
                                controller: "homeCtrl"
                            }
                        }
                    })
                    .state('tab.song', {
                        url: "/song",
                        views: {
                            'menuContent': {
                                templateUrl: "templates/songList.html",
                                controller: "songListCtrl"
                            }
                        }
                    })
                    .state('tab.songdetail', {
                        url: "/song/:Id",
                        views: {
                            'menuContent': {
                                templateUrl: "templates/songInfo.html",
                                controller: "songInfoCtrl"
                            }
                        }
                    })

                    .state('tab.artist', {
                        url: "/artist",
                        views: {
                            'menuContent': {
                                templateUrl: "templates/artistList.html",
                                controller: "artistListCtrl"
                            }
                        }})
                    .state('tab.artistdetail', {
                        url: "/artist/:Id",
                        views: {
                            'menuContent': {
                                templateUrl: "templates/artistInfo.html",
                                controller: "artistInfoCtrl"
                            }
                        }
                    })
                    .state('tab.album', {
                        url: "/album",
                        views: {
                            'menuContent': {
                                templateUrl: "templates/albumList.html",
                                controller: "albumListCtrl"
                            }
                        }
                    })
                    .state('tab.albumdetail', {
                        url: "/album/:Id",
                        views: {
                            'menuContent': {
                                templateUrl: "templates/albumInfo.html",
                                controller: "albumInfoCtrl"
                            }
                        }
                    })
                    .state('tab.recentPV', {
                        url: "/recentPV",
                        views: {
                            'menuContent': {
                                templateUrl: "templates/recentPV.html",
                                controller: "recentPVCtrl"
                            }
                        }
                    })
                    .state('tab.tag', {
                        url: "/tag",
                        views: {
                            'menuContent': {
                                templateUrl: "templates/tagList.html",
                                controller: "tagListCtrl"
                            }
                        }})
                    .state('tab.tagdetail', {
                        url: "/tag/detail/:tagName",
                        views: {
                            'menuContent': {
                                templateUrl: "templates/tagInfo.html",
                                controller: "tagInfoCtrl"
                            }
                        }})
                    
                    .state('tab.favorites', {
                        url: "/favorites",
                        views: {
                            'menuContent': {
                                templateUrl: "templates/favoriteList.html",
                                controller: "favoriteCtrl"
                            }
                        }
                    })
                    .state('tab.about', {
                        url: "/about",
                        views: {
                            'menuContent': {
                                templateUrl: "templates/about.html",
                                controller: "aboutCtrl"
                            }
                        }
                    });
            $urlRouterProvider.otherwise("/tab/recentPV");
        });