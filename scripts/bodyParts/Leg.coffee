BodyPart = require "./BodyPart"


class Leg extends BodyPart
  # Constructor
  # @params {Object} config List of the instance's properties.
  constructor: (config) ->
    config ?= {}

    # Set up config object.
    config.message  ?= "Pierna"
    config.audioUrl ?= "./assets/audio/Pierna.m4a"

    # Parent constructor
    super config



# Export the class.
module.exports = Leg
