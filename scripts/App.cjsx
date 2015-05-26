React          = require "react"
{RouteHandler} = require "react-router"

class App extends React.Component
  render: ->
    <RouteHandler className="container"/>

module.exports = App
