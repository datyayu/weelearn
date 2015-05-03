BodyPart = require "./BodyPart"


class Leg extends BodyPart
  constructor: (config) ->
    config = {} unless config

    # Set up config object.
    config.height   = 50 unless config.height
    config.width    = 12 unless config.width
    config.depth    = 12 unless config.depth
    config.color    = 0x00FFFF unless config.color
    config.message  = "Pierna" unless config.message
    config.position = {x:10, y:-40, z:0} unless config.position
    config.audioUrl  = "./assets/audio/Pierna.m4a" unless config.audioUrl?

    super config



module.exports = Leg
