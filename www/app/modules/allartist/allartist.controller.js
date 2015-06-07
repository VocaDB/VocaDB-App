(function() {
    'use strict';

    angular
        .module('app.allartist')
        .controller('AllArtistController', AllArtistController);

    AllArtistController.$inject = ['artistservice','logger'];

    function AllArtistController(artistservice,logger) {
       
        /*jshint validthis: true */
        var vm = this;
        
        vm.artists = [];
        vm.title = 'Artists';

        init(); 
 
        function init() {
            var promises = [getAllArtist()];
            return artistservice.ready(promises).then(function(){
                logger.info('Artists loaded');
            });
        }

        function getAllArtist() {
            return artistservice.queryArtist("").then(function(data) {
                vm.artists = data.items;
                return vm.artists;
            });
        }
    }
})();