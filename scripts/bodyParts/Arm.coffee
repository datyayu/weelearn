BodyPart = require "./BodyPart"
Hand     = require "./Hand"


class Arm extends BodyPart
  constructor: (config) ->
    config = {} unless config?

    # Setup the config object.
    config.height    = 16 unless config.height?
    config.width     = 50 unless config.width?
    config.depth     = 16 unless config.depth?
    config.color     = 0xFFFF00 unless config.color?
    config.message   = "Arm" unless config.message?
    config.position  = {x:45, y:10, z:0} unless config.position?
    config.audioUrl  = "./assets/audio/Brazo.m4a" unless config.audioUrl?

    super config

    # Rotate the arm PI rads (180deg).
    if config.reverse
      @threeElement.rotation.z = Math.PI
      @threeElement.position.x = -config.position.x

    # Add a hand
    if config.includeHand
      @addHand()


  # Adds a hand element to the arm three.js thelement.
  addHand: ->
    # Create a new hand
    @hand = new Hand(
      reverse: @reverse
      parent:
        position: @position
        width: @width
    )

    # Add it to the arm element
    # NOTE: the hand element default positions are setup
    # to be used on the main scene. If you plan to use
    # it directly on the arm element, you should specify
    # your own proper coordinates relative to the arm.
    @threeElement.add @hand.threeElement




module.exports = Arm
