(function() {
    'use strict';

    angular
        .module('app.about')
        .controller('AboutController', AboutController);

    AboutController.$inject = ['logger'];

    function AboutController(logger) {
       
        /*jshint validthis: true */
        var vm = this;
        vm.contacts = [
            {
                name:'Website',
                description:'vocadb.net',
                icon:'icon ion-earth',               
                url:'http://vocadb.net'
            },
            {
                name:'Facebook',
                description:'VocaDB',
                icon:'icon ion-social-facebook',
                url:'https://www.facebook.com/vocadb'
            },
            {
                name:'Twitter',
                description:'@VocaDB',
                icon:'icon ion-social-twitter',
                url:'https://twitter.com/VocaDB'
            },
            {
                name:'Google+',
                description:'+VocaDbNet',
                icon:'icon ion-social-googleplus',
                url:'https://plus.google.com/+VocaDbNet'
            },
            {
                name:'IRC',
                description:'IRC channel on Rizon. If you have any IRC client installed. You can use the address irc://irc.rizon.net/vocadb',
                icon:'icon ion-android-chat',
                url:'http://vocadb.net/Home/Chat'
            },
            {
                name:'Github',
                description:'VocaDB-App',
                icon:'icon ion-social-github',
                url:'https://github.com/VocaDB/VocaDB-App'
            }
            ,

        ];
        
        vm.devContacts = [
            {
                name:'E-mail',
                description:'augsorn.chanklad@gmail.com',
                icon:'icon ion-android-mail',
                url:'mail://augsorn.chanklad@gmail.com'
            },
            {
                name:'Facebook',
                description:'facebook.com/augsorn',
                icon:'icon ion-social-facebook',               
                url:'https://facebook.com/augsorn'
            },
            {
                name:'Twitter',
                description:'@up2codio',
                icon:'icon ion-social-twitter',               
                url:'https://twitter.com/up2codio'
            },
            {
                name:'Line',
                description:'up2up',
                icon:'icon ion-android-chat',               
                url:'line://'
            }
        ]
        
        vm.open = function(url) {
            if(url) {
              window.open(url, '_system');
          }
//            navigator.app.loadUrl(url, {openExternal: true});
        };
    }
})();