Ti.include '/kranium/lib/kranium.js'

K.initBackbone()

viewStack = [] 
flexSpace = K.createButton({
  systemButton: Titanium.UI.iPhone.SystemButton.FLEXIBLE_SPACE
});

back = K.createButton({
  title: "back"
});

back.addEventListener("click", () ->
  Ti.App.backWin()
);

toolbar = K.createToolbar({
  items:[back, flexSpace],
  bottom:0,
  borderTop:true,
  borderBottom:false,
  translucent:true,
  barColor:'#999'
})

Ti.App.win = null
Ti.App.facebookdata = {}

Ti.App.useWin = (type, title, prev = null, options = new Object())->
  prev or= Ti.App.win
  if prev
    viewStack.push prev 
    prev.hide()
  options.type = type
  Ti.App.win = K.createWindow title: title
  view = $(options)
  view.appendTo Ti.App.win
  Ti.App.win.add toolbar if prev
  Ti.App.win.open()
  
Ti.App.backWin = ->
  prev = viewStack.pop()
  if prev
    Ti.App.win.close()
    Ti.App.win = prev
    Ti.App.win.add toolbar unless viewStack.length == 0
    Ti.App.win.show()
 
    


main = ->
  Ti.App.useWin 'main', 'Sportium'

main()
