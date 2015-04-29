THREE = require "three"
require "../libs/OrbitControls"


class Scene
  constructor: (config) ->
    config = {} unless config

    # Scene config
    @width  = config.width or 400
    @height = config.height or 300
    @bgColor = config.bgColor or 0xffffff

    # Camera config
    @viewAngle = config.viewAngle or 90
    @near      = config.near or 0.1
    @far       = config.far or 10000
    @aspect    = @width / @height

    # Create the THREE Elements
    @renderer = new THREE.WebGLRenderer({alpha: yes})
    @camera   = new THREE.PerspectiveCamera(@camera, @aspect, @near, @far)
    @scene    = new THREE.Scene()

    # Add camera to scene
    @scene.add @camera
    @camera.position.z = 300

    # Set background
    @renderer.setClearColor @bgColor, 1
    @renderer.setPixelRatio window.devicePixelRatio


  # Add an element to the scene.
  add: (element) ->
    @scene.add element


  # Draw the scene onto a given element based on its id.
  appendTo: (canvasId) ->
    @renderer.setSize @width, @height

    canvas = document.getElementById canvasId
    canvas.appendChild @renderer.domElement


  # Set controls enable state.
  enableControls: (state) ->
    @controls.enabled = state


  # Return the instance's camera.
  getCamera: ->
    @camera


  # Get the children elements from the scene.
  getChildren: ->
    @scene.children


  # Render the scene using requestAnimationFrame.
  render: ->
	  @renderer.render @scene, @camera


  resize: (newSize) ->
    console.log newSize
    @renderer.setSize newSize.width, newSize.height
    @camera.aspect = newSize.width / newSize.height
    @camera.updateProjectionMatrix()


  # Add controls to the scene based on a given callback.
  setControls: (config) ->
    if config.renderCallback?
      @controls = new THREE.OrbitControls(@camera)
      @controls.damping = config.damping or 0.2
      @controls.addEventListener "change", config.renderCallback
    else
      console.error "No render callback specified to controls"



module.exports = Scene
