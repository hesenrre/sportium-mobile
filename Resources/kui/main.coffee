
exports.Class = View.extend

  init: ->
    @className ='mainwhole'
    @children = [
      {
        type: 'button'
        className: 'asistenciaButton'
        events:{
          click:(event)->
            Ti.App.useWin("codigoqr") 
        }  
      }
      {
        type: 'button'
        className: 'rutinaButton'
        events:{
          click:(event)->
            Ti.App.useWin("rutina") 
        } 
      }
      {
        type: 'button'
        className: 'eventosButton'
        events:{
          click:(event)->
            Ti.App.useWin("events")
        } 
      }
      {
        type: 'button'
        className: 'sucursalesButton'
        events:{
          click:(event)->Ti.App.useWin('brands', 'Sucursales') 
        } 
      }
      {
        type: 'button'
        className: 'profileButton'
        events:{
          click:(event)->
            Ti.App.useWin("profile") 
        } 
      }
      {
        type: 'button'
        className: 'feedbackButton'
        events:{
          click:(event)->
            Ti.App.useWin("feedback") 
        } 
      }
    ]
    @_super.apply(@, arguments) 