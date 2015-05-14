BodyPart = require "./BodyPart"


class Head extends BodyPart
  constructor: (config) ->
    config ?= {}

    # Set up config object.
    config.message  ?= "Cabeza"
    config.audioUrl ?= "./assets/audio/Cabeza.m4a"

    # Parent constructor
    super config


module.exports = Head
