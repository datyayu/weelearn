BodyPart = require "./BodyPart"


class Torso extends BodyPart
  constructor: (config) ->
    config ?= {}

    # Set up config object.
    config.message  ?= "Torso"
    config.audioUrl ?= "./assets/audio/Torso.m4a"

    # Parent constructor
    super config



module.exports = Torso
