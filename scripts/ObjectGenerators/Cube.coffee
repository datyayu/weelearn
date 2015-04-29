THREE = require "three"


cubeFactory = (width, height, depth, color) ->
  geometry = new THREE.BoxGeometry width, height, depth
  material = new THREE.MeshLambertMaterial {color: color}

  return new THREE.Mesh geometry, material



module.exports = cubeFactory
