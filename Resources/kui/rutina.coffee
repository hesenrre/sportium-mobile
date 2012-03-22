backendResponse = {
  todo: [
    {
      type:'nado'
      desc:'20 minutos nado mariposa'
      done: false
      anim: [
        'image/instruction/nado1.png',
        'image/instruction/nado2.png',
        'image/instruction/nado3.png',
        'image/instruction/nado4.png'
      ]
      longdesc: '''
        El nado es un ejercicio completo.
        Realice 20 minutos de nado en mariposa.
        La animacion ejemplifica los movimientos
        principales de este ejercicio.
      '''      
      
    }
    {
      type:'bici'
      desc:'15 minutos bicicleta'
      done: false
    }
    {
      type:'abdominales'
      desc:'serie 4/20 abdominales'
      done: false
    }
    {
      type:'pesas'
      desc:'serie 4/15 con pesas 7.0kg'
      done: false
    }
    {
      type:'caminadora'
      desc:'20 minutos caminadora nivel 8'
      done: false
    }
    {
      type:'bici'
      desc:'15 minutos bicicleta'
      done: false
    }
    {
      type:'abdominales'
      desc:'serie 4/20 abdominales'
      done: false
    }
    {
      type:'pesas'
      desc:'serie 4/15 con pesas 7.0kg'
      done: false
    }
  
  ]  
}


exports.Class = View.extend

  init: ->

    rutinaWin = Ti.App.win

    views = backendResponse.todo.map (todo)->
      tvr = K.createTableViewRow()
      rutina = J('rutina.jade', {  todo: todo })
     
      rutina.todo = todo
      rutina.addClass todo.type + 'Rutina'
      rutina.find('.maquina').addClass todo.type + 'Maquina'
      
      moveDown = (event)->
        rutina.find('.paloma').addClass 'palomeado'
        rutina.removeClass todo.type + 'Rutina'
        rutina.addClass 'gray'
     
        $('.rutinaTable').get(0).deleteRow(tvr)
        $('.rutinaTable').get(0).appendRow(tvr)
        
      
      $(rutina.find('.paloma').get(0)).bind('click', moveDown)
      rutina.bind('click', (event)->
         Ti.App.useWin 'instruction', todo.desc, rutinaWin, todo: todo  
      )
      
      rutina.appendTo tvr
      tvr

    
    
    @children = [
      {
        type:'tableview'
        className: 'rutinaTable'
        data: views        
      }
    ]
    @_super.apply(@, arguments)    
