(function () {
    'use strict';

    angular
            .module('app.favorites')
            .run(appRun)
            .config(configure);

    /* @ngInject */
    function appRun() {
        //routehelper.configureRoutes(getRoutes());
    }

    configure.$inject = ['$stateProvider', '$urlRouterProvider'];

    function configure($stateProvider, $urlRouterProvider)
    {
        $stateProvider.state('menu.favorites', getRoutes());

    }

    function getRoutes() {

        var routeConfig = {
            url: "/favorites",
            views: {
                'menuContent': {
                    templateUrl: "app/modules/favorites/favorites.page.html",
                    controller: "FavoritesController as vm"
                }
            }      
        };

        return routeConfig;
    }
})();