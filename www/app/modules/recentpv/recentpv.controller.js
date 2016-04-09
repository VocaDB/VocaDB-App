(function() {
    'use strict';

    angular
        .module('app.recentpv')
        .controller('RecentPvController', RecentPvController);

    RecentPvController.$inject = ['$scope','songservice','logger'];

    function RecentPvController($scope,songservice,logger) {

        logger.info('enter RecentPvController');

        /*jshint validthis: true */
        var vm = this;

        vm.songs = [];
        vm.title = 'Recent PV';
        vm.query = '';
        vm.loading = false;
        vm.inited = false; //For check if data loaded at first time
        vm.enableLoadMore = true; //Need to prevent from infinite load when got empty result
        vm.doRefresh = doRefresh;
        vm.loadMore = loadMore;
        vm.queryRecentPv = queryRecentPv;
        vm.getMomentFromNow = getMomentFromNow;

        function queryRecentPv(start,replace) {
            vm.loading = true;
            return songservice.querySongtByPV(start).then(function(data) {
                vm.inited = true;

                if(replace) {
                    vm.songs = data.items;
                } else {
                  angular.forEach(data.items, function(value, key) {
                        vm.songs.push(value);
                    });
                }

                //Prevent from infinite load
                if(data.items.length==0)
                    vm.enableLoadMore = false;

                vm.loading = false;
                $scope.$broadcast('scroll.infiniteScrollComplete');
                $scope.$broadcast('scroll.refreshComplete');

                return vm.songs;
            });
        }

        function loadMore() {
            if(vm.enableLoadMore)
                queryRecentPv(vm.songs.length,false);
        }

        function doRefresh() {
            queryRecentPv(0,true);
        }

        function getMomentFromNow(strDateTime) {
            if(typeof strDateTime === 'undefined') return;
            return  moment(strDateTime + "+03:00").fromNow();
        }


    }
})();
