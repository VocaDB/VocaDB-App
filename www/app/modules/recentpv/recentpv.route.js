(function () {
    'use strict';

    angular
            .module('app.recentpv')
            .run(appRun)
            .config(configure);

    /* @ngInject */
    function appRun() {
        //routehelper.configureRoutes(getRoutes());
    }

    configure.$inject = ['$stateProvider', '$urlRouterProvider'];

    function configure($stateProvider, $urlRouterProvider)
    {
        $stateProvider.state('menu.recentpv', getRoutes());

    }

    function getRoutes() {

        var routeConfig = {
            url: "/recentpv",
            views: {
                'menuContent': {
                    templateUrl: "app/modules/recentpv/recentpv.page.html",
                    controller: "RecentPvController as vm"
                }
            }      
        };

        return routeConfig;
    }
})();