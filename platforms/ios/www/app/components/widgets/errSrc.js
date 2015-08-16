(function() {
    'use strict';

    angular
        .module('app.widgets')
        .directive('errSrc', errSrc);

    /* @ngInject */
    function errSrc () {
        var directive = {
            link: link
        };
        return directive;
    }
    function link(scope, element, attrs) {
        element.bind('error', function() {
            if (attrs.src != attrs.errSrc) {
              attrs.$set('src', attrs.errSrc);
            }
        });
        attrs.$observe('ngSrc', function(value) {
            if (!value && attrs.errSrc) {
              attrs.$set('src', attrs.errSrc);
            }
        });
    }
    
})();