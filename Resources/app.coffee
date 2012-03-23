Ti.include '/kranium/lib/kranium.js'

K.initBackbone()

viewStack = [] 
win = K.createWindow()
flexSpace = K.createButton({
  systemButton: Titanium.UI.iPhone.SystemButton.FLEXIBLE_SPACE
});

back = K.createButton({
  title: "back"
});

back.addEventListener("click", () ->
  Ti.App.viewManager.backToLastView()
);

toolbar = K.createToolbar({
  items:[back, flexSpace],
  bottom:0,
  borderTop:true,
  borderBottom:false,
  translucent:true,
  barColor:'#999'

})

$({type: "main"}).appendTo win
win.open()

Ti.App.viewManager = {
   addView: (view) ->
     if not win
       win = K.createWindow()
     viewStack.push view
     Ti.API.log viewStack
     $({type: view}).appendTo win
     win.add toolbar
     win.open() 
   
   backToLastView: ->
     win.close()
     win = K.createWindow()
     viewStack.pop()
     view = if viewStack.length > 1 then viewStack.pop() else "main"
     $({type: view}).appendTo win
     win.open()
   
   views: ->
     Ti.API.log "calling viewStack"
     viewStack
}




