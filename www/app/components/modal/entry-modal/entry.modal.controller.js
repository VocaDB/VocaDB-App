(function() {
    'use strict';

    angular
        .module('app.component.modal')
        .controller('EntryModalController', EntryModalController);

    EntryModalController.$inject = ['logger','entrymodalservice','entryservice','$rootScope'];

    function EntryModalController(logger,entrymodalservice,entryservice,$rootScope) {
         
        /*jshint validthis: true */
        var vm = this;
        
        vm.items = [];
        vm.loading = false;
        vm.query = '';
        vm.closeEntryModal = closeEntryModal;
        vm.getEntryUrl = getEntryUrl;
        vm.search = search;
        vm.queryEntry = queryEntry;
        
        function search() {
            queryEntry(vm.query);
        }
        
        function closeEntryModal() {
           $rootScope.$broadcast(entrymodalservice.onClose);
        }
        
        function init() {
            var promises = [queryEntry()];
            return entryservice.ready(promises).then(function(){
                logger.info('Entries loaded');
            });
        }
        
        function queryEntry(query)
        {
            return entryservice.queryEntry(query).then(function(data) {
                vm.items = data.items;
                return vm.items;
            });
        }
        
        function getEntryUrl(id, entryType)
        {
            if (angular.equals(entryType, 'Song'))
                return '#/menu/songs/' + id;
            if (angular.equals(entryType, 'Artist'))
                return '#/menu/artist/' + id;
            if (angular.equals(entryType, 'Album'))
                return '#/menu/album/' + id;
        }
    }
})();