noflo = require 'noflo'
THREE = require '../vendor/three.min.js'

exports.getComponent = ->
  c = new noflo.Component

  c.icon = 'cog'

  c.description = 'Create a box geometry'

  c.inPorts.add 'width',
    datatype: 'number'
    process: (event, payload) ->
      return unless event is 'data'
      c.width = payload
      c.compute()

  c.inPorts.add 'height',
    datatype: 'number'
    process: (event, payload) ->
      return unless event is 'data'
      c.height = payload
      c.compute()

  c.inPorts.add 'depth',
    datatype: 'number'
    process: (event, payload) ->
      return unless event is 'data'
      c.depth = payload
      c.compute()            

  c.outPorts.add 'out',
    datatype: 'object'

  c.compute = ->
    return unless c.width? and c.height? and c.depth?
    c.obj = new THREE.BoxGeometry(c.width, c.height, c.depth)
    return unless c.outPorts.out.isAttached()
    c.outPorts.out.send c.obj

  c
