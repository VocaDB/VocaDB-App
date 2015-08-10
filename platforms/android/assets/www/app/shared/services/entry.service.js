/**
 * EntryService Factory
 * @namespace Factories
 */

(function () {
    'use strict';
    angular
            .module('app.service')
            .factory('entryservice', entryservice);

    entryservice.$inject = ['dataservice','exception'];

    /**
     * @namespace EntryService
     * @desc Service for request all entry
     * @memberOf Factories
     */
    /* @ngInject */
    function entryservice(dataservice,exception)
    {
        var service = {
            ready : dataservice.ready,
            queryEntry : queryEntry
        };

        return service;

        ///////////////////////////////////////
        
      /**
       * @name queryEntry
       * @desc Find entry. 
       * Reference : http://vocadb.net/apiHelp/Api/GET-api-entries_query_tag_status_start_maxResults_getTotalCount_sort_nameMatchMode_fields_lang
       * @param {String} query Query string
       * @returns {promises}
       * @memberOf Factories.EntryService
       */
        function queryEntry(query) {
            var parms = {
                query: query,
                fields:'MainPicture',
                getTotalCount: false,
                nameMatchMode: 'Auto'
            };

            return dataservice.callApi('/api/entries',parms)
                    .then(queryEntryComplete)
                    .catch(function(message) {
                        exception.catcher('Call API Failed for queryEntry')(message);
                        //$location.url('/');
                    });
            
            function queryEntryComplete(data, status, headers, config) {
                return data;
            }
            
        }

    }
})();