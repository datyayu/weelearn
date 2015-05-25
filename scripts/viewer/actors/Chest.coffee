BodyPart = require "./BodyPart"


class Chest extends BodyPart
  # Constructor
  # @params {Object} config List of the instance's properties.
  constructor: (config) ->
    config ?= {}

    # Set up config object.
    config.message  ?= "Pecho"
    config.audioUrl ?= "/assets/audio/pecho.mp3"
    config.model    ?= "/assets/models/chest.json"

    # Parent constructor
    super config



# Export the class.
module.exports = Chest
