/* global toastr:false, moment:false */
(function() {
    'use strict';

    angular
        .module('app.core')
        .constant('apiurl',apiurl);

        function apiurl(endPoint) {
            return 'http://vocadb.net'+endPoint;
        }
        
})();