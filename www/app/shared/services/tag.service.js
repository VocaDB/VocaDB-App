(function () {
    'use strict';
    angular
            .module('app.service')
            .factory('tagservice', tagservice);

    tagservice.$inject = ['dataservice', 'exception'];


    /* @ngInject */
    function tagservice(dataservice, exception)
    {
        var service = {
            ready: dataservice.ready
        };

        return service;

        ///////////////////////////////////////


    }
})();