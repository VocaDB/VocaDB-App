(function () {
    'use strict';
    angular
            .module('app.service')
            .factory('favoriteservice', favoriteservice);

    favoriteservice.$inject = ['dataservice', 'exception'];


    /* @ngInject */
    function favoriteservice(dataservice, exception)
    {
        
        var service = {
            ready: dataservice.ready
        };

        return service;

        ///////////////////////////////////////
        
    }
})();