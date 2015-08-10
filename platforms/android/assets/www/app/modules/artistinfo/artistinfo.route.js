(function () {
    'use strict';

    angular
            .module('app.artistinfo')
            .run(appRun)
            .config(configure);

    /* @ngInject */
    function appRun() {
    }

    configure.$inject = ['$stateProvider', '$urlRouterProvider'];

    function configure($stateProvider, $urlRouterProvider)
    {
        $stateProvider.state('menu.artistinfo', getRoutes());
    }

    function getRoutes() {

        var routeConfig = {
            url: "/artist/:Id",
            views: {
                'menuContent': {
                    templateUrl: "app/modules/artistinfo/artistinfo.page.html",
                    controller: "ArtistInfoController as vm"
                }
            }    
        };

        return routeConfig;
    }
})();