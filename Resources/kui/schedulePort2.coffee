children = [  
  {
    id:'rutina1'
    type: 'imageview'
    image:'image/rutina2.jpg'
    width: '100%'
    height: '100%'
  }

]

exports.Class = View.extend
  init: (opts)->
    @children = children
    @_super.apply(@, arguments)