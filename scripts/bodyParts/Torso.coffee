BodyPart = require "./BodyPart"


class Torso extends BodyPart
  constructor: (config) ->
    config ?= {}

    # Set up config object.
    config.height   ?= 50
    config.width    ?= 40
    config.depth    ?= 30
    config.color    ?= 0xFFFFFF
    config.message  ?= "Torso"
    config.position ?= {x:0, y:0, z:0}
    config.audioUrl ?= "./assets/audio/Torso.m4a"

    # Parent constructor
    super config



module.exports = Torso
