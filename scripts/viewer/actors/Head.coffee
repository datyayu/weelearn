BodyPart = require "./BodyPart"


class Head extends BodyPart
  # Constructor
  # @params {Object} config List of the instance's properties.
  constructor: (config) ->
    config ?= {}

    # Set up config object.
    config.message  ?= "Cabeza"
    config.audioUrl ?= "/assets/audio/cabeza.mp3"
    config.model    ?= "/assets/models/head.json"

    # Parent constructor
    super config


# Export the class.
module.exports = Head
