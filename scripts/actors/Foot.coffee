BodyPart = require "./BodyPart"


class Foot extends BodyPart
  # Constructor
  # @params {Object} config List of the instance's properties.
  constructor: (config) ->
    config ?= {}

    # Set up config object.
    config.message  ?= "Pie"
    config.audioUrl ?= "./assets/audio/pie.mp3"

    # Parent constructor
    super config



# Export the class.
module.exports = Foot
