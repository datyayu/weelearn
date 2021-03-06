THREE = require "three"


class BodyPart
  # Constructor
  # @params {Object} config List of the instance's properties.
  constructor: (config) ->
    config ?= {}

    # Set up object properties.
    @_bodyColor    = config.bodyColor or {
      r: 0.9529411764705882
      g: 0.7254901960784313
      b: 0.5568627450980392
    }
    @_message      = config.message   or "Cuerpo"
    @_model        = config.model     or null
    @_audioUrl     = config.audioUrl  or null
    @_model        = config.model     or null
    @_position     = config.position  or {x:0,y:-4.6,z:0}
    @_meshMaterial = config.meshMaterial or "Face"


  # Return the THREE.js 3D representation reference of the body part.
  # @return {string} THREE.js element.
  getElement: ->
    @_threeElement


  # Return the childrens inside the Three.js element.
  # @return {array} Elements nested inside the instance's THREE.js element.
  getElementChildren: ->
    @_threeElement.children


  # Return which part of the body is.
  # @return {string} Text with the body part name.
  getMessage: ->
    @_message


  # Play audio track telling which part of the body is from.
  # @param {Object} audioElement HTML5 audio element to play the sound on it.
  playSound: (audioElement) ->
    audioElement.pause()
    audioElement.src = @_audioUrl
    audioElement.load()
    audioElement.play()


  # Set up three.js representation.
  # @param {function} callback Callback to be executed after the element load.
  setModel: (callback) ->
    loader = new THREE.JSONLoader()

    loader.load @_model, (geometry, materials) =>
      skinMaterial = {}

      # Pick material.
      if @_meshMaterial is "Lambert"
        skinMaterial   = new THREE.MeshPhongMaterial()
        @_threeElement = new THREE.Mesh(geometry, skinMaterial)
        @_threeElement.material.color = @_bodyColor
      else
        skinMaterial   = new THREE.MeshFaceMaterial(materials)
        @_threeElement = new THREE.Mesh(geometry, skinMaterial)
        @_bodyColor    = materials[0].color

      # Create the 3D Mesh.
      # Set its position.
      @_threeElement.position.set @_position.x, @_position.y, @_position.z

      # Add on the THREE.js element a reference to the instance
      # where the element was created so it can be access when dealing
      # with stuff like intersections.
      @_threeElement.originClassInstance = this

      # Execute the callback with the created element.
      callback(@_threeElement)

  # Set hex color of the element. If not arguments, return to normal color.
  # @param {Number} A HEX RGB representation of the color.
  setColor: (color) ->
    color ?= @_bodyColor
    if @_meshMaterial is "Lambert"
      @_threeElement.material.color = color
    else
      @_threeElement.material.materials[0].color = color


# Export the class.
module.exports = BodyPart
