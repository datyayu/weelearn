BodyPart = require "./BodyPart"


class Hand extends BodyPart
  constructor: (config) ->
    config = {} unless config

    # Setup config object.
    config.height   = 10 unless config.height?
    config.width    = 10 unless config.width?
    config.depth    = 10 unless config.depth?
    config.color    = 0xAA00AA unless config.color?
    config.message  = "Hand" unless config.message?
    config.audioUrl  = "./assets/audio/Mano.m4a" unless config.audioUrl?

    # Set up position based on the parent (arm) position.
    if config.parent.position?
      parent = config.parent
      # Position in x relative to the arm (parent)
      xPos = parent.position.x + parent.width/2 + config.width/2
      xPos = -xPos if config.reverse
      # TODO: Add positions relative to y,z.

      config.position = {}
      config.position.x = xPos
      config.position.y = parent.position.y
      config.position.z = parent.position.z

    else
      config.position = {x:0, y:0, z:0}

    super config







module.exports = Hand
