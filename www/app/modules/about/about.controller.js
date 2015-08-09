(function() {
    'use strict';

    angular
        .module('app.about')
        .controller('AboutController', AboutController);

    AboutController.$inject = ['logger'];

    function AboutController(logger) {
       
        /*jshint validthis: true */
        var vm = this;
        
        vm.open = function(url) {
            //navigator.app.loadUrl(url, {openExternal: true}); //for android
            //window.open(url, '_system');
        };
    }
})();