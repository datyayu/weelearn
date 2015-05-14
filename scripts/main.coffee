THREE  = require "three"
_      = require "lodash"
Scene  = require "./Scene"
Actors = require "./actors"


###########################
##        CONFIGS        ##
###########################

# Audio element
audioElement = document.getElementById "audio"
# Text element
textElement = document.getElementById "text"
textElement.size = textElement.style.height = 50

# Scene properties configuration.
scene = {}
sceneConfig =
  bgColor: 0xFFFFFF
  height: window.innerHeight - textElement.size
  width: window.innerWidth

# Projection elements.
selectedElement = null
mouseVector = {}
raycaster = {}


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
  scene.setControls {renderCallback: render}
  scene.appendTo "canvas"

  # Add actors to scene
  # for actor in actors
  #   scene.add actor.getElement()
  #   children = actor.getElementChildren()
  #
  #   # Add childs inside every actor
  #   for child in children
  #     scene.add child
  Actors (actor) =>
    scene.add actor

  # Add lights
  scene.add light

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
  intersects = raycaster.intersectObjects scene.getChildren()
  selectedElement = intersects[0]

  # Show intersected element (if it exists).
  if selectedElement?
    selectedElement.object.originClassInstance.setHexColor 0x00FF00
    textElement.innerText = selectedElement.object.originClassInstance.getMessage()
    selectedElement.object.originClassInstance.playSound audioElement


# Mouse down handler.
onMouseDown = (event) ->
  event.preventDefault()

  # Mouse position.
  mouseVector.x = ( event.clientX / sceneConfig.width ) * 2 - 1
  mouseVector.y = - ( event.clientY / sceneConfig.height ) * 2 + 1

  detectIntersects()


# Touch start handler.
onTouchStart = (event) ->
  event.preventDefault()

  # Mouse position.
  mouseVector.x = ( event.touches[0].pageX/ sceneConfig.width ) * 2 - 1
  mouseVector.y = - ( event.touches[0].pageY / sceneConfig.height ) * 2 + 1

  detectIntersects()


# Mouse up handler.
onPressEnd = (event) ->
  event.preventDefault()

  # Return all to normal.
  if selectedElement?
    element = _.clone selectedElement
    selectedElement = null
    setTimeout ->
      element.object.originClassInstance.setHexColor()
    , 500


# Window resize handler.
onWindowResize = (event) ->
  sceneConfig.height = window.innerHeight - textElement.size
  sceneConfig.width  = window.innerWidth

  scene.resize sceneConfig.width, sceneConfig.height
  render()




# Start app.
window.onload = ->
  # Event listeners.
  window.addEventListener "touchstart", onTouchStart, false
  window.addEventListener "touchend", onPressEnd, false
  window.addEventListener "mousedown", onMouseDown, false
  window.addEventListener "mouseup", onPressEnd, false
  window.addEventListener "resize", onWindowResize, false
  init()
