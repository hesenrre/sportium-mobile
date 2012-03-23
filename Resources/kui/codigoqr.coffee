exports.Class = View.extend
  init: ->
    Ti.API.log "nombre de socio: "+Ti.App.facebookdata.name
    childs =  [ K.jade('codigoqr.jade',{nombreSocio:Ti.App.facebookdata.name, numeroSocio:Ti.App.facebookdata.id}) ]

    @children = childs
    @_super.apply(@, arguments)    
