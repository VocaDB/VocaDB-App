
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

var app = angular.module('vocadb', ['ionic', 'vocadb.services', 'vocadb.controllers'])

        .run(function($ionicPlatform) {
//            $ionicPlatform.ready(function() {
//                console.log("Ready...isAndroid : "+ionic.Platform.isAndroid());
//            });
        })
        
        .config(function($stateProvider, $urlRouterProvider) {
            $stateProvider
                    .state('tab', {
                        url: "/tab",
                        templateUrl: "templates/menu.html",
                        controller: "menuCtrl"
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
        