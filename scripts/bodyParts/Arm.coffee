BodyPart = require "./BodyPart"
Hand     = require "./Hand"


class Arm extends BodyPart
  constructor: (config) ->
    config ?= {}

    # Setup the config object.
    config.message   ?= "Brazo"
    config.audioUrl  ?= "./assets/audio/Brazo.m4a"

    # Parent constructor
    super config


module.exports = Arm
