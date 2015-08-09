(function() {
    'use strict';

    angular
        .module('app.allalbum')
        .controller('AllAlbumController', AllAlbumController);

    AllAlbumController.$inject = ['$scope','albumservice','logger'];

    function AllAlbumController($scope,albumservice,logger) {
       
        /*jshint validthis: true */
        var vm = this;
        
        vm.query = "";
        vm.enableScan = false;
        vm.albums = [];
        vm.scan = scan;
        vm.search = search;
        vm.queryAlbum = queryAlbum;
        
        function init() {
            if(ionic.Platform.isWebView()()) {
                vm.enableScan = true;
            } else {
                vm.enableScan = false;
            }
        }

        function queryAlbum() {
            albumservice.queryAlbum(vm.query,vm.albums.length).then(function(data) {
                angular.forEach(data.items, function(value, key) {
                        vm.albums.push(value);
                });
                $scope.$broadcast('scroll.infiniteScrollComplete');
            });
        }
        
        function search() {
            logger.info("Albums search..."+vm.query);
            albumservice.queryAlbum(vm.query,0).then(function(data) {
                vm.albums = data.items;
            });
        }
        
        function scan() {
            if(ionic.Platform.isWebView()()) {
                cordova.plugins.barcodeScanner.scan(scanCallback);
            }
        }
        
        function scanCallback(result) {
            if (!result.cancelled) {
                getAlbumByBarcode(result.text);
            }
        }
        
        function getAlbumByBarcode(barcode) {
            logger.info("Barcode scan..."+barcode);
            albumservice.getAlbumByBarcode(barcode).then(function(data) {
                logger.info("barcode result : "+data);
                vm.albums = data.items;
            });
        }
        
    }
})();
    