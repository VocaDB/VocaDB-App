VocaDB Mobile App
============

# This version had deprecated. New version as revamp is under PoC (See also in poc/revamp branch)

A mobile version of http://vocadb.net for presents information about vocaloid song,artist or album.

Tools & Resource
============
- Cordova : http://cordova.apache.org
- VocaDB API : http://vocadb.net/api
- Ionic framework : http://ionicframework.com
- AngularJS : https://angularjs.org
- AngularMoment : https://github.com/urish/angular-moment
- Font Icon : http://fortawesome.github.io/Font-Awesome
- Node.js : https://nodejs.org/en

Setting development environment
============
### Prerequisites
* Download and install [Node.js](https://nodejs.org/en/download/). You should be able to run **npm** command.

### Clone project
```
$ git clone https://github.com/VocaDB/VocaDB-App.git
```

### Initialize
* At VocaDB-App directory. Open terminal and run
```
$ npm install
```

### Install cordova
```
$ npm install -g cordova
```

### Install Ionic
```
$ npm install -g ionic
```

Ionic had provide a useful command line utility (CLI). See also at http://ionicframework.com/docs/cli/

For example. Start a local development for testing on web browser.
```
$ ionic serve
```

### Adding a platform target
```
$ ionic platform ios android
```

### Building app
```
$ ionic build android
```

You need to install SDK for each platform to emulate them. See also at [Platform Guides](http://cordova.apache.org/docs/en/5.0.0/guide_platforms_index.md.html#Platform%20Guides)

Licence
============
The MIT License (MIT)

Copyright (c) 2014 Augsorn Chanklad

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
