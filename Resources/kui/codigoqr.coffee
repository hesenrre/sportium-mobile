childs =  [ K.jade('codigoqr.jade',{nombreSocio:"Ti.App.facebookdata.name", numeroSocio:"Ti.App.facebookdata.id"}) ]

exports.Class = View.extend

  init: ->
    @children = childs
    @_super.apply(@, arguments)    
