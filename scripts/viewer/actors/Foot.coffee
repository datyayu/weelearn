BodyPart = require "./BodyPart"


class Foot extends BodyPart
  # Constructor
  # @params {Object} config List of the instance's properties.
  constructor: (config) ->
    config ?= {}

    # Set up config object.
    config.message      ?= "Pie"
    config.audioUrl     ?= "/assets/audio/pie.mp3"
    config.meshMaterial ?= "Lambert"

    if config.side is "left"
      config.model ?= "/assets/models/left_foot.json"
    else
      config.model ?= "/assets/models/right_foot.json"

    # Parent constructor
    super config



# Export the class.
module.exports = Foot
