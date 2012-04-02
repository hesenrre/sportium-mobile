children = [  
  {
    id:'calendar'
    type: 'imageview'
    image:'image/calendar.jpg'
    width: '100%'
    height: '100%'
  }
]

exports.Class = View.extend
  init: (opts)->
    @children = children
    @_super.apply(@, arguments)