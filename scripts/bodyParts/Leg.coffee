BodyPart = require "./BodyPart"


class Leg extends BodyPart
  constructor: (config) ->
    config ?= {}

    # Set up config object.
    config.height   ?= 50
    config.width    ?= 12
    config.depth    ?= 12
    config.color    ?= 0x00FFFF
    config.message  ?= "Pierna"
    config.position ?= {x:10, y:-40, z:0}
    config.audioUrl ?= "./assets/audio/Pierna.m4a"

    # Parent constructor
    super config



module.exports = Leg
