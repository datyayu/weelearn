THREE  = require "three"
Scene  = require "./Scene"
actors = require "./actors"

# Scene properties configuration.
sceneConfig =
  width: window.innerWidth
  height: window.innerHeight

# Projection elements.
selectedElement = null
scene = {}
mouseVector = {}
raycaster = {}


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
  mouseVector = new THREE.Vector2()
  light       = new THREE.HemisphereLight(0x888888)

  # Setup scene
  scene.setControls {renderCallback: render}
  scene.appendTo "canvas"

  # Add actors to scene
  for actor in actors
    scene.add actor.getElement()
    children = actor.getElementChildren()

    # Add childs inside every actor
    for child in children
      scene.add child

  # Add lights
  scene.add light

  animate()


# Mouse down handler.
onMouseDown = (event) ->
  event.preventDefault()

  # Mouse position.
  mouseVector.x = ( event.clientX / config.width ) * 2 - 1
  mouseVector.y = - ( event.clientY / config.height ) * 2 + 1

  # Check for intersections on raycastering.
  raycaster.setFromCamera mouseVector, scene.getCamera()
  intersects = raycaster.intersectObjects scene.getChildren()
  selectedElement = intersects[0]

  # Show intersected element (if it exists).
  if selectedElement?
    selectedElement.originalHEX = selectedElement.object.material.color.getHex()
    selectedElement.object.material.color.set 0x00FF00
    selectedElement.object.originClassInstance.printMessage()


# Mouse up handler.
onMouseUp = (event) ->
  event.preventDefault()

  # Return all to normal.
  if selectedElement?
    selectedElement.object.material.color.setHex selectedElement.originalHEX
    selectedElement = null



# Event listeners.
window.addEventListener "mousedown", onMouseDown, false
window.addEventListener "mouseup", onMouseUp, false


# Start app.
init()
render()
