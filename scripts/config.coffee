audioElement     = document.getElementById "audio"
textElement      = document.getElementById "text"
canvasElement    = document.getElementById "canvas"
textElement.size = textElement.style.height = 50


Config =
  # Scene properties.
  scene:
    bgColor: 0xFFFFFF
    canvas:  canvas
    height:  window.innerHeight - textElement.size
    width:   window.innerWidth

  # Event handler properties.
  eventHandler:
    elements:
      audio: audioElement
      text:  textElement
    onTouchDelay: 500


module.exports = Config
