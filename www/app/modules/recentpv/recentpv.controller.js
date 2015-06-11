(function() {
    'use strict';

    angular
        .module('app.recentpv')
        .controller('RecentPVController', RecentPVController);

    RecentPVController.$inject = ['songservice','logger'];

    function RecentPVController(songservice,logger) {
       
        /*jshint validthis: true */
        var vm = this;
        
    }
})();