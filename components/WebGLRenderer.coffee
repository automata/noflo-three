noflo = require 'noflo'
THREE = require '../vendor/three.min.js'

exports.getComponent = ->
  c = new noflo.Component

  c.icon = 'cog'

  c.description = 'WebGL Renderer'

  c.inPorts.add 'in',
    datatype: 'string'
    process: (event, payload) ->
      return unless event is 'data'
      console.log THREE
      c.outPorts.out.send payload

  c.outPorts.add 'out',
    datatype: 'string'

  c
