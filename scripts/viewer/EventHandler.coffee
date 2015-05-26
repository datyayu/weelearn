THREE = require "three"
_     = require "lodash"



class EventHandler
  # Constructor
  constructor: (scene, renderCallback, config) ->
    # Scene-type object.
    @_scene          = scene
    @_renderCallback = renderCallback
    @_onTouchDelay   = config.onTouchDelay   or 1000
    @_onTouchColor   = config.onTouchColor   or {r:0, g:.8, b:0}
    @_bodyColor      = config.bodyColor      or 0xFFE0BD
    @_textElement    = config.elements.text  or null
    @_audioElement   = config.elements.audio or null

    # ThreeJS Elements.
    @_raycaster   = new THREE.Raycaster()
    @_mouseVector = new THREE.Vector3()
    @_intersected = null

    # Add event listeners.
    window.addEventListener "touchstart", @_onTouchStart  , false
    window.addEventListener "mousedown" , @_onMouseDown   , false
    window.addEventListener "touchend"  , @_onPressEnd    , false
    window.addEventListener "mouseup"   , @_onPressEnd    , false
    window.addEventListener "resize"    , @_onWindowResize, false

  removeListeners: =>
    @_raycaster   = null
    @_mouseVector = null
    @_intersected = null
    window.removeEventListener "touchstart", @_onTouchStart  , false
    window.removeEventListener "mousedown" , @_onMouseDown   , false
    window.removeEventListener "touchend"  , @_onPressEnd    , false
    window.removeEventListener "mouseup"   , @_onPressEnd    , false
    window.removeEventListener "resize"    , @_onWindowResize, false


  # Check for intersections on raycastering.
  _detectIntersects: =>
    @_raycaster.setFromCamera @_mouseVector, @_scene.getCamera()
    intersects    = @_raycaster.intersectObjects @_scene.getChildren()
    @_intersected = intersects[0] # We only want the first intersection.

    # Show intersected element (if it exists).
    if @_intersected?
      # Change color to show touched element.
      @_intersected.object.originClassInstance.setColor @_onTouchColor

      # Show element name on textElement.
      if @_textElement?
        @_textElement.innerText = @_intersected.object.originClassInstance.getMessage()

      # Play soundfile with the element name on audioElement.
      if @_audioElement?
        @_intersected.object.originClassInstance.playSound @_audioElement

  ###########################
  ##    EVENT HANDLERS     ##
  ###########################

  # Mouse down handler.
  _onMouseDown: (event) =>
    event.preventDefault()

    # Update mouse position.
    @_mouseVector.x = ( event.clientX / @_scene.getWidth() ) * 2 - 1
    @_mouseVector.y = - ( event.clientY / @_scene.getHeight() ) * 2 + 1

    # Check for intersects
    @_detectIntersects()


  # Touch start handler.
  _onTouchStart: (event) =>
    # event.preventDefault()

    # Update touch position.
    @_mouseVector.x = ( event.touches[0].pageX/ @_scene.getWidth() ) * 2 - 1
    @_mouseVector.y = - ( event.touches[0].pageY / @_scene.getHeight() ) * 2 + 1

    # Check for intersects.
    @_detectIntersects()


  # Mouse up handler.
  _onPressEnd: (event) =>
    event.preventDefault()

    # Return all to normal.
    if @_intersected?
      # Create a copy of the element for async handling and
      # remove original to allow other parts to be touched.
      elementReference = _.clone @_intersected
      @_intersected    = null

      # Show the touched part for a certain period of time.
      setTimeout ->
        elementReference.object.originClassInstance.setColor(@_bodyColor)
      , @_onTouchDelay


  # Window resize handler.
  _onWindowResize: (event) =>
    # Get new size for the window
    height = window.innerHeight - @_textElement.size
    width  = window.innerWidth - 1

    # Re-render using the new window size.
    @_scene.resize width, height
    @_renderCallback()



module.exports = EventHandler
