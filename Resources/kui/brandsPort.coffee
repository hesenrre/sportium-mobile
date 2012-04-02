children = [  
  {
    id:'brands'
    type: 'imageview'
    image:'image/map.jpg'
    width: '100%'
    height: '100%'
  }

]

exports.Class = View.extend
  init: (opts)->
    @children = children
    @_super.apply(@, arguments)
    self = $(@el)
    
    portBrand2 = {row: 0, col: 3}
    
    self.find('#brands').bind 'click', -> Ti.App.moveTo portBrand2