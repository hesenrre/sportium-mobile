Ti.include '/kranium/lib/kranium.js'

K.initBackbone()

window = K.createWindow()

#rutina = J('rutina.jade',{activities:[{title:'cardio' },{title:'pesas'}]})
#rutina.appendTo(window)
$({type: 'rutina'}).appendTo window


window.open()


