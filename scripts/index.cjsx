React  = require "react"
Router = require "react-router"
Viewer = require "./viewer"
Menu   = require "./Menu"
{Route, RouteHandler, DefaultRoute} = Router

React.initializeTouchEvents yes

class App extends React.Component
  render: ->
    <div className="container">
      <RouteHandler/>
    </div>

routes = (
  <Route name="app" path="/" handler={App}>
    <DefaultRoute name="menu" handler={Menu} />
    <Route name="viewer" handler={Viewer} />
  </Route>
)


Router.run routes, (Handler) ->
  React.render(<Handler/>, document.getElementById "app")
