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
        vm.barcode = "";
        vm.loading = false;
        vm.inited = false; //For check if data loaded at first time
        vm.enableScan = false;
        vm.enableLoadMore = true; //Need to prevent from infinite load when got empty result
        vm.albums = [];
        vm.scan = scan;
        vm.search = search;
        vm.queryAlbum = queryAlbum;
        vm.loadMore = loadMore;
        vm.init = init;
        
        init();
        
        function init() {
            if(ionic.Platform.isWebView()) {
                vm.enableScan = true;
            } else {
                vm.enableScan = false;
            }
        }

        function queryAlbum(query,barcode,start,replace) {
            vm.loading = true;
            albumservice.queryAlbum(query,barcode,start).then(function(data) {
                vm.inited = true;
                vm.loading = false;
                
                if(replace) {
                    vm.albums = data.items;
                }
                else {
                   angular.forEach(data.items, function(value, key) {
                        vm.albums.push(value);    
                    });
                }
                
                //Prevent from infinite load
                if(data.items.length==0)
                    vm.enableLoadMore = false;
                
                $scope.$broadcast('scroll.infiniteScrollComplete');
            });
        }
        
        function loadMore() {
            if(vm.enableLoadMore)
                queryAlbum(vm.query,vm.barcode,vm.albums.length);     
        }
        
        function search() {
            logger.info("Albums search..."+vm.query);
            queryAlbum(vm.query,"",0,true);
        }
        
        function scan() {
            if(ionic.Platform.isWebView()) {
                cordova.plugins.barcodeScanner.scan(scanCallback,scanCallbackError);    
            }
        }
        
        function scanCallback(result) {
            if (!result.cancelled) {
                vm.barcode = result.text;
                getAlbumByBarcode();
            }
        }
        
        function scanCallbackError(error) {
            alert("Scanning failed: " + error);
        }
        
        function getAlbumByBarcode() {
            logger.info("Albums barcode search..."+vm.barcode);
            queryAlbum("",vm.barcode,0,true);
        }
        
    }
})();
    