Ti.include '/kranium/lib/kranium.js'

K.initBackbone()

Ti.App.win = null

main = ->

  Ti.Facebook.requestWithGraphPath('me', {}, 'GET', (e) ->
      if e.success
        Ti.App.facebookdata = JSON.parse(e.result);
        win = Ti.App.win
        win.close() if win
        win = Ti.App.win = K.createWindow({
          fullscreen: true
        })
        $({type: 'profile'}).appendTo win
        win.open({
          transition: Titanium.UI.iPhone && Titanium.UI.iPhone.AnimationStyle.FLIP_FROM_LEFT
        })    
    );
  

login = ->
  win = Ti.App.win
  win.close() if win
  win = Ti.App.win = K.createWindow({
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
  if Ti.Facebook.loggedIn
    main()
  else
    login()
    

run()
