BodyPart = require "./BodyPart"


class Hand extends BodyPart
  # Constructor
  # @params {Object} config List of the instance's properties.
  constructor: (config) ->
    config ?= {}

    # Set up config object.
    config.message      ?= "Mano"
    config.audioUrl     ?= "/assets/audio/mano.mp3"
    config.meshMaterial ?= "Lambert"

    if config.side is "left"
      config.model ?= "/assets/models/left_hand.json"
    else
      config.model ?= "/assets/models/right_hand.json"

    # Parent constructor
    super config



# Export the class.
module.exports = Hand
