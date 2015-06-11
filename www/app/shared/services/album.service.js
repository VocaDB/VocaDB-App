(function () {
    'use strict';
    angular
            .module('app.service')
            .factory('albumservice', albumservice);

    albumservice.$inject = ['dataservice', 'exception'];


    /* @ngInject */
    function albumservice(dataservice, exception)
    {
        var service = {
            ready: dataservice.ready
        };

        return service;

        ///////////////////////////////////////


    }
})();