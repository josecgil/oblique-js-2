gulp = require "gulp"
coffee = require 'gulp-coffee'
concat = require 'gulp-concat'
util   = require 'gulp-util'
uglify = require 'gulp-uglify'
util = require 'gulp-util'
clean= require 'gulp-clean'
rename = require 'gulp-rename'

gulp.task 'clean', ->
  gulp.src(['./dist/'], {read: false})
  .pipe(clean())


gulp.task 'concat-coffee', ['clean'], ->
  gulp.src('./src/**/*.coffee')
  .pipe(concat('oblique2.coffee'))
  .pipe(gulp.dest('./dist/'))

gulp.task 'coffee-to-js', ['concat-coffee'], ->
  gulp.src('./dist/*.coffee')
  .pipe(coffee().on('error', util.log))
  .pipe(gulp.dest('./dist/'))

gulp.task 'uglify', [ 'coffee-to-js' ], ->
  gulp.src('./dist/*.js')
  .pipe(rename('oblique2.min.js'))
  .pipe(uglify())
  .pipe(gulp.dest('./dist/'))

gulp.task 'default', [ 'uglify' ], ->
