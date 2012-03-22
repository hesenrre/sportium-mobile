childs =  [
  {
    type: 'label'
    text: 'Ejercicio numero 1'
  }
]

exports.Class = View.extend
  init: ->
    @children = childs
    @_super.apply(@, arguments)    
