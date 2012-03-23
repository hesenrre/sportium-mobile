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
    area = Ti.UI.createTextArea({width: '90%', height: 200, top: 60, left: 10, backgroundColor: '#cccccc', borderColor: 'black'})
    $('.feedback').get(0).add area
    $(area).addClass('comments')
    
