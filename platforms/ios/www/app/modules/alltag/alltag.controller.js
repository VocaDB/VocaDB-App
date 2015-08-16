(function() {
    'use strict';

    angular
        .module('app.alltag')
        .controller('AllTagController', AllTagController);

    AllTagController.$inject = ['logger','tagservice','$ionicScrollDelegate'];

    function AllTagController(logger,tagservice,$ionicScrollDelegate) {
       
        /*jshint validthis: true */
        var vm = this;
        vm.tags = [];
        vm.query = "";
        vm.selected = null;
        vm.loading = false;
        vm.search = search;
        vm.isShow = isShow;
        vm.select = select;
        
        vm.queryTag = queryTag;
        vm.listCategories = listCategories;
        vm.searchByCategory = searchByCategory;
        
        init(); 
 
        function init() {
            var promises = [listCategories()];
            return tagservice.ready(promises).then(function(){
                logger.info('Tags loaded');
            });
        }
        
        
        function queryTag(query) {
            vm.loading = true;
            logger.info(vm.query);
            return tagservice.queryTag(query).then(function(data) {
                        vm.loading = false;
                        vm.tags = data.items;
                logger.info('Query Tags loaded');
            });
        }
        
        function listCategories() {
            vm.loading = true;
            return tagservice.listCategories().then(function(data) {
                vm.loading = false;
                vm.categories = data;
                return vm.categories;
            });
        }
        
        function searchByCategory(query,selected) {
            vm.loading = true;
        
            return tagservice.getTagsByCategory(vm.query, vm.selected).then(function(data) {
                    vm.loading = false;
                    vm.tags = data.items;
                    return vm.tags ;
            });           
        }
        
        
        function search() {
            if (vm.selected) {
                vm.searchByCategory(vm.query, vm.selected);
            } else {
                if (!vm.query)
                    vm.tags = [];
                else
                {
                    vm.queryTag(vm.query);
                }
            }
        };
        
        function isShow() {
            return !(vm.tags.length && vm.query);
        }
        
        function select(category) {
            if (vm.selected != category) {
                vm.selected = category;
                
                vm.searchByCategory(vm.query, category);
            } else {
                vm.selected = null;
                vm.search();
            }
            $ionicScrollDelegate.resize();
        };
        
    }
})();