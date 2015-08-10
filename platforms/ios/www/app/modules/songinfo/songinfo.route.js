(function () {
    'use strict';

    angular
            .module('app.songinfo')
            .run(appRun)
            .config(configure);

    /* @ngInject */
    function appRun() {
    }

    configure.$inject = ['$stateProvider', '$urlRouterProvider'];

    function configure($stateProvider, $urlRouterProvider)
    {
        $stateProvider.state('menu.songinfo', getRoutes());
    }

    function getRoutes() {

        var routeConfig = {
            url: "/songs/:Id",
            views: {
                'menuContent': {
                    templateUrl: "app/modules/songinfo/songinfo.page.html",
                    controller: "SongInfoController as vm"
                }
            }    
        };

        return routeConfig;
    }
})();