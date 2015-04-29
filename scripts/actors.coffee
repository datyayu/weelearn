THREE = require "three"
Head  = require "./bodyParts/Head"
Torso = require "./bodyParts/Torso"
Arm   = require "./bodyParts/Arm"
Leg   = require "./bodyParts/Leg"


head     = new Head()
torso    = new Torso()
rightArm = new Arm()
leftArm  = new Arm({position: {x:-28, y:-10, z:0}})
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
