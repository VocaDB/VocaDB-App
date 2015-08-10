(function () {
    'use strict';

    angular
            .module('app.allalbum')
            .run(appRun)
            .config(configure);

    /* @ngInject */
    function appRun() {
        //routehelper.configureRoutes(getRoutes());
    }

    configure.$inject = ['$stateProvider', '$urlRouterProvider'];

    function configure($stateProvider, $urlRouterProvider)
    {
        $stateProvider.state('menu.album', getRoutes());

    }

    function getRoutes() {

        var routeConfig = {
            url: "/album",
            views: {
                'menuContent': {
                    templateUrl: "app/modules/allalbum/allalbum.page.html",
                    controller: "AllAlbumController as vm"
                }
            }      
        };

        return routeConfig;
    }
})();