THREE  = require "three"
Scene  = require "./scripts/Scene"
actors = require "./scripts/Actors"

config =
  width: window.innerWidth
  height: window.innerHeight

selectedElement = null
scene = {}
mouseVector = {}
raycaster = {}



render = ->
  scene.render()


animate = ->
  requestAnimationFrame animate
  render()


init = ->
  # Initalize components
  scene = new Scene(config)
  raycaster = new THREE.Raycaster()
  mouseVector = new THREE.Vector2()

  # Light
  light = new THREE.HemisphereLight(0x888888)

  # Setup scene
  scene.setControls {renderCallback: render}
  scene.appendTo "canvas"

  # Add actors to scene
  for actor in actors
    scene.add actor.getElement()
  scene.add light

  animate()


onMouseDown = (event) ->
  # event.preventDefault()
  mouseVector.x = ( event.clientX / config.width ) * 2 - 1
  mouseVector.y = - ( event.clientY / config.height ) * 2 + 1

  raycaster.setFromCamera mouseVector, scene.getCamera()
  intersects = raycaster.intersectObjects scene.getChildren()

  selectedElement = intersects[0]
  if selectedElement
    selectedElement.originalHEX = selectedElement.object.material.color.getHex()
    selectedElement.object.material.color.set 0x00FF00
    selectedElement.object.originClass.printMessage()


onMouseUp = (event) ->
  # event.stopPropagation()

  if selectedElement?
    selectedElement.object.material.color.setHex selectedElement.originalHEX
    selectedElement = null


window.addEventListener( 'mousedown', onMouseDown, false )
window.addEventListener( 'mouseup', onMouseUp, false )
init()
render()
