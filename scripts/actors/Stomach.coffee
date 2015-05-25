BodyPart = require "./BodyPart"


class Stomach extends BodyPart
  # Constructor
  # @params {Object} config List of the instance's properties.
  constructor: (config) ->
    config ?= {}

    # Set up config object.
    config.message  ?= "Estomago"
    config.audioUrl ?= "./assets/audio/stomach.mp3"
    config.model    ?= "./assets/models/stomach.json"

    # Parent constructor
    super config



# Export the class.
module.exports = Stomach
