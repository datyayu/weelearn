THREE = require "three"
Head  = require "./Head"
Torso = require "./Torso"
Arm   = require "./Arm"
Hand  = require "./Hand"
Leg   = require "./Leg"
Foot  = require "./Foot"

###########################
##        ACTORS         ##
###########################

# Head
head = new Head(
  model: "assets/models/head.js"
  position: {x:0, y:-4.9, z:0}
)

# Torso
torso = new Torso(
  model: "assets/models/torso.js"
  position: {x:0, y:-4.8, z:0}
)

# Arms
leftArm = new Arm (
  model: "assets/models/left_arm.js"
  position: {x:-.03, y:-4.8, z:0}
)
rightArm = new Arm (
  model: "assets/models/right_arm.js"
  position: {x:.03, y:-4.8, z:0}
)

# Hands
leftHand = new Hand(
  model: "assets/models/left_hand.js"
  position: {x:-0.07, y:-4.8, z:0}
)
rightHand = new Hand(
  model: "assets/models/right_hand.js"
  position: {x:0.07, y:-4.8, z:0}
)

# Legs
leftLeg = new Leg(
  model: "assets/models/left_leg.js"
  position: {x:-.05, y:-4.5, z:0}
)
rightLeg = new Leg(
  model: "assets/models/right_leg.js"
  position: {x:.05, y:-4.5, z:0}
)

# Feet
leftFoot = new Foot(
  model: "assets/models/left_foot.js"
  position: {x:-.05, y:-4.42, z:0}
)
rightFoot = new Foot(
  model: "assets/models/right_foot.js"
  position: {x:.05, y:-4.42, z:0}

)

###########################
##        EXPORTS        ##
###########################

# List the actors to be exported
# TODO: Split/Add:
# - Chest.
# - Back.
# - Head.
# - Face.
# - Genitalia (name pendant)?
actors = [
  head
  torso
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
