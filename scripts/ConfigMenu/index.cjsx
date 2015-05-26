React         = require "react"
{Link}        = require "react-router"
ColorPicker   = require "./ColorPicker"
DelaySlider   = require "./DelaySlider"


class ConfigScreen extends React.Component
  render: ->
    <div className="ConfigMenu">
      <h1 className="ConfigMenu-title text"> Opciones </h1>
      <ul className="ConfigMenu-list">
        <li className="ConfigMenu-item">
          <DelaySlider />
        </li>
        <li className="ConfigMenu-item">
          <ColorPicker />
        </li>
        <li className="ConfigMenu-item">
         <Link to="menu" className="text"> Regresar </Link>
        </li>
      </ul>
    </div>


module.exports = ConfigScreen
