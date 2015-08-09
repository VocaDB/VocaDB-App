(function () {
    'use strict';

    angular
            .module('app.about')
            .run(appRun)
            .config(configure);

    /* @ngInject */
    function appRun() {
    }

    configure.$inject = ['$stateProvider', '$urlRouterProvider'];

    function configure($stateProvider, $urlRouterProvider)
    {
        $stateProvider.state('menu.about', getRoutes());
    }

    function getRoutes() {

        var routeConfig = {
            url: "/about",
            views: {
                'menuContent': {
                    templateUrl: "app/modules/about/about.page.html",
                    controller: "AboutController as vm"
                }
            }    
        };

        return routeConfig;
    }
})();