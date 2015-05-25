BodyPart = require "./BodyPart"


class Leg extends BodyPart
  # Constructor
  # @params {Object} config List of the instance's properties.
  constructor: (config) ->
    config ?= {}

    # Set up config object.
    config.message  ?= "Pierna"
    config.audioUrl ?= "./assets/audio/pierna.mp3"

    if config.side is "left"
      config.model ?= "./assets/models/left_leg.json"
    else
      config.model ?= "./assets/models/right_leg.json"

    # Parent constructor
    super config



# Export the class.
module.exports = Leg
