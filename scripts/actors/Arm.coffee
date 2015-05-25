BodyPart = require "./BodyPart"
Hand     = require "./Hand"


class Arm extends BodyPart
  # Constructor
  # @params {Object} config List of the instance's properties.
  constructor: (config) ->
    config ?= {}

    # Set up the config object.
    config.message  ?= "Brazo"
    config.audioUrl ?= "./assets/audio/brazo.mp3"
    if config.side is "left"
      config.model = "./assets/models/left_arm.json"
    else
      config.model = "./assets/models/right_arm.json"

    # Parent constructor
    super config



# Export the class.
module.exports = Arm
