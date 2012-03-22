childs =  [ K.jade('codigoqr.jade',{nombreSocio:'Daniel Perez', numeroSocio:'1221AA'}) ]

exports.Class = View.extend

  init: ->
    @children = childs
    @_super.apply(@, arguments)    
