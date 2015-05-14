BodyPart = require "./BodyPart"


class Foot extends BodyPart
  constructor: (config) ->
    config ?= {}

    # Setup config object.
    config.message  ?= "Pie"
    config.audioUrl ?= "./assets/audio/Pie.m4a"

    # Parent constructor
    super config


module.exports = Foot
