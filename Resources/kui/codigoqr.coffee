exports.Class = View.extend
  init: ->
    childs =  [ K.jade('codigoqr.jade',{nombreSocio:Ti.App.facebookdata.name, numeroSocio:Ti.App.facebookdata.id}) ]

    @children = childs
    @_super.apply(@, arguments)    
