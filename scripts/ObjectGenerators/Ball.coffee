THREE = require "three"


sphereFactory = (radius, segments, rings, color) ->
  geometry = new THREE.SphereGeometry radius, segments, rings
  material = new THREE.MeshLambertMaterial {color: color}

  return new THREE.Mesh geometry, material



module.exports = sphereFactory
