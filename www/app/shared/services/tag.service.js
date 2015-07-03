(function () {
    'use strict';
    angular
            .module('app.service')
            .factory('tagservice', tagservice);

    tagservice.$inject = ['dataservice', 'exception','logger'];


    /* @ngInject */
    function tagservice(dataservice, exception, logger)
    {
        var service = {
            ready: dataservice.ready,
            queryTag: queryTag,
            getTagsByCategory: getTagsByCategory,
            listCategories: listCategories
            
        };

        return service;

        ///////////////////////////////////////
        function queryTag(query) {
            var parms = {
                query: query,
                getTotalCount: false,
                maxResults:25,
                nameMatchMode: 'Auto'
            };

            return dataservice.callApi('/api/tags', parms)
                    .then(queryTagComplete)
                    .catch(function (message) {
                        exception.catcher('Call API Failed for queryTag')(message);
                        //$location.url('/');
                    });

            function queryTagComplete(data, status, headers, config) {
                return data;
            }
        }
        
        function getTagsByCategory(query, category) {
            var parms = {
                query: query,
                categoryName: category,
                getTotalCount: false,
                maxResults:25,
                nameMatchMode: 'Auto'   
            };

            return dataservice.callApi('/api/tags', parms)
                    .then(getTagsByCategoryComplete)
                    .catch(function (message) {
                        exception.catcher('Call API Failed for getTagsByCategory')(message);
                        //$location.url('/');
                    });

            function getTagsByCategoryComplete(data, status, headers, config) {
                
                return data;
            }
        }
        
        function listCategories() {
            var parms = {};
            var load = {
                'isArray': true
            };

            return dataservice.callApi('/api/tags/categoryNames', parms, load)
                    .then(listCategoriesComplete)
                    .catch(function (message) {
                        exception.catcher('Call API Failed for listCategories')(message);
                        //$location.url('/');
                    });

            function listCategoriesComplete(data, status, headers, config) {
                return data;
            }
        }

    }
})();