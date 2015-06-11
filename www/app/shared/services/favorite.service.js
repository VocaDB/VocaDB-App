(function () {
    'use strict';
    angular
            .module('app.service')
            .factory('faveriteservice', faveriteservice);

    faveriteservice.$inject = ['dataservice', 'exception'];


    /* @ngInject */
    function faveriteservice(dataservice, exception)
    {
        var service = {
            ready: dataservice.ready
        };

        return service;

        ///////////////////////////////////////


    }
})();