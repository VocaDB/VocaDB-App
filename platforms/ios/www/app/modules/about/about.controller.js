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
            if(ionic.Platform.isAndroid()) {
                navigator.app.loadUrl(url, {openExternal: true});
            }
            else
            {
                window.open(url, '_system');
            }
        };
    }
})();