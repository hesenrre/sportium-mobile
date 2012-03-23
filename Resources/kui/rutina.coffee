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
      longdesc: ''' El nado es un ejercicio completo.
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

    rutinaTable = null

    views = backendResponse.todo.map (todo)->
      tvr = K.createTableViewRow()
      tvr.todo = todo
      rutina = J('rutina.jade', {  todo: todo })
     
      rutina.todo = todo
      rutina.addClass todo.type + 'Rutina'
      rutina.find('.maquina').addClass todo.type + 'Maquina'
      
      done = (event)->
        rutina.removeClass todo.type + 'Rutina'
        rutina.addClass 'gray'
        rutina.find('.paloma').addClass 'palomeado'
        
        last = views.splice(views.indexOf(tvr), 1)
        views.push.apply views, last
        
        rutinaTable.setData views        
        rutinaTable.deleteRow last[0]
        rutinaTable.appendRow last[0]
     
        
      rutina.find('.paloma').bind 'click', done
        
      info = -> 
        Ti.App.useWin 'instruction', null, null, todo: todo
      rutina.find('.maquina').bind 'click', info        
      rutina.find('.desc').bind 'click', info
               
      rutina.appendTo tvr
      tvr

    
    
    @children = [
      {
        type:'tableview'
        className: 'rutinaTable'
        data: views
        init: ->
          @_super.apply(@, arguments)
      }
    ]
    @_super.apply(@, arguments)
    
    rutinaTable = $('.rutinaTable').get(0)    
