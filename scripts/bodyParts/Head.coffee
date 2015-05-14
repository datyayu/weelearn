BodyPart = require "./BodyPart"


class Head extends BodyPart
  # Constructor
  # @params {Object} config List of the instance's properties.
  constructor: (config) ->
    config ?= {}

    # Set up config object.
    config.message  ?= "Cabeza"
    config.audioUrl ?= "./assets/audio/Cabeza.m4a"

    # Parent constructor
    super config


# Export the class.
module.exports = Head
