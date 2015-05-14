THREE     = require "three"
_         = require "lodash"
Scene     = require "./Scene"
AddActors = require "./actors"


###########################
##        CONFIGS        ##
###########################
# App config.
config =
  bodyColor:    0xFFE0BD
  onTouchColor: 0x00FF00
  onTouchDelay: 500

# DOM elements.
audioElement = document.getElementById "audio"
textElement  = document.getElementById "text"
textElement.size = textElement.style.height = 50

# Scene properties configuration.
sceneConfig =
  bgColor: 0x000000
  height:  window.innerHeight - textElement.size
  width:   window.innerWidth

# Projection elements.
intersectedElement = null
scene       = {}
mouseVector = {}
raycaster   = {}


###########################
##       MAIN APP        ##
###########################

# Render the scene.
render = ->
  scene.render()


# Keep the rendering loop active.
animate = ->
  requestAnimationFrame animate
  render()


# Initialize the app.
init = ->
  # Initalize components
  scene       = new Scene(sceneConfig)
  raycaster   = new THREE.Raycaster()
  mouseVector = new THREE.Vector3()
  light       = new THREE.HemisphereLight(0x888888)

  # Setup scene
  scene.setControls render
  scene.appendTo "canvas"

  # Add each actor.
  AddActors (actor) =>
    scene.add actor

  # Add lights
  scene.add light

  # Change the text.
  textElement.innerText = "Toca la parte a conocer"

  # Start the rendering loop.
  animate()



###########################
##    EVENT HANDLERS     ##
###########################

# Check if there was any intersection.
detectIntersects = ->
  # Check for intersections on raycastering.
  raycaster.setFromCamera mouseVector, scene.getCamera()
  intersects         = raycaster.intersectObjects scene.getChildren()
  intersectedElement = intersects[0] # We only want the first intersection.

  # Show intersected element (if it exists).
  if intersectedElement?
    # Change color to show touched element.
    intersectedElement.object.originClassInstance.setColor config.onTouchColor
    # Show element name on textElement.
    textElement.innerText = intersectedElement.object.originClassInstance.getMessage()
    # Play soundfile with the element name on audioElement.
    intersectedElement.object.originClassInstance.playSound audioElement


# Mouse down handler.
onMouseDown = (event) ->
  event.preventDefault()

  # Update touch/mouse position.
  mouseVector.x = ( event.clientX / sceneConfig.width ) * 2 - 1
  mouseVector.y = - ( event.clientY / sceneConfig.height ) * 2 + 1

  # Check for intersects
  detectIntersects()


# Touch start handler.
onTouchStart = (event) ->
  event.preventDefault()

  # Update touch/mouse position.
  mouseVector.x = ( event.touches[0].pageX/ sceneConfig.width ) * 2 - 1
  mouseVector.y = - ( event.touches[0].pageY / sceneConfig.height ) * 2 + 1

  # Check for intersects.
  detectIntersects()


# Mouse up handler.
onPressEnd = (event) ->
  event.preventDefault()

  # Return all to normal.
  if intersectedElement?
    # Create a copy of the element for async handling and
    # remove original to allow other parts to be touched.
    elementReference   = _.clone intersectedElement
    intersectedElement = null

    # Show the touched part for a certain period of time.
    setTimeout ->
      elementReference.object.originClassInstance.setColor(config.bodyColor)
    , config.onTouchDelay


# Window resize handler.
onWindowResize = (event) ->
  # Get new size for the window
  sceneConfig.height = window.innerHeight - textElement.size
  sceneConfig.width  = window.innerWidth

  # Re-render using the new window size.
  scene.resize sceneConfig.width, sceneConfig.height
  render()




# Start app.
window.onload = ->
  # Add event listeners.
  window.addEventListener "touchstart", onTouchStart  , false
  window.addEventListener "mousedown" , onMouseDown   , false
  window.addEventListener "touchend"  , onPressEnd    , false
  window.addEventListener "mouseup"   , onPressEnd    , false
  window.addEventListener "resize"    , onWindowResize, false

  # Start app.
  init()
