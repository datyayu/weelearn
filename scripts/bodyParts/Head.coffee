BodyPart = require "./BodyPart"


class Head extends BodyPart
  constructor: (config) ->
    config ?= {}

    # Set up config object.
    config.height   ?= 20
    config.width    ?= 20
    config.depth    ?= 20
    config.color    ?= 0x0F5FFF
    config.message  ?= "Cabeza"
    config.position ?= {x:0, y:35, z:0}
    config.audioUrl ?= "./assets/audio/Cabeza.m4a"

    # Parent constructor
    super config


module.exports = Head
