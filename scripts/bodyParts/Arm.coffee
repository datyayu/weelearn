BodyPart = require "./BodyPart"
Hand     = require "./Hand"


class Arm extends BodyPart
  constructor: (config) ->
    config ?= {}

    # Setup the config object.
    config.height    ?= 16
    config.width     ?= 50
    config.color     ?= 0xFFFF00
    config.depth     ?= 16
    config.message   ?= "Brazo"
    config.position  ?= {x:45, y:10, z:0}
    config.audioUrl  ?= "./assets/audio/Brazo.m4a"

    # Parent constructor
    super config

    # Rotate the arm PI rads (180deg).
    if config.reverse
      @threeElement.rotation.z = Math.PI
      @threeElement.position.x = -config.position.x

    # Add a hand
    @addHand() if config.includeHand


  # Adds a hand element to the arm three.js thelement.
  addHand: ->
    # Create a new hand
    handConfig =
      reverse: @reverse
      parent:
        position: @position
        width: @width

    hand = new Hand(handConfig)

    # Add it to the arm element
    @threeElement.add hand.threeElement
    # NOTE: the hand element default positions are setup
    # to be used on the main scene. If you plan to use
    # it directly on the arm element, you should specify
    # your own proper coordinates relative to the arm.




module.exports = Arm
