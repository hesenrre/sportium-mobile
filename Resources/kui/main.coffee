
exports.Class = View.extend

  init: ->
    @className ='mainwhole'
   
    @children = [
      {
        type: 'button'
        className: 'asistenciaButton'
        events:{
          click:(event)->Ti.App.useWin('codigoqr', 'Checkin') 
        }  
      }
      {
        type: 'button'
        className: 'rutinaButton'
        events:{
          click:(event)->Ti.App.useWin('rutina', 'Perfil') 
        } 
      }
      {
        type: 'button'
        className: 'eventosButton'
        events:{
          click:(event)->Ti.App.useWin('events', 'Calendario') 
        } 
      }
      {
        type: 'button'
        className: 'sucursalesButton'
        events:{
          click:(event)->Ti.App.useWin('sucursales', 'Perfil') 
        } 
      }
      {
        type: 'button'
        className: 'profileButton'
        events:{
          click:(event)->Ti.App.useWin('profile', 'Calendario') 
        } 
      }
      {
        type: 'button'
        className: 'feedbackButton'
        events:{
          click:(event)->Ti.App.useWin('feedback', 'Calendario') 
        } 
      }
    ]
    @_super.apply(@, arguments) 