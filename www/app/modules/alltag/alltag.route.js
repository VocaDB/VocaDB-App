(function () {
    'use strict';

    angular
            .module('app.alltag')
            .run(appRun)
            .config(configure);

    /* @ngInject */
    function appRun() {
        //routehelper.configureRoutes(getRoutes());
    }

    configure.$inject = ['$stateProvider', '$urlRouterProvider'];

    function configure($stateProvider, $urlRouterProvider)
    {
        $stateProvider.state('menu.tag', getRoutes());

    }

    function getRoutes() {

        var routeConfig = {
            url: "/tag",
            views: {
                'menuContent': {
                    templateUrl: "app/modules/alltag/alltag.page.html",
                    controller: "AllTagController as vm"
                }
            }      
        };

        return routeConfig;
    }
})();