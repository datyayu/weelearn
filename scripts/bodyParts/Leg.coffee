BodyPart = require "./BodyPart"


class Leg extends BodyPart
  constructor: (config) ->
    config = {} unless config

    config.height   = 50 unless config.height
    config.width    = 12 unless config.width
    config.depth    = 12 unless config.depth
    config.color    = 0x00FFFF unless config.color
    config.message  = "Leg" unless config.message
    config.position = {x:10, y:-40, z:0} unless config.position

    super config



module.exports = Leg
