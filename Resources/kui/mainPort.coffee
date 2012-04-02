children = [
        
  {
      id: 'mainbg'
      type: 'imageview'
      images: [
       '/image/main1.jpg'
       '/image/main2.jpg'
       '/image/main3.jpg'
       '/image/main4.jpg'
       '/image/main5.jpg'
       '/image/main6.jpg' 
      ]
      width: 'auto'
      height: 'auto'
      left: 0
      top: 0
      duration: 200
      repeatCount: 1
      touchEnabled: false
  }
  
  {
    id: 'userName'
    type: 'label'
    text: 'Demetrio'
    width: '200%'
    height: 'auto'
    zIndex: 1
    top: 10
    left: -100
    finalLeft: 10
    opacity: 0
    color: 'white'
    font: {
      fontSize: 120
      fontFamily: 'GeosansLight'
      fontWeight: 'bold'
    }
  }
  
  
  
  {
    id: 'checkin'
    className: 'menuItem'    
    type: 'imageview'
    image: '/image/checkin.png'
    left: -80
    top: 480
    finalLeft: -80
    finalTop: 200
    opacity: 0
    width: 'auto'
    height: 40
  }
  
  
  {
    id: 'mirutina'
    className: 'menuItem'    
    type: 'imageview'
    image: '/image/mi-rutina.png'
    left: -80
    top: 480
    finalLeft: -80
    finalTop: 240
    opacity: 0
    width: 'auto'
    height: 40
  }
  
  
  
  {
    id: 'eventos'
    className: 'menuItem'    
    type: 'imageview'
    image: '/image/eventos.png'
    left: -80
    top: 480
    finalLeft: -80
    finalTop: 280
    opacity: 0    
    width: 'auto'
    height: 40
  }
  
  
  
  {
    id: 'sucursales'
    className: 'menuItem'    
    type: 'imageview'
    image: '/image/sucursales.png'
    left: -80
    top: 480
    finalLeft: -80
    finalTop: 320
    opacity: 0    
    width: 'auto'
    height: 40    
  }
  
  
  
  {
    id: 'feedback'
    className: 'menuItem'    
    type: 'imageview'
    image: '/image/comentarios.png'
    left: -100
    top: 480
    finalLeft: -100
    finalTop: 360
    opacity: 0    
    width: 'auto'
    height: 40  
  }
   
]


exports.Class = View.extend

  init: (opts)->
    @children = children
    @_super.apply(@, arguments)
    
    self = $(@el)
    
    portView = opts.portView # 2, 2
    portProfile = {row: 2, col: 3}
    portRoutine = {row: 1, col: 2}
    portCheckin = {row: 2, col: 1}
    portClubs   = {row: 0, col: 2}
    portEvents  = {row: 3, col: 2}
    portFeedback= {row: 0, col: 1}
    
    
    self.find('#mirutina').bind 'click', -> Ti.App.moveTo portRoutine
    self.find('#feedback').bind 'click', -> Ti.App.moveTo portFeedback     
    
    self.find('#checkin').bind 'click', -> Ti.App.moveTo portCheckin
    self.find('#userName').bind 'click',-> Ti.App.moveTo portProfile

    self.find('#sucursales').bind 'click', -> Ti.App.moveTo portClubs    
    self.find('#eventos').bind 'click', -> Ti.App.moveTo portEvents

        
    self.find('.menuItemBounce').bind 'click', ->
      me = this
      upper = Ti.UI.createAnimation
                duration: 100
                transform: Ti.UI.create2DMatrix().scale(1.2)
      lower = Ti.UI.createAnimation
                duration: 100
                transform: Ti.UI.create2DMatrix().scale(1.0)
                
      upper.addEventListener 'complete', -> me.animate lower
      me.animate upper

    $(portView).bind 'loaded', (event)->
      Ti.API.info "MAIN PORT HAS BEEN LOADED #{event}"
      
      self.find('#mainbg').get(0).start()
      self.find('#userName').get(0).animate Ti.UI.createAnimation
                     duration: 1000
                     left: self.find('#userName').get(0).finalLeft
                     opacity: 1
      animateMenu()
            
    animateMenu = (complete = ->)->
      items = self.find('.menuItem')
      last = items.size() - 1 
      items.get().forEach (item, i)->
        anim = Ti.UI.createAnimation
                     duration: 700 + (100 * i)
                     top: item.finalTop
                     left: item.finalLeft
                     opacity: 1
                     transform: Ti.UI.create2DMatrix().scale(1.0)
        anim.addEventListener 'complete', ->
          last -= 1
          complete() if last == 0             
        item.animate anim
       
    moveMenuItemTitle = (port, selector, topOff = 10, leftOff = 5, opacity = 1)->
      item = self.find(selector).get(0)
      hideMenuItems(item) 
      pos = Ti.App.portPos port, opts
      moveTitle = Ti.UI.createAnimation
                   duration: 1000
                   opacity: opacity
                   top: pos.top + topOff
                   left: pos.left + leftOff
                   transform: Ti.UI.create2DMatrix().scale(2.5)      
      item.animate moveTitle

    hideMenuItems = (exceptThis)->
      self.find('.menuItem').get().forEach (item)->
        if item != exceptThis
          hid = Ti.UI.createAnimation
                duration: 500
                opacity: 0
                top: 480
          item.animate hid      

      
    forwardToProfile = ->
      pos = Ti.App.portPos(portProfile, opts)      
      move = Ti.UI.createAnimation
                    duration: 1000               
                    left: pos.left - 100
                    zIndex: 1
      self.find('#userName').get(0).animate move
      hideMenuItems(null)
    backFromProfile = ->
      move = Ti.UI.createAnimation
                    duration: 1000               
                    left: 10
                    zIndex: 1
      self.find('#userName').get(0).animate move      
      animateMenu()
    Ti.App.bindMove opts, portProfile, forwardToProfile, backFromProfile        

      
    forwardToRoutine = -> moveMenuItemTitle(portRoutine, '#mirutina', 20, 20)
    backFromRoutine = -> animateMenu()
    Ti.App.bindMove opts, portRoutine, forwardToRoutine, backFromRoutine
      
      
    forwardToCheckin = -> moveMenuItemTitle(portCheckin, '#checkin', 25, 40)
    backFromCheckin = -> animateMenu()
    Ti.App.bindMove opts, portCheckin, forwardToCheckin, backFromCheckin
      
    forwardToClubs = -> moveMenuItemTitle(portClubs, '#sucursales',370,20)
    backFromClubs = -> animateMenu()
    Ti.App.bindMove opts, portClubs, forwardToClubs, backFromClubs
      

    forwardToEvents = -> moveMenuItemTitle(portEvents, '#eventos',250,40, 0.1)
    backFromEvents = -> animateMenu()
    Ti.App.bindMove opts, portEvents, forwardToEvents, backFromEvents
      

    forwardToFeedback = -> moveMenuItemTitle(portFeedback, '#feedback')
    backFromFeedback = -> animateMenu()
    Ti.App.bindMove opts, portFeedback, forwardToFeedback, backFromFeedback 
      
