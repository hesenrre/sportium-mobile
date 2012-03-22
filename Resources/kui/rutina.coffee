backendResponse = {
  todo: [
    {
      type:'cardio'
      desc:'20 minutos caminadora nivel 8'
      done: true
    }
    {
      type:'pesas'
      desc:'repite 4/15 con 7kg'
      done: false
    }
    {
      type:'pierna'
      desc:'serie 4/10 con 2.5kg en extension'
      done: false
    }
    {
      type:'espalda'
      desc:'serie 4/10 con 4.0kg en maquina'
      done: false
    }
  ]  
}


views = backendResponse.todo.map (todo)->
  tvr = K.createTableViewRow()
  rutina = J('rutina.jade', {  todo: todo })
  
  if todo.done
    rutina.find('.paloma').addClass 'palomeado'
  rutina.addClass todo.type + 'Rutina'
  rutina.find('.maquina').addClass todo.type + 'Maquina'
  
  moveDown = (event)->
    ary = (v for v in views when v != tvr) 
    ary.push tvr
    $('.rutinaTable').get(0).setData ary
  
  
  rutina.find('.paloma').bind('click', moveDown)
  rutina.bind('slide', moveDown) 
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
