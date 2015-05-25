React  = require "react"
Router = require "react-router"
{Route, DefaulRoute, Link} = Router

class Menu extends React.Component
  render: ->
    <ul className="Menu">
      <li className="Menu-item">
        <Link to="viewer"> Viewer </Link>
      </li>
      <li className="Menu-item"> Config </li>
    </ul>


module.exports = Menu
