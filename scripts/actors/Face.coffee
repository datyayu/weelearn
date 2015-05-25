BodyPart = require "./BodyPart"


class Face extends BodyPart
  # Constructor
  # @params {Object} config List of the instance's properties.
  constructor: (config) ->
    config ?= {}

    # Set up config object.
    config.message  ?= "Cara"
    config.audioUrl ?= "./assets/audio/cara.mp3"
    config.model    ?= "./assets/models/face.json"

    # Parent constructor
    super config


# Export the class.
module.exports = Face
