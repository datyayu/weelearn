THREE = require "three"


Ball = (radius, segments, rings, color) ->
  geometry = new THREE.SphereGeometry radius, segments, rings
  material = new THREE.MeshLambertMaterial {color: color}

  return new THREE.Mesh geometry, material



module.exports = Ball
