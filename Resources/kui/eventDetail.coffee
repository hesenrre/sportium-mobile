

exports.Class = View.extend

  init:(args) ->
    
    @className = 'eventDetail'
    @children = [
      {
        type:'label',
        className:'eventDetailTitle',
        text:args.event.desc 
      }
      {
        type:'imageview',
        className:args.event.cls
      }
      {
        type:'label',
        className:'eventDetailDesc',
        text:args.event.longdesc 
      }
      {
        type:'button',
        className:'eventDetailButton',
        title:'Inscribirse' , 
        events:{
          click:(event)->
            Titanium.UI.createAlertDialog({message:'Te has registrado al evento'}).show()
            @.enabled = false;
            @.color = 'gray';
        }
      
      }
    ]
    @_super.apply(@, arguments)    
