React  = require "react"
{Link} = require "react-router"


class MainMenu extends React.Component
  render: ->
    <div className="MainMenu">
      <h1 className="MainMenu-title text"> weelearn </h1>
      <ul className="MainMenu-list">
        <li className="MainMenu-item">
          <Link to="viewer" className="text"> Viewer </Link>
        </li>
        <li className="MainMenu-item">
         <Link to="config" className="text"> Opciones </Link>
        </li>
      </ul>
    </div>

module.exports = MainMenu
