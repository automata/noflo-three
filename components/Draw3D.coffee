noflo = require 'noflo'
THREE = require '../vendor/three.min.js'

exports.getComponent = ->
  c = new noflo.Component

  c.icon = 'cog'

  c.description = 'WebGL Renderer'

  c.inPorts.add 'tick',
    datatype: 'bang'
    process: (event, payload) ->
      return unless event is 'data'
      c.obj.render(c.scene, c.camera)
      c.obj = new THREE.WebGLRenderer()
      c.obj.setSize(c.width, c.height)
      c.dom.appendChild(c.obj.domElement)
      console.log 'RENDER', c.obj, c.scene, c.camera

  c.inPorts.add 'element',
    datatype: 'object'
    process: (event, payload) ->
      return unless event is 'data'
      c.dom = payload
      c.compute()

  c.inPorts.add 'width',
    datatype: 'int'
    process: (event, payload) ->
      return unless event is 'data'
      c.width = payload
      c.compute()

  c.inPorts.add 'height',
    datatype: 'int'
    process: (event, payload) ->
      return unless event is 'data'
      c.height = payload
      c.compute()

  c.inPorts.add 'scene',
    datatype: 'object'
    process: (event, payload) ->
      return unless event is 'data'
      c.scene = payload
      c.compute()

  c.inPorts.add 'camera',
    datatype: 'object'
    process: (event, payload) ->
      return unless event is 'data'
      c.camera = payload
      c.compute()

  c.compute = ->
    return unless c.width? and c.height? and c.scene? and c.camera? and c.dom?
    c.obj = new THREE.WebGLRenderer()
    c.obj.setSize(c.width, c.height)
    c.dom.appendChild(c.obj.domElement)

  c
