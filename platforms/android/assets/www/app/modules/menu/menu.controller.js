(function () {
    'use strict';

    angular
            .module('app.menus')
            .controller('MenusController', MenusController);

    MenusController.$inject = ['entrymodalservice', 'logger', '$scope'];

    function MenusController(entrymodalservice, logger,$scope) {
        
        var vm = this;
        vm.showEntryModal = showEntryModal;
        
        $scope.$on(entrymodalservice.onClose, closeModal);
        
        entrymodalservice.init().then(setModal);

        function showEntryModal() {
            vm.modal.show();
        }
        
        function setModal(modal) {
            vm.modal = modal;
        }
        
        function closeModal() {
            vm.modal.hide();
        }
    }
})();