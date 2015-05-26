React         = require "react"
jss           = require "../../libs/jss"
ViewerActions = require "../Viewer.actions"
ViewerStore   = require "../Viewer.store"

getCurrentBgColor = -> ViewerStore.getCurrentBgColor()
getBgColors       = -> ViewerStore.getBgColors()

class ColorPicker extends React.Component
  constructor: (props) ->
    super(props)
    @state =
      currentColor: getCurrentBgColor()
      colors: getBgColors()

  componentDidMount: ->
    ViewerStore.addChangeListener @onChange.bind(this)

  componentWillUnmount: ->
    ViewerStore.removeChangeListener @onChange.bind(this)

  onChange: ->
    @setState
      currentColor: getCurrentBgColor()
      colors: getBgColors()


  onClick: (color) ->
    ViewerActions.setBgColor color.hex
    # Set Background
    document.body.style.background = color.name
    # Set Text Color
    jss.set ".text", { color: color.textColor }

  render: ->
    colorNodes = @state.colors.map (color, id) =>
      if @state.currentColor is color.hex
        colorClass = "ColorPicker-color selected"
      else
        colorClass = "ColorPicker-color"

      <div key={id}
           className={colorClass}
           style={{background: color.name}}
           onClick={@onClick.bind(this, color)}
           onTouchStart={@onClick.bind(this, color)}>
      </div>

    <div>
      <p className="text"> Color de fondo </p>
      <div className="ColorPicker-container">
        {colorNodes}
      </div>
    </div>

module.exports = ColorPicker
