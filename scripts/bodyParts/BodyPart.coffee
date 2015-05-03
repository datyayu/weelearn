Cube  = require "../ObjectGenerators/Cube"


class BodyPart
  constructor: (config) ->
    config = {} unless config

    # Set up object properties.
    @width    = config.width or 50
    @height   = config.height or 50
    @depth    = config.depth or 50
    @color    = config.color or 0xFFFFFF
    @message  = config.message or "Body"
    @position = config.position or null
    @reverse  = config.reverse or no


    # Set up three.js representation.
    @threeElement = new Cube(@width, @height, @depth, @color)
    @threeElement.originClassInstance = this
    @threeElement.position.set(@position.x, @position.y, @position.z) if @position?


  # Get the THREE.js representation of the body.
  getElement: ->
    @threeElement


  getElementChildren: ->
    @threeElement.children


  # Print wich part of the body is.
  printMessage: ->
    console.log @message



module.exports = BodyPart
