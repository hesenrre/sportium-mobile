children = [  
  {
    id:'rutina1'
    type: 'imageview'
    image:'image/rutina.jpg'
    width: '100%'
    height: '100%'
  }

]

exports.Class = View.extend
  init: (opts)->
    @children = children
    @_super.apply(@, arguments)
    self = $(@el)
    
    portRoutine2 = {row: 1, col: 3}
    
    self.find('#rutina1').bind 'click', -> Ti.App.moveTo portRoutine2