BodyPart = require "./BodyPart"


class Neck extends BodyPart
  # Constructor
  # @params {Object} config List of the instance's properties.
  constructor: (config) ->
    config ?= {}

    # Set up config object.
    config.message  ?= "Cuello"
    config.audioUrl ?= "/assets/audio/cuello.mp3"
    config.model    ?= "/assets/models/neck.json"

    # Parent constructor
    super config


# Export the class.
module.exports = Neck
