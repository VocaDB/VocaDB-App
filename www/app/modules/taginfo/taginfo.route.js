(function () {
    'use strict';

    angular
            .module('app.taginfo')
            .run(appRun)
            .config(configure);

    /* @ngInject */
    function appRun() {
        //routehelper.configureRoutes(getRoutes());
    }

    configure.$inject = ['$stateProvider', '$urlRouterProvider'];

    function configure($stateProvider, $urlRouterProvider)
    {
        $stateProvider.state('menu.taginfo', getRoutes());
    }

    function getRoutes() {

        var routeConfig = {
            url: "/tag/detail/:Name",
            cache: false,
            views: {
                'menuContent': {
                    templateUrl: "app/modules/taginfo/taginfo.page.html",
                    controller: "TagInfoController as vm"
                }
            }      
        };

        return routeConfig;
    }
})();