React  = require "react"
{Link} = require "react-router"
viewer = require "./viewerInit"


class Viewer extends React.Component
  constructor: (props) ->
    @state =
      to: props.to
      params: props.params
      query: props.query
    console.log @state

  componentDidMount: -> viewer()

  handleTouch: (e) =>
    e.preventDefaul()
    @context.router.transitionTo(@state.to, @state.params, @state.query)


  render: =>
    <div>
      <div id="canvas"></div>
      <div id="text" className="descrition-text">Cargando...</div>
      <div className="return-button">
        <Link to="menu" onTouchStart={@handleTouch.bind(this)}>
          <span className="icon-arrow"></span>
        </Link>
      </div>
    </div>

module.exports = Viewer
