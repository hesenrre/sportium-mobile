
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
        className: 'profileButton'
        events:{
          click:(event)->Ti.App.useWin('profile', 'Perfil') 
        } 
      }
      {
        type: 'button'
        className: 'eventosButton'
        events:{
          click:(event)->Ti.App.useWin('events', 'Calendario') 
        } 
      }
     
    ]
    @_super.apply(@, arguments) 