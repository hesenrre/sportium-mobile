
exports.Class = View.extend

  init: ->
    @className ='mainwhole'
    mainWin = Ti.App.win
    @children = [
      {
        type: 'button'
        className: 'asistenciaButton'
        events:{
          click:(event)->Ti.App.useWin('codigoqr', 'Checkin', mainWin) 
        }  
      }
      {
        type: 'button'
        className: 'rutinaButton'
        events:{
          click:(event)->Ti.App.useWin('rutina', 'Mi Rutina', mainWin) 
        } 
      }
      {
        type: 'button'
        className: 'eventosButton'
        events:{
          click:(event)->Ti.App.useWin('events', 'Calendario', mainWin) 
        } 
      }
      {
        type: 'button'
        className: 'sucursalesButton'
        events:{
          click:(event)->Ti.App.useWin('sucursales', 'Sucursales', mainWin) 
        } 
      }
      {
        type: 'button'
        className: 'profileButton'
        events:{
          click:(event)->Ti.App.useWin('profile', 'Mi Perfil', mainWin) 
        } 
      }
      {
        type: 'button'
        className: 'feedbackButton'
        events:{
          click:(event)->Ti.App.useWin('feedback', 'Comentarios', mainWin) 
        } 
      }
    ]
    @_super.apply(@, arguments) 