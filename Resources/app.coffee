Ti.include '/kranium/lib/kranium.js'

K.initBackbone()

Ti.App.win = null

develop = true

Ti.App.useWin = (type, title, prev = Ti.App.win, options = new Object())->
  nav = null
  if prev
    navwin = K.createWindow()
    nav = Ti.UI.iPhone.createNavigationGroup window: prev
    navwin.add nav
    navwin.open()
  
  Ti.App.win = K.createWindow({
    fullscreen: true
    title: title
  })
  win = Ti.App.win
  options.type = type
  $(options).appendTo win
  
  if nav
    nav.open win, animated: true
  else 
    win.open transition: Titanium.UI.iPhone && Titanium.UI.iPhone.AnimationStyle.FLIP_FROM_LEFT
  
main = ->
  if develop
    Ti.App.useWin('main', 'Sportium')
  else
    Ti.Facebook.requestWithGraphPath('me', {}, 'GET', (e) ->
      if e.success
        Ti.App.facebookdata = JSON.parse(e.result);
        Ti.App.useWin('main', 'Sportium')      
    )
  

login = ->
  if Ti.App.win
    Ti.API.info Ti.App.win
    Ti.App.win.close()
  Ti.App.win = null
  win = K.createWindow({
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
  win.open({
    transition: Titanium.UI.iPhone && Titanium.UI.iPhone.AnimationStyle.FLIP_FROM_LEFT
  })


Ti.Facebook.forceDialogAuth = true
Ti.Facebook.appid = '278493245262'
Ti.Facebook.permissions = ['publish_stream', 'publish_checkins']
Ti.Facebook.addEventListener 'login', (event)->
  if event.success 
    main()
Ti.Facebook.addEventListener 'logout', (event)-> login()

run = ->
  if develop || Ti.Facebook.loggedIn
    main()
  else
    login()
    

run()
