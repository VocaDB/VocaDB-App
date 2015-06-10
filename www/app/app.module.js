(function() {
    'use strict';

    angular.module('app', [
        /*
         * Common areas
         */ 
        'app.core',
        'app.service',
        'app.component.modal',
        'app.widgets',
        
        /*
         * Module area
         */
        'app.menus',
        'app.allsong', 'app.songinfo', 
        'app.allartist', 'app.artistinfo'
    ]);
})();