THREE        = require "three"
_            = require "lodash"
Scene        = require "./Scene"
EventHandler = require "./EventHandler"
actors       = require "./actors"
Config       = require "./config"

# Scene global instance.
scene = {}


# Render the scene.
render = ->
  scene.render()


# Keep the rendering loop active.
animate = ->
  requestAnimationFrame animate
  render()


# Initialize the app.
init = ->
  config = Config()
  # Initalize components
  scene        = new Scene(config.scene)
  eventHandler = new EventHandler(scene, render, config.eventHandler)
  light        = new THREE.HemisphereLight(0x888888)

  # Setup scene
  scene.setControls render
  scene.appendTo config.scene.canvas

  # Add each actor.
  for eachActor in actors
    eachActor.setModel (actor) =>
      scene.add actor

  # Add lights
  scene.add light

  # Change the text.
  config.eventHandler.elements.text.innerText = "Toca la parte a conocer"

  # Start the rendering loop.
  animate()


# Start app.
module.exports = init
