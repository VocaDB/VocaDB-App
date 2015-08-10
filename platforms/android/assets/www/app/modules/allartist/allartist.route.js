(function () {
    'use strict';

    angular
            .module('app.allartist')
            .run(appRun)
            .config(configure);

    /* @ngInject */
    function appRun() {
        //routehelper.configureRoutes(getRoutes());
    }

    configure.$inject = ['$stateProvider', '$urlRouterProvider'];

    function configure($stateProvider, $urlRouterProvider)
    {
        $stateProvider.state('menu.artist', getRoutes());

    }

    function getRoutes() {

        var routeConfig = {
            url: "/artist",
            views: {
                'menuContent': {
                    templateUrl: "app/modules/allartist/allartist.page.html",
                    controller: "AllArtistController as vm"
                }
            }
//                templateUrl: 'app/modules/allartist/allartist.page.html',
//                controller: 'AllArtistController as vm'        
        };

        return routeConfig;
    }
})();