(function() {
    'use strict';

    var core = angular.module('app.core');

    var config = {
        appErrorPrefix: '[VocaDB Error] ', //Configure the exceptionHandler decorator
        appTitle: 'VocaDB App',
        version: '1.0.0'
    };
    
    configure.$inject = ['$logProvider', 'exceptionHandlerProvider'];

    core.value('config', config);

    core.config(configure);
    
    

    /* @ngInject */
    function configure ($logProvider, exceptionHandlerProvider) {
        // turn debugging off/on (no info or warn)
        if ($logProvider.debugEnabled) {
            $logProvider.debugEnabled(true);
        }

        // Configure the common route provider
//        routehelperConfigProvider.config.$routeProvider = $routeProvider;
//        routehelperConfigProvider.config.docTitle = 'VocaDB: ';
//        var resolveAlways = { /* @ngInject */
//            ready: function(dataservice) {
//                return dataservice.ready();
//            }
//            // ready: ['dataservice', function (dataservice) {
//            //    return dataservice.ready();
//            // }]
//        };
//        routehelperConfigProvider.config.resolveAlways = resolveAlways;

        // Configure the common exception handler
        exceptionHandlerProvider.configure(config.appErrorPrefix);
    }
})();