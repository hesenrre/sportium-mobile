backendResponse = {
  todo: [
    {
      type:'abdominales'
      desc:'20 minutos nado mariposa'
      done: false
      anim: [
        'image/instruction/nado1.png',
        'image/instruction/nado2.png',
        'image/instruction/nado3.png',
        'image/instruction/nado4.png'
      ]
      longdesc: '''
        Realice 20 minutos de nado en mariposa.
        Si necesita ayuda consulte a su instructor.
      ''' 
    }
    {
      type:'pesas'
      desc:'serie 4/15 con pesas 7.0kg'
      done: false
      anim: [
        'image/instruction/pesas1.png',
        'image/instruction/pesas2.png',
        'image/instruction/pesas3.png',
        'image/instruction/pesas4.png'
      ]
      longdesc: '''
      Asegurese de realizar los movimientos
      de manera lenta y de utilizar la
      respiracion correcta.
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
    longi = 0
    views = backendResponse.todo.map (todo)->
      tvr = K.createTableViewRow()
      tvr.todo = todo
      rutina = J('rutina.jade', {  todo: todo })
     
      rutina.todo = todo
      rutina.addClass todo.type + 'Rutina'
      rutina.find('.maquina').addClass todo.type + 'Maquina'
     
      done = (event)->  
        Ti.API.info 'palomeados ='
        Ti.API.info longi 
        if longi == views.length - 1
          Ti.App.showNotification 'Congratulations', 'logo.png'  
        longi = longi + 1   
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

   backgroundImage: "image/rutinasbg.jpg"
   top: 0
   height: "92%" 
