(function() {
    'use strict';

    angular.module('app.core', [
        'ngResource', 'ui.router',
        
        'blocks.exception','blocks.router','blocks.logger',
        
        'ionic'
    ]);
})();