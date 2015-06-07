(function() {
    'use strict';

    angular
        .module('app.menus')
        .run(appRun)
        .config(configure);

    /* @ngInject */
    function appRun() {
        //routehelper.configureRoutes(getRoutes());
    }

    configure.$inject = ['$stateProvider', '$urlRouterProvider'];
    
    function configure($stateProvider, $urlRouterProvider)
    {
        $stateProvider.state('menu',getRoutes());
        
        //Default
        $urlRouterProvider.otherwise("/menu/songs");
    }
    
    function getRoutes() {
        
        var routeConfig = {
                url: "/menu",
                templateUrl: 'app/modules/menu/menu.page.html',
                controller: 'MenusController as vm'        
        };
        
        return routeConfig;
    }
})();