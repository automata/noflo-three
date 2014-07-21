noflo = require 'noflo'
THREE = require '../vendor/three.min.js'

exports.getComponent = ->
  c = new noflo.Component

  c.icon = 'cog'

  c.description = 'Scene'

  c.inPorts.add 'children',
    datatype: 'object'
    process: (event, payload) ->
      return unless event is 'data'
      c.children = payload
      c.compute()

  c.outPorts.add 'out',
    datatype: 'object'

  c.compute = ->
    return unless c.children?
    c.obj = new THREE.Scene()
    c.obj.add c.children
    return unless c.outPorts.out.isAttached()
    c.outPorts.out.send c.obj

  c
