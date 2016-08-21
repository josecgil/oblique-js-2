gulp = require "gulp"
coffee = require 'gulp-coffee'
concat = require 'gulp-concat'
util   = require 'gulp-util'
uglify = require 'gulp-uglify'
util = require 'gulp-util'
clean= require 'gulp-clean'

gulp.task 'concat-coffee', ['clean'], ->
  gulp.src('./src/**/*.coffee')
  .pipe(concat('oblique2.coffee'))
  .pipe(gulp.dest('./dist/'))

gulp.task 'coffee-to-js', ['concat-coffee'], ->
  gulp.src('./dist/*.coffee')
  .pipe(coffee().on('error', util.log))
  .pipe(gulp.dest('./dist/'))

gulp.task 'clean', ->
  gulp.src(['./dist/'], {read: false})
  .pipe(clean())

gulp.task 'default', [ 'coffee-to-js' ], ->
