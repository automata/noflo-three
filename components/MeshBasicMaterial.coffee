noflo = require 'noflo'
THREE = require '../vendor/three.min.js'

exports.getComponent = ->
  c = new noflo.Component

  c.icon = 'cog'

  c.description = 'Create a basic material'

  c.inPorts.add 'color',
    datatype: 'object'
    process: (event, payload) ->
      return unless event is 'data'
      c.obj = new THREE.MeshBasicMaterial({color: 0x00ff00})
      return unless c.outPorts.out.isAttached()
      c.outPorts.out.send c.obj

  c.outPorts.add 'out',
    datatype: 'object'

  c
