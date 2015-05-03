THREE = require "three"
Head  = require "./bodyParts/Head"
Torso = require "./bodyParts/Torso"
Arm   = require "./bodyParts/Arm"
Leg   = require "./bodyParts/Leg"
Hand  = require "./bodyParts/Hand"

head     = new Head()
torso    = new Torso()
rightArm = new Arm({includeHand: yes})
leftArm  = new Arm({reverse: yes, includeHand: yes})
rightLeg = new Leg()
leftLeg  = new Leg({position: {x:-10, y:-40, z:0}})

actors = [
  head
  torso
  rightArm
  leftArm
  rightLeg
  leftLeg
]



module.exports = actors
