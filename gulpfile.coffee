# Dependencies.
gulp       = require "gulp"
gutil      = require "gulp-util"
plumber    = require "gulp-plumber"
connect    = require "gulp-connect"
flatten    = require "gulp-flatten"
concat     = require "gulp-concat"
uglify     = require "gulp-uglify"
sourcemaps = require "gulp-sourcemaps"
stylus     = require "gulp-stylus"
nib        = require "nib"
fa         = require "stylus-font-awesome"
webpack    = require "gulp-webpack"
coffee     = require "gulp-cjsx"

# Paths.
paths =
  styles:
    src: "./stylesheets/main.styl"
    watch: "./stylesheets/**/*.styl"
    dest: "./assets/css/"
  layouts:
    src: "./layouts/*.html"
    dest: "./assets/html/"
  scripts:
    src: ["./scripts/**/*.coffee", "./scripts/**/*.cjsx"]
    dest: "./assets/js/"



# Livereload server.
gulp.task "dev-server", ->
  connect.server
    port: process.env.PORT || 4200
    livereload: true


# Layouts. Maybe this isn't really useful but it can be
# modified to use a html engine like jade.
gulp.task "dev-layouts", ->
  gulp.src paths.layouts.src
    .pipe flatten()
    .pipe gulp.dest(paths.layouts.dest)
    .pipe connect.reload()

gulp.task "layouts", ->
  gulp.src paths.layouts.src
    .pipe flatten()
    .pipe gulp.dest(paths.layouts.dest)


# Style compilation.
gulp.task "dev-styles", ->
  gulp.src paths.styles.src
    .pipe plumber
      errorHandler: onError
    .pipe sourcemaps.init()
    .pipe stylus
      use: [nib(), fa()]
      compress: yes
    .pipe concat("styles.css")
    .pipe sourcemaps.write("./maps")
    .pipe gulp.dest(paths.styles.dest)
    .pipe connect.reload()

gulp.task "styles", ->
  gulp.src paths.styles.src
    .pipe plumber
      errorHandler: onError
    .pipe stylus
      use: [nib(), fa()]
      compress: yes

    .pipe concat("styles.css")
    .pipe gulp.dest(paths.styles.dest)


# scripts compilation.
gulp.task "dev-scripts", ->
  gulp.src paths.scripts.src
    .pipe plumber
      errorHandler: onError
    .pipe sourcemaps.init()
    .pipe coffee()
    .pipe webpack require "./webpack.config"
    .pipe uglify()
    .pipe sourcemaps.write()
    .pipe gulp.dest(paths.scripts.dest)
    .pipe connect.reload()



gulp.task "scripts", ->
  gulp.src paths.scripts.src
    .pipe plumber
      errorHandler: onError
    .pipe coffee()
    .pipe webpack require "./webpack.config"
    .pipe uglify()
    .pipe gulp.dest(paths.scripts.dest)

onError = (error) ->
  gutil.log gutil.colors.red(error)
  @emit "end"

# Development tasks
gulp.task "dev", [
  "dev-layouts"
  "dev-styles"
  "dev-scripts"
  "dev-server"
], ->
  gulp.watch paths.layouts.src, ["dev-layouts"]
  gulp.watch paths.styles.watch,  ["dev-styles"]
  gulp.watch paths.scripts.src, ["dev-scripts"]


# Production task
gulp.task "build", [
  "layouts"
  "styles"
  "scripts"
]
