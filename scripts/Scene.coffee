THREE = require "three"
require "../libs/OrbitControls"


class Scene
  # Constructor
  # @params {Object} config List of the instance's properties.
  constructor: (config) ->
    config ?= {}

    # Scene config.
    @_width   = config.width   or 400
    @_height  = config.height  or 300
    @_bgColor = config.bgColor or 0x000000

    # Camera config.
    @_viewAngle = config.viewAngle or 90
    @_near      = config.near      or 0.1
    @_far       = config.far       or 10000
    aspect      = @_width / @_height

    # Create the THREE Elements.
    @_renderer = new THREE.WebGLRenderer({alpha: yes})
    @_camera   = new THREE.PerspectiveCamera(@_viewAngle, aspect, @_near, @_far)
    @_scene    = new THREE.Scene()

    # Add camera to scene.
    @_scene.add @_camera
    @_camera.position.set 0, 0, 8

    # Set background.
    @_renderer.setClearColor @_bgColor
    @_renderer.setPixelRatio window.devicePixelRatio


  # Add an element to the scene.
  # @params {Object} element Element to be appended to the scene.
  add: (element) ->
    @_scene.add element


  # Draw the scene onto a given element based on its id.
  # @param {String} canvasId An Html node's id to draw scene on.
  appendTo: (canvasId) ->
    @_renderer.setSize @_width, @_height

    canvas = document.getElementById canvasId
    canvas.appendChild @_renderer.domElement


  # Return the instance's camera.
  # @return {Object} Instace's THREE.js Camera object.
  getCamera: ->
    @_camera


  # Get the children elements from the scene.
  # @return {Array} Elements nested within the scene.
  getChildren: ->
    @_scene.children


  # Render the scene using requestAnimationFrame.
  render: ->
	  @_renderer.render(@_scene, @_camera)


  # Resize the viewport and update the scene matrix.
  # @params {Number} width  Canvas new width.
  # @params {Number} height Canvas new height.
  resize: (width, height) ->
    @_renderer.setSize width, height

    @_camera.aspect = width / height
    @_camera.updateProjectionMatrix()


  # Add controls to the scene which rerender the scene based
  # on a given callback.
  # @param {function} renderCallback Callback used to rerender on action.
  # @param {Number}   damping        Controls' damping.
  setControls: (renderCallback, damping) ->
    if renderCallback?
      @_controls         = new THREE.OrbitControls(@_camera)
      @_controls.damping = damping or 0.2

      @_controls.addEventListener "change", renderCallback
    else
      console.error "No render callback specified to controls"



# Export the class.
module.exports = Scene
