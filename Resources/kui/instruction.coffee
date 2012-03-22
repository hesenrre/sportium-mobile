childs =  [
  {
    type: 'label'
    text: 'Ejercicio numero 1'
  }
]

exports.Class = View.extend
  init: (opts)->
    Ti.API.info opts
    @children = childs
    @_super.apply(@, arguments)    
