noflo = require 'noflo'
THREE = require '../vendor/three.min.js'

exports.getComponent = ->
  c = new noflo.Component

  c.icon = 'cog'

  c.description = 'Creates a 3D vector'

  c.inPorts.add 'x',
    datatype: 'number'
    process: (event, payload) ->
      return unless event is 'data'
      c.x = payload
      c.compute()

  c.inPorts.add 'y',
    datatype: 'number'
    process: (event, payload) ->
      return unless event is 'data'
      c.y = payload
      c.compute()

  c.inPorts.add 'z',
    datatype: 'number'
    process: (event, payload) ->
      return unless event is 'data'
      c.z = payload
      c.compute()

  c.outPorts.add 'out',
    datatype: 'object'

  c.compute = ->
    return unless c.x? and c.y? and c.z?
    c.obj = new THREE.Vector3(c.x, c.y, c.z)
    #c.obj.setX(c.x)
    #c.obj.setY(c.y)
    #c.obj.setZ(c.z)
    return unless c.outPorts.out.isAttached()
    c.outPorts.out.send c.obj

  c
