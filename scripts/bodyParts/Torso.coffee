BodyPart = require "./BodyPart"


class Torso extends BodyPart
  constructor: (config) ->
    config = {} unless config

    # Set up config object.
    config.height   = 50 unless config.height
    config.width    = 40 unless config.width
    config.depth    = 30 unless config.depth
    config.color    = 0xFFFFFF unless config.color
    config.message  = "Torso" unless config.message
    config.position = {x:0, y:0, z:0} unless config.position

    super config



module.exports = Torso
