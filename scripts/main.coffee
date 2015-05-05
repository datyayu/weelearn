THREE  = require "three"
Scene  = require "./Scene"
actors = require "./actors"

# Audio element
audioElement = document.getElementById "audio"
# Text element
textElement = document.getElementById "text"
textElement.size = textElement.style.height = 50

# Scene properties configuration.
scene = {}
sceneConfig =
  bgColor: 0x060C0D
  # That last -4 removes the scroll bars on chrome, don't know why tho.
  height: window.innerHeight - textElement.size - 4
  width: window.innerWidth

# Projection elements.
selectedElement = null
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
  mouseVector = new THREE.Vector3()
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

  textElement.innerText = "Toca la parte a conocer"

  # Start the rendering loop.
  animate()


# Mouse down handler.
onMouseDown = (event) ->
  event.preventDefault()

  # Mouse position.
  mouseVector.x = ( event.clientX / sceneConfig.width ) * 2 - 1
  mouseVector.y = - ( event.clientY / sceneConfig.height ) * 2 + 1

  # Check for intersections on raycastering.
  raycaster.setFromCamera mouseVector, scene.getCamera()
  intersects = raycaster.intersectObjects scene.getChildren()
  selectedElement = intersects[0]

  # Show intersected element (if it exists).
  if selectedElement?
    selectedElement.originalHEX = selectedElement.object.material.color.getHex()
    selectedElement.object.material.color.set 0x00FF00
    textElement.innerText = selectedElement.object.originClassInstance.getMessage()
    selectedElement.object.originClassInstance.playSound audioElement


# Mouse up handler.
onMouseUp = (event) ->
  event.preventDefault()

  # Return all to normal.
  if selectedElement?
    selectedElement.object.material.color.setHex selectedElement.originalHEX
    selectedElement = null


# Window resize handler.
onWindowResize = (event) ->
  sceneConfig.height = window.innerHeight - textElement.size - 4
  sceneConfig.width  = window.innerWidth

  scene.resize sceneConfig.width, sceneConfig.height
  render()


# Event listeners.
window.addEventListener "mousedown", onMouseDown, false
window.addEventListener "mouseup", onMouseUp, false
window.addEventListener "resize", onWindowResize, false


# Start app.
window.onload = ->
  init()
