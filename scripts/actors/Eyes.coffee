BodyPart = require "./BodyPart"


class Eyes extends BodyPart
  # Constructor
  # @params {Object} config List of the instance's properties.
  constructor: (config) ->
    config ?= {}

    # Set up config object.
    config.message  ?= "Ojos"
    config.audioUrl ?= "./assets/audio/ojos.mp3"
    config.model    ?= "./assets/models/eyes.json"

    # Parent constructor
    super config


# Export the class.
module.exports = Eyes
