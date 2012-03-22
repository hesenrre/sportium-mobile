Ti.include '/kranium/lib/kranium.js'

K.initBackbone()

win = null

main = ->
  win.close() if win
  win = K.createWindow()
  $({type: 'main'}).appendTo win
  win.open()

login = ->
  win.close() if win
  win = K.createWindow({
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
  win.open()


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