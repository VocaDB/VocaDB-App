(function() {
    'use strict';

    angular
        .module('app.widgets')
        .directive('vcLyrics', vcLyrics);

    /* @ngInject */
    function vcLyrics () {
        var directive = {
            scope: {
                'lyrics' : '=',
            },
            templateUrl: 'app/components/widgets/vcLyrics.html',
            controller: LyricsController,
            controllerAs: 'vm',
            bindToController: true ,
            restrict: 'E'
        };
        
        return directive;
    }
    
    LyricsController.$inject = ['logger','$ionicScrollDelegate'];
    
    function LyricsController (logger,$ionicScrollDelegate) {
        // Injecting $scope just for comparison
        var vm = this;
        vm.lyric = "";
        vm.selected = "";
        vm.lang = {
            japanese : 'Japanese',
            romaji : 'Romaji',
            english : 'English'
        };
        vm.chooseLang = chooseLang;
        vm.hasLang = hasLang;
        vm.isSelect = isSelect;
        
        
        function chooseLang(lang) {
            
            if(vm.isSelect(lang)) {
                vm.selected = "";
                vm.lyric="";
                $ionicScrollDelegate.resize();
                return;
            }
            
            vm.selected = lang;
            var index = -1;
            
            if(!vm.lyrics) {
                return;
            }
            
            for(var i=0;i<vm.lyrics.length;i++) {
                if(vm.lyrics[i].language==lang) {
                    vm.lyric = vm.lyrics[i].value.replace(/\n/g, '<br/>').replace(/\r/g, '<br/>').replace(/\r\n/g, '<br/>');
                    $ionicScrollDelegate.resize();
                    break;
                }
            }
        }
        
        function hasLang(lang) {
            var found = false;
            angular.forEach(vm.lyrics, function(item, key) {
                   if(item.language==lang)
                       found = true;
            });
            return found;
        }
        
        function isSelect(lang) {
            return vm.selected==lang;
        }
    }
})();