(function () {
    'use strict';

    angular
            .module('app.allsong')
            .run(appRun)
            .config(configure);

    /* @ngInject */
    function appRun() {
        //routehelper.configureRoutes(getRoutes());
    }

    configure.$inject = ['$stateProvider', '$urlRouterProvider'];

    function configure($stateProvider, $urlRouterProvider)
    {
        $stateProvider.state('menu.songs', getRoutes());
    }

    function getRoutes() {

        var routeConfig = {
            url: "/songs",
            views: {
                'menuContent': {
                    templateUrl: "app/modules/allsong/allsong.page.html",
                    controller: "SongListController as vm"
                }
            }      
        };

        return routeConfig;
    }
})();