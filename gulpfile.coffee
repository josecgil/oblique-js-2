gulp = require "gulp"
coffee = require 'gulp-coffee'
coffeelint = require 'gulp-coffeelint'
concat = require 'gulp-concat'
util   = require 'gulp-util'
uglify = require 'gulp-uglify'
util = require 'gulp-util'
clean= require 'gulp-clean'
rename = require 'gulp-rename'
insert= require 'gulp-insert'

gulp.task 'clean', ->
  gulp.src(['./dist/'], {read: false})
  .pipe(clean())

gulp.task 'concat-coffee', ['clean'], ->
  gulp.src('./src/**/*.coffee')
  .pipe(insert.transform((contents, file) ->
      comment = '\n# ' + file.relative + '\n\n'
      comment + contents
    ))
  .pipe(concat('oblique2_src.coffee'))
  .pipe(gulp.dest('./dist/'))

gulp.task 'coffee-lint', ['concat-coffee'], ->
  gulp.src('./dist/*.coffee')
  .pipe(coffeelint())
  .pipe(coffeelint.reporter())

gulp.task 'coffee-to-js', ['coffee-lint'], ->
  gulp.src('./dist/*.coffee')
  .pipe(coffee().on('error', util.log))
  .pipe(gulp.dest('./dist/'))

gulp.task 'add-lib-to-js', ['coffee-to-js'], ->
  gulp.src(['./lib/**/*.js','./dist/*.js'])
  .pipe(insert.transform((contents, file) ->
      comment = '\n// ' + file.relative + '\n\n'
      comment + contents
    ))
  .pipe(concat('oblique2.js'))
  .pipe(gulp.dest('./dist/'))

gulp.task 'uglify', [ 'add-lib-to-js' ], ->
  gulp.src('./dist/oblique2.js')
  .pipe(rename('oblique2.min.js'))
  .pipe(uglify())
  .pipe(gulp.dest('./dist/'))

gulp.task 'default', [ 'uglify' ], ->

