main = null # the main view
portStack = []

portSize =   
  width: 320
  height: 480

definePort = (port)->
  id = "#port#{port.row}x#{port.col}"
  Ti.API.info "DEFINED #{id} #{port.type}"
  container = $(main).find(id)
  port.portView = container[0]
  port.zIndex = 0
  loader = ->
    view = $(port)
    container[0].loader = (-> view.get(0))
    view.appendTo container[0]
    container.get(0).fireEvent 'loaded'
    view.get(0)
  container[0].loader = loader
      

loadPort = (port)->
  id = "#port#{port.row}x#{port.col}"
  Ti.API.info "LOAD #{id}"
  container = $(main).find(id).get(0)
  if container.loader
     Ti.API.info "LOADING #{port.row} #{port.col}"
     container.loader()
  
moveViewForward = (port, animate = true, done = ->)->
  Ti.API.info "MOVING TO #{port.row} #{port.col}"
  loadPort port
  container = $(main).find("#port#{port.row}x#{port.col}").get(0)
  from = portStack[portStack.length - 1] || {}
  if from.row
    fromCont = $(main).find("#port#{from.row}x#{from.col}").get(0)
    fromCont.fireEvent 'leave', forward: port
    fromCont.fireEvent "leaveFrom#{from.row}x#{from.col}", forward: port
    fromCont.fireEvent "leaveTo#{port.row}x#{port.col}", forward: port
  container.fireEvent 'enter', forward: from
  container.fireEvent "enterFrom#{from.row}x#{from.col}", forward: from
  moveViewPort port, animate, ->
    portStack.push port
    done()
  
moveViewBack = (animate = true, done = ->)->
  return if portStack.length < 2
  from = portStack.pop()
  to = portStack.pop()
  fromCont = $(main).find("#port#{from.row}x#{from.col}").get(0)
  fromCont.fireEvent 'leave', back: to
  fromCont.fireEvent "leaveFrom#{from.row}x#{from.col}", back: to
  fromCont.fireEvent "leaveBackTo#{to.row}x#{to.col}", back: to
  toCont = $(main).find("#port#{to.row}x#{to.col}").get(0)
  toCont.fireEvent 'enter', back: from
  toCont.fireEvent "enterBackFrom#{from.row}x#{from.col}", back: from 
  moveViewPort to, animate, ->
    portStack.push to
    done()
    
bindMove = (from, to, forward, backward = ->)->
   portView = $(main).find("#port#{from.row}x#{from.col}")
   portView.bind "leaveTo#{to.row}x#{to.col}", forward
   portView.bind "leaveBackTo#{to.row}x#{to.col}", forward
   portView.bind "enterFrom#{to.row}x#{to.col}", backward
   portView.bind "enterBackFrom#{to.row}x#{to.col}", backward
    
portPos = (port, relative = null)->
  pos =
    top: portSize.height * port.row * -1
    left: portSize.width * port.col * -1
  if relative
    rel = portPos(relative)
    
    if port.row == relative.row
      pos.top = 0
    else
      pos.top = rel.top - pos.top
     
    if port.col == relative.col
      pos.left = 0
    else
      pos.left = rel.left - pos.left
  pos

moveViewPort = (port, animate = true, done = ->)->
  duration = 1000
  
  pos = portPos port

  if animate   
    movement = Ti.UI.createAnimation
       duration: duration       
       top: pos.top
       left: pos.left
    
    movement.addEventListener 'complete', ->
       main.top = pos.top
       main.left = pos.left
       done()
    main.animate movement
  else
    main.top = pos.top
    main.left = pos.left
    done()
    
rows = 4
cols = 4
cent = { row: 2, col: 2 }

click = (event)->
    {row, col} = portStack[portStack.length - 1]
    
    destPort = { row: row, col: col }
    if event.index == 0
      return moveViewBack()
    else if event.index == 1 && col > 0 # left
      destPort.col = col - 1
    else if event.index == 2 && row < (rows - 1) # down
      destPort.row = row + 1
    else if event.index == 3 && row > 0 # up
      destPort.row = row - 1
    else if event.index == 4 && col < (cols - 1) # right
      destPort.col = col + 1
    else
      return # nothing
      
    moveViewForward destPort
    
createPort = (port)->
  {row, col} = port

  color = '#'+Math.floor(Math.random()*16777215).toString(16)    
  
  id = "port#{row}x#{col}"
  Ti.API.log "CREATING PORT #{id}"
  
  {
    id:      id
    type:    'view'
    row:     row
    col:     portSize.col
    height:  portSize.height
    width:   portSize.width
    top:     portSize.height * row
    left:    portSize.width * col
    backgroundColor: color
    zIndex: 0
    children: [
      {
        type: 'label'
        className: 'portLabel'
        text: "Port #{row} #{col}"
        width: 'auto'
        height: 'auto'
        top: 10
        left: 10
      }
      {
        className: 'portNav'
        type: 'buttonbar'
        labels: ['Back', 'Left', 'Down', 'Up', 'Right']
        top: 430
        left: 10
        width: 300
        height: 40
        zIndex: 1
        events: { click: click }
      }
    ]
  }

ports = []
for row in [0..rows-1]
  for col in [0..cols-1]
    unless row == cent.row && col == cent.col
       ports.push(createPort(row: row, col: col))
ports.push(createPort cent)
  
Ti.API.info "CREATING MAIN VIEW"  
win = K.createWindow(fullscreen: true)

# PUBLIC API  

Ti.App.win = win
Ti.App.bindMove = bindMove
Ti.App.moveTo = moveViewForward
Ti.App.moveBack = moveViewBack
Ti.App.portPos = portPos
Ti.App.loadPort = loadPort

main = K(type: 'view', id: 'sportium', children: ports).get(0)
# DEFINE PORTS
# Ports are loaded the first time a user
# switches to them, and their 'loaded' event
# is fired.

definePort {
  row: 0
  col: 3
  type: 'mainPort'
}


definePort {
  row: 2
  col: 2
  type: 'mainPort'
}


definePort {
  row: 2
  col: 3
  type: 'profilePort'
}

# START
moveViewForward({row: 2, col: 2}, false)
win.add main
win.open()

Ti.API.info 'LOADED PORTS' 