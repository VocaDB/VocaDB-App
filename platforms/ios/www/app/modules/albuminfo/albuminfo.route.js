(function () {
    'use strict';

    angular
            .module('app.albuminfo')
            .run(appRun)
            .config(configure);

    /* @ngInject */
    function appRun() {
        //routehelper.configureRoutes(getRoutes());
    }

    configure.$inject = ['$stateProvider', '$urlRouterProvider'];

    function configure($stateProvider, $urlRouterProvider)
    {
        $stateProvider.state('menu.albuminfo', getRoutes());
    }

    function getRoutes() {

        var routeConfig = {
            url: "/album/:Id",
            views: {
                'menuContent': {
                    templateUrl: "app/modules/albuminfo/albuminfo.page.html",
                    controller: "AlbumInfoController as vm"
                }
            }      
        };

        return routeConfig;
    }
})();