React         = require "react"
ViewerActions = require "../Viewer.actions"
ViewerStore   = require "../Viewer.store"

getCurrentDelay = -> ViewerStore.getCurrentDelay()

class DelaySlider extends React.Component
  constructor: (props) ->
    super(props)
    @state = { currentDelay: getCurrentDelay() }

  componentDidMount: ->
    ViewerStore.addChangeListener @onChange.bind(this)

  componentWillUnmount: ->
    ViewerStore.removeChangeListener @onChange.bind(this)

  onChange: ->
    console.log @state.currentDelay
    @setState {currentDelay: getCurrentDelay()}
    console.log @state.currentDelay

  setOnTouchDelay: (e) ->
    delay = e.target.value
    ViewerActions.setOnTouchDelay delay

  render: ->
    delay = Math.round(@state.currentDelay / 100) / 10

    <div className="DelaySlider">
      <p className="DelaySlider-text text">
        <span>On-Touch Delay</span>
        <span>{delay.toFixed(1)} seg</span>
      </p>
      <input className="DelaySlider-input"
             type="range"
             min=0
             max=5000
             value={@state.currentDelay}
             onChange={@setOnTouchDelay} />
    </div>
module.exports = DelaySlider
