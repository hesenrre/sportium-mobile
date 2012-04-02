children = [  
  {
    id:'brands'
    type: 'imageview'
    image:'image/map2.jpg'
    width: '100%'
    height: '100%'
  }

]

exports.Class = View.extend
  init: (opts)->
    @children = children
    @_super.apply(@, arguments)
    self = $(@el)