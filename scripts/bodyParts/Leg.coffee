BodyPart = require "./BodyPart"


class Leg extends BodyPart
  constructor: (config) ->
    config ?= {}

    # Set up config object.
    config.message  ?= "Pierna"
    config.audioUrl ?= "./assets/audio/Pierna.m4a"

    # Parent constructor
    super config



module.exports = Leg
