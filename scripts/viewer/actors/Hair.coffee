BodyPart = require "./BodyPart"


class Hair extends BodyPart
  # Constructor
  # @params {Object} config List of the instance's properties.
  constructor: (config) ->
    config ?= {}

    # Set up config object.
    config.message  ?= "Cabello"
    config.audioUrl ?= "/assets/audio/cabello.mp3"
    config.model    ?= "/assets/models/hair.json"

    # Parent constructor
    super config


# Export the class.
module.exports = Hair
