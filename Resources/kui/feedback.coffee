exports.Class = View.extend
  init: ->
    @className = 'feedback'
    @children = [
      {
        type: 'label',
        text: 'Comentarios y sugerencias',
        className: 'title'
      }
      {
        type: 'button'
        title: 'Enviar'
        events: {
          click: (event)->
            alert 'Su mensaje ha sido enviado'
            Ti.App.backWin()
        }
        className: 'send'
      }
    ]
    @_super.apply(@, arguments)
    
    options = Ti.UI.createOptionDialog({
        title: 'Seleccione uno ...',
        options: ['Comentario', 'Sugerencia', 'Reporte de fallo en equipo'],
        cancel: 1
    })
    #$('.feedback').get(0).add options
    #$(options).addClass('options')
    area = Ti.UI.createTextArea({width: '90%', height: 200, top: 100, left: 15, opacity: 0.7, borderColor: 'black'})
    @el.add area
    $(area).addClass('comments')
    
  backgroundImage: "image/rutinasbg.jpg"
  top: 0
  height: "92%" 
