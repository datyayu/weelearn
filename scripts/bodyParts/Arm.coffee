BodyPart = require "./BodyPart"


class Arm extends BodyPart
  constructor: (config) ->
    config = {} unless config

    config.height   = 50 unless config.height
    config.width    = 12 unless config.width
    config.depth    = 16 unless config.depth
    config.color    = 0xFFFF00 unless config.color
    config.message  = "Arm" unless config.message
    config.position = {x:28, y:-10, z:0} unless config.position

    super config



module.exports = Arm
