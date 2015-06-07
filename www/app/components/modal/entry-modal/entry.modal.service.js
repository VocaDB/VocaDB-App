(function () {
    'use strict';

    angular
            .module('app.component.modal')
            .factory('entrymodalservice', entrymodalservice);

    entrymodalservice.$inject = ['$ionicModal', 'logger'];

    function entrymodalservice($ionicModal, logger)
    {
        var pageUri = 'app/components/modal/entry-modal/entry.modal.page.html';
        var options = {
            animation: 'slide-in-up'
        };

        var service = {
            init: init,
            onClose : 'entry-modal-closed'
        };

        return service;

        function init() {
            return $ionicModal.fromTemplateUrl(pageUri,options);
        }
    }
})();