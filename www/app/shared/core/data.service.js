(function() {
    'use strict';

    angular
        .module('app.core')
        .factory('dataservice', dataservice);

    dataservice.$inject = ['$q','$resource', 'logger', 'apiurl'];

    /* @ngInject */
    function dataservice($q,$resource, logger, apiurl) {
        
        var service = {
            ready : ready,
            callApi : callApi
        };

        return service;

        ////////////////////////
        
        function ready(promises) {
            return $q.all(promises);
        }
        
        function getDefaultResource(apiUrl) {
            var paramDefaults = {callback: 'JSON_CALLBACK'};
            var actions = {
                'load': {
                    'method': 'JSONP',
                    'cache': true
                }
            };

            return $resource(apiUrl, paramDefaults, actions);
        }
        
        function callApi(endPoint,params) {
            var q = $q.defer();
            var apiUrl = apiurl(endPoint);
            
            logger.info("callapi url : ",apiUrl);
            logger.info("callapi params : ",angular.toJson(params));
            
            getDefaultResource(apiUrl).load(params, success, failure);

            function success(resp) {
                logger.info("return : ",angular.toJson(resp));
                q.resolve(resp);
            };
            
            function failure(err) {
                q.reject(err);
            }
            ;
            
            return q.promise;
        }
    }
})();