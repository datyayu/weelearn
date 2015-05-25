THREE   = require "three"
Head    = require "./Head"
Hair    = require "./Hair"
Face    = require "./Face"
Eyes    = require "./Eyes"
Neck    = require "./Neck"
Chest   = require "./Chest"
Stomach = require "./Stomach"
Arm     = require "./Arm"
Hand    = require "./Hand"
Leg     = require "./Leg"
Foot    = require "./Foot"

###########################
##        ACTORS         ##
###########################

# Head
head = new Head()
hair = new Hair()
face = new Face()
eyes = new Eyes()
neck = new Neck()

# Torso
chest   = new Chest({position:{x:0, y:-4.61, z:0}})
stomach = new Stomach({position:{x:0, y:-4.50, z:0}})

# Arms
rightArm = new Arm({position: {x: 0.01, y:-4.6, z:0}, side: "right"})
leftArm  = new Arm({position: {x:-0.01, y:-4.6, z:0}, side: "left"})

# Hands
rightHand = new Hand({side: "right"})
leftHand  = new Hand({side: "left"})

# Legs
rightLeg = new Leg({position: {x:-0.01, y:-4.5, z:0}, side: "right"})
leftLeg  = new Leg({position: {x: 0.01, y:-4.5, z:0}, side: "left"})

# Feet
rightFoot = new Foot(
  position: {x:-0.01, y:-4.5, z:0}
  bodyColor: 0x181009
  side: "right"
)
leftFoot  = new Foot(
  position: {x:-0.01, y:-4.5, z:0}
  bodyColor: 0x181009
  side: "left"
)

###########################
##        EXPORTS        ##
###########################
actors = [
  face
  head
  hair
  eyes
  neck
  stomach
  chest
  leftArm
  rightArm
  leftHand
  rightHand
  leftLeg
  rightLeg
  leftFoot
  rightFoot
]


# Export the main function.
module.exports = actors
