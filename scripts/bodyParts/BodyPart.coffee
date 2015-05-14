THREE = require "three"
Cube  = require "../ObjectGenerators/Cube"


class BodyPart
  constructor: (config) ->
    config ?= {}

    # Set up object properties.
    @bodyColor = config.bodyColor or 0xFFE0BD
    @message   = config.message   or "Cuerpo"
    @model     = config.model     or null
    @audioUrl  = config.audioUrl  or null
    @position  = config.position  or {x:0,y:0,z:0}


  # Return the THREE.js representation of the body.
  getElement: ->
    @threeElement


  # Return the childrens inside the Three.js element.
  getElementChildren: ->
    @threeElement.children


  # Return which part of the body is.
  getMessage: ->
    @message


  # Play audio track telling which part of the body is from.
  playSound: (audioElement) ->
    audioElement.pause()
    audioElement.src = @audioUrl
    audioElement.load()
    audioElement.play()


  # Set up three.js representation.
  setModel: (callback) ->
    if @model?
      loader = new THREE.JSONLoader()
      loader.load @model, (geometry) =>
        skin = new THREE.MeshLambertMaterial({color: @bodyColor})
        @threeElement = new THREE.Mesh(geometry, skin)
        @threeElement.position.set(@position.x, @position.y, @position.z)
        @threeElement.originClassInstance = this
        callback(@threeElement)

    else
      @threeElement = new Cube(@width, @height, @depth, @color)
      @threeElement.position.set(@position.x, @position.y, @position.z) if @position?
      @threeElement.originClassInstance = this
      callback(@threeElement)


  # Set hex color of the element. If not arguments, return to normal color.
  setHexColor: (color) ->
    color ?= @bodyColor
    @threeElement.material.color.setHex color



module.exports = BodyPart
