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
 
    


develop = false
Ti.Facebook.forceDialogAuth = true
Ti.Facebook.appid = '278493245262'
Ti.Facebook.permissions = ['publish_stream', 'publish_checkins']
Ti.Facebook.addEventListener 'login', (event)->
  if event.success 
    main()
    Ti.Facebook.requestWithGraphPath('me', {}, 'GET', (e) ->
      if e.success
        Ti.App.facebookdata = JSON.parse(e.result)      
    )
Ti.Facebook.addEventListener 'logout', (event)-> login()

main = ->
  if Ti.App.win
    Ti.App.win.close()
  Ti.App.win = null
  Ti.App.useWin 'main', 'Sportium'
  
login = ->
  Ti.App.win = K.createWindow({
    fullscreen: true,
    children: [
      {
        type: 'button',
        backgroundImage: 'image/facebook.png',
        events: {
          click: (event)->
            Ti.Facebook.authorize()
        }
      }
    ]
  })
  Ti.App.win.open({
    transition: Titanium.UI.iPhone && Titanium.UI.iPhone.AnimationStyle.FLIP_FROM_LEFT
  })


run = ->
  if develop || Ti.Facebook.loggedIn
    main()
  else
    login() 

run()
