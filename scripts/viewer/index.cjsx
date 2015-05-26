React          = require "react"
{Link, Router} = require "react-router"
Canvas         = require "./Viewer"
ViewerStore    = require "../Viewer.store"
ViewerActions  = require "../Viewer.actions"


class Viewer extends React.Component
  constructor: ->
    @state =
      config: ViewerStore.getConfig()

  componentDidMount: ->
    ViewerStore.addChangeListener @onChange.bind(this)
    Canvas.init(@state.config)

  componentWillUnmount: ->
    ViewerStore.removeChangeListener @onChange.bind(this)
    Canvas.destroy()

  onChange: ->
    @setState {config: ViewerStore.getConfig()}

  handleClick: (e) ->
    window.location.href =  window.location.href.replace /viewer/, ""

  render: ->
    <div>
      <div id="canvas"></div>
      <div id="text" className="descrition-text text">Cargando...</div>
      <div className="return-button">
        <a onTouchStart={@handleClick} onClick={@handleClick}>
          <span className="icon-arrow text"></span>
        </a>
      </div>
    </div>


module.exports = Viewer
