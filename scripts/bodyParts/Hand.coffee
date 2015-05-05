BodyPart = require "./BodyPart"


class Hand extends BodyPart
  constructor: (config) ->
    config ?= {}

    # Setup config object.
    config.height   ?= 10
    config.width    ?= 10
    config.depth    ?= 10
    config.color    ?= 0xAA00AA
    config.message  ?= "Mano"
    config.audioUrl ?= "./assets/audio/Mano.m4a"

    # Set up position based on the parent (arm) position.
    if config.parent.position?
      # Position in x relative to the arm (parent)
      # TODO: Add positions relative to y,z.
      parent = config.parent
      xPos = parent.position.x + parent.width/2 + config.width/2
      xPos = -xPos if config.reverse

      config.position   = {}
      config.position.x = xPos
      config.position.y = parent.position.y
      config.position.z = parent.position.z

    else
      config.position = {x:0, y:0, z:0}

    # Parent constructor
    super config







module.exports = Hand
