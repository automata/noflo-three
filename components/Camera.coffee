noflo = require 'noflo'
THREE = require '../vendor/three.min.js'

exports.getComponent = ->
  c = new noflo.Component

  c.icon = 'cog'

  c.description = 'Camera'

  c.inPorts.add 'position',
    datatype: 'object'
    process: (event, payload) ->
      return unless event is 'data'
      #c.obj.position = payload
      c.obj = new THREE.PerspectiveCamera(75, 1.3, 0.1, 1000)
      c.obj.position.z = 5
      return unless c.outPorts.out.isAttached()
      c.outPorts.out.send c.obj

  c.outPorts.add 'out',
    datatype: 'object'

  c
