React                 = require "react"
{Route, DefaultRoute} = require "react-router"

# Route components
Viewer     = require "./viewer"
MainMenu   = require "./MainMenu"
ConfigMenu = require "./ConfigMenu"
App        = require "./App"

routes = (
  <Route path="/" name="app" handler={App}>
    <DefaultRoute name="menu" handler={MainMenu} />
    <Route        name="viewer" handler={Viewer} />
    <Route        name="config" handler={ConfigMenu} />
  </Route>
)


module.exports = routes
