angular.module('vocadb.directives', [])
        .directive('connectionFail', function() {
            return {
                restrict: 'E',
                templateUrl: 'templates/connectionFail.html'
            };
        });


