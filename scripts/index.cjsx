React  = require "react"
Router = require "react-router"
routes = require "./routes"


Router.run routes, (Handler) ->
  React.initializeTouchEvents yes
  React.render(<Handler/>, document.getElementById "app")
