Flux   = require "./utils/Flux"

ViewerActions = Flux.createActions
  setConfig: (config) ->
    { actionType: "SET_CONFIG", config: config }

  setOnTouchDelay: (delay) ->
    { actionType: "SET_DELAY", delay: delay }

  setBgColor: (color) ->
    { actionType: "SET_BGCOLOR", color: color }



module.exports = ViewerActions
