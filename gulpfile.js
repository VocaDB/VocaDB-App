'use strict';

var gulp = require('gulp');
var plugins = require('gulp-load-plugins')();
var beep = require('beepbeep');
var express = require('express');
var connectLr = require('connect-livereload');
var runSequence = require('run-sequence');

var targetDir = 'www'
var port = 9000

// global error handler
var errorHandler = function(error) {
    beep(2, 170);
    plugins.util.log(error);
};

// start local express server
gulp.task('serve', function() {
  express()
    .use(connectLr())
    .use(express.static(targetDir))
    .listen(port);
  open('http://localhost:' + port + '/');
});

// start watchers
gulp.task('watchers', function() {
  plugins.livereload.listen();
  gulp.watch(targetDir + '/**')
    .on('change', plugins.livereload.changed)
    .on('error', errorHandler);
});

// our main sequence, with some conditional jobs depending on params
gulp.task('default', function(done) {
  runSequence(
  'watchers',
  'serve',
  done);
});
