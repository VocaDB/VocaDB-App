(function() {
    'use strict';

    angular
        .module('blocks.router')
        .provider('routehelperConfig', routehelperConfig)
        .factory('routehelper', routehelper);

    routehelper.$inject = ['logger', 'routehelperConfig'];
    
    function configure() {
        
    }

    // Must configure via the routehelperConfigProvider
    function routehelperConfig() {
        /* jshint validthis:true */
        this.config = {
            // These are the properties we need to set
            // $routeProvider: undefined
            // docTitle: ''
            // resolveAlways: {ready: function(){ } }
        };

        this.$get = function() {
            return {
                config: this.config
            };
        };
    }

    function routehelper( logger, routehelperConfig) {
        
        var service = {
            configureRoutes: configureRoutes
        };

        return service;
        ///////////////

        function configureRoutes(routes) {
            
//                $stateProvider.state(route.state,route.config);
            
//            $urlRouterProvider.otherwise({redirectTo: '/'});
        }
    }
})();