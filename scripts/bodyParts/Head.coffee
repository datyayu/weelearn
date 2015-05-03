BodyPart = require "./BodyPart"


class Head extends BodyPart
  constructor: (config) ->
    config = {} unless config

    # Set up config object.
    config.height   = 20 unless config.height
    config.width    = 20 unless config.width
    config.depth    = 20 unless config.depth
    config.color    = 0x0F5FFF unless config.color
    config.message  = "Cabeza" unless config.message
    config.position = {x:0, y:35, z:0} unless config.position
    config.audioUrl  = "./assets/audio/Cabeza.m4a" unless config.audioUrl?

    super config


module.exports = Head
