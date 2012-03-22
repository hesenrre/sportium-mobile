backendResponse = {
  todo: [
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
    
  
  rutina.find('.paloma').bind('click', moveDown)
  rutina.appendTo tvr
  tvr


exports.Class = View.extend

  init: ->
    
    
    @children = [
      {
        type:'tableview'
        className: 'rutinaTable'
        data: views        
      }
    ]
    @_super.apply(@, arguments)    
