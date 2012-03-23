
exports.Class = View.extend

  init: ->
    @className ='mainwhole'
    mainWin = Ti.App.win
    @children = [
      {
        type: 'button'
        className: 'asistenciaButton'
        events:{
          click:(event)->
            Ti.App.viewManager.addView("codigoqr") 
        }  
      }
      {
        type: 'button'
        className: 'rutinaButton'
        events:{
          click:(event)->
            Ti.App.viewManager.addView("rutina") 
        } 
      }
      {
        type: 'button'
        className: 'eventosButton'
        events:{
          click:(event)->
            Ti.App.viewManager.addView("events")
        } 
      }
      {
        type: 'button'
        className: 'sucursalesButton'
        events:{
          click:(event)->
            Ti.App.viewManager.addView("sucursales") 
        } 
      }
      {
        type: 'button'
        className: 'profileButton'
        events:{
          click:(event)->
            Ti.App.viewManager.addView("profile") 
        } 
      }
      {
        type: 'button'
        className: 'feedbackButton'
        events:{
          click:(event)->
            Ti.App.viewManager.addView("feedback") 
        } 
      }
    ]
    @_super.apply(@, arguments) 