THREE        = require "three"
_            = require "lodash"
Scene        = require "./Scene"
EventHandler = require "./EventHandler"
actors       = require "./actors"

# Scene global instance.
scene          = null
eventHandler   = null
animationFrame = null

# Render the scene.
render = =>
  scene.render()


# Keep the rendering loop active.
animate = =>
  animationFrame = requestAnimationFrame animate
  render()


# Initialize the app.
init = (config) =>
  # DOM elements
  config.scene.canvas = document.getElementById "canvas"
  config.eventHandler.elements =
    audio: document.getElementById "audio"
    text:  document.getElementById "text"
  config.eventHandler.elements.text.size = 50

  # Quick fixes
  config.scene.height = window.innerHeight - 50
  config.scene.width  = window.innerWidth - 1

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


destroy = =>
  cancelAnimationFrame(animationFrame)
  scene.destroyContent()
  eventHandler.removeListeners()
  scene = null
  eventHandler = null

window.destroyContent = destroy

# Start app.
module.exports =
  init: init
  destroy: destroy
