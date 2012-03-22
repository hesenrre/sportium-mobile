Ti.include '/kranium/lib/kranium.js'

K.initBackbone()

window = K.createWindow()

rutina = J('rutina.jade')
rutina.appendTo(window)

window.open()

