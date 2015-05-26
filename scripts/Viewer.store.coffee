Flux = require "./utils/Flux"

data =
  scene:
    bgColor: 0xFFFFFF
  eventHandler:
    onTouchDelay: 500
  colors: [
    {hex: 0xFFFFFF, name: "#FFFFFF", textColor: "black"}
    {hex: 0xF75F5F, name: "#F75F5F", textColor: "white"}
    {hex: 0x28961C, name: "#28961C", textColor: "white"}
    {hex: 0x6E84F5, name: "#6E84F5", textColor: "white"}
    {hex: 0x000000, name: "#000000", textColor: "white"}
  ]


setConfig       = (config) -> data = config
setOnTouchDelay = (delay)  -> data.eventHandler.onTouchDelay = delay
setBgColor      = (color)  -> data.scene.bgColor = color


ViewerStore = Flux.createStore(
  getConfig         : -> data
  getBgColors       : -> data.colors
  getCurrentBgColor : -> data.scene.bgColor
  getCurrentDelay   : -> data.eventHandler.onTouchDelay
,
  (payload) ->
    switch payload.actionType
      when "SET_CONFIG"  then setConfig(payload.config)
      when "SET_DELAY"   then setOnTouchDelay(payload.delay)
      when "SET_BGCOLOR" then setBgColor(payload.color)

      else return true

    ViewerStore.emitChange()
)

module.exports = ViewerStore
