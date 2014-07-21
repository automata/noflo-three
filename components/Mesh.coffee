noflo = require 'noflo'
THREE = require '../vendor/three.min.js'

exports.getComponent = ->
  c = new noflo.Component

  c.icon = 'cog'

  c.description = 'Create a mesh'

  c.inPorts.add 'geometry',
    datatype: 'object'
    process: (event, payload) ->
      return unless event is 'data'
      c.geometry = payload
      c.compute()

  c.inPorts.add 'material',
    datatype: 'object'
    process: (event, payload) ->
      return unless event is 'data'
      c.material = payload
      c.compute()

  c.outPorts.add 'out',
    datatype: 'object'

  c.compute = ->
    return unless c.geometry? and c.material?
    c.obj = new THREE.Mesh(c.geometry, c.material)
    return unless c.outPorts.out.isAttached()
    c.outPorts.out.send c.obj

  c
