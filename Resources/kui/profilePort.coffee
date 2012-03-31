children = [  
  
  {
    type: 'label'
    text: 'Membresia cubierta:'
    top: 150
    left: 10
    width: 'auto'
    height: 'auto'
    font: {
      fontSize: 20
      fontFamily: 'GeosansLight'
    }
  }
  {
    type: 'label'
    text: '20 Abril 2012'
    top: 150
    left: 200
    width: 'auto'
    height: 'auto'
    font: {
      fontSize: 20
      fontFamily: 'GeosansLight'
      fontWeight: 'bold'
    }
  }
 
  {
    id: 'sporteam'
    type: 'label'
    className: 'menuItem'
    opacity: 0
    text: 'Mi Sporteam'
    top: 480
    left: 10
    finalTop: 200
    finalLeft: 10    
    width: 'auto'
    height: 'auto'
    color: 'white'
    font: {
      fontSize: 25
      fontFamily: 'GeosansLight'
      fontWeight: 'bold'
    }    
  }
  
  {
    id: 'badges'
    type: 'label'
    className: 'menuItem'
    text: 'Mis logros'
    opacity: 0
    top: 480
    left: 10
    finalTop: 230
    finalLeft: 10    
    width: 'auto'
    height: 'auto'
    color: 'white'
    font: {
      fontSize: 25
      fontFamily: 'GeosansLight'
      fontWeight: 'bold'
    }    
  }
  
  {
    id: 'likes'
    type: 'label'
    className: 'menuItem'
    text: 'Mis gustos'
    opacity: 0
    top: 480
    left: 10
    finalTop: 260
    finalLeft: 10    
    width: 'auto'
    height: 'auto'
    color: 'white'
    font: {
      fontSize: 25
      fontFamily: 'GeosansLight'
      fontWeight: 'bold'
    }    
  }
  
]

exports.Class = View.extend

  init: (opts)->
    @children = children
    @_super.apply(@, arguments)
    
    self = $(@el)
    
    portView = opts.portView
    
    
    portSocial = {row: 0, col: 3}
    portGustos = {row: 3, col: 3}
    portLogros = {row: 1, col: 3}

    self.find('#sporteam').bind 'click', -> Ti.App.moveTo portSocial
    self.find('#likes').bind 'click', -> Ti.App.moveTo portGustos
    self.find('#badges').bind 'click', -> Ti.App.moveTo portLogros
    
    $(portView).bind 'loaded', (event)->
      Ti.API.info "PROFILE PORT HAS BEEN LOADED #{event}"
      animateMenu()
   
    animateMenu = (complete = ->)->
      items = self.find('.menuItem')
      last = items.size() - 1 
      items.get().forEach (item, i)->
        anim = Ti.UI.createAnimation
                     duration: 1200 + (100 * i)
                     top: item.finalTop
                     left: item.finalLeft
                     opacity: 1
                     transform: Ti.UI.create2DMatrix().scale(1.0)
        anim.addEventListener 'complete', ->
          last -= 1
          complete() if last == 0             
        item.animate anim
        
    moveMenuItemTitle = (port, selector)->
      item = self.find(selector).get(0)
      hideMenuItems(item) 
      pos = Ti.App.portPos port, opts
      moveTitle = Ti.UI.createAnimation
                   duration: 1000
                   top: pos.top + 10
                   left: pos.left + 5
                   transform: Ti.UI.create2DMatrix().scale(2.5)      
      item.animate moveTitle

    hideMenuItems = (exceptThis)->
      self.find('.menuItem').get().forEach (item)->
        if item != exceptThis
          hid = Ti.UI.createAnimation
                duration: 200
                opacity: 0
                top: 480
          item.animate hid      
        
    forwardToSocial = -> moveMenuItemTitle(portSocial, '#sporteam')
    backFromSocial = -> animateMenu()
    Ti.App.bindMove opts, portSocial, forwardToSocial, backFromSocial
      
    forwardToGustos = -> moveMenuItemTitle(portGustos, '#likes')
    backFromGustos = -> animateMenu()
    Ti.App.bindMove opts, portGustos, forwardToGustos, backFromGustos

    forwardToLogros = -> moveMenuItemTitle(portLogros, '#badges')
    backFromLogros = -> animateMenu()
    Ti.App.bindMove opts, portLogros, forwardToLogros, backFromLogros
   