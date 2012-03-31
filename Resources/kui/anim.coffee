mainPort = 
 type: 'view'
 className: 'mainPort'
 children: [
   {
     type: 'view'
     className: 'mapHere' 
   }
   {
     type: 'scrollview'
     className: 'locationsHere'
     children: [ 
       {
         type: 'tableview'
         data: [
           {
             type: 'tableviewrow'
             children: [
               {
                 type: 'label'
                 text: 'Polanco'
                 className: 'locationItem'
               }    
             ]
           }
           
           {
             type: 'tableviewrow'
             children: [
               {
                 type: 'label'
                 text: 'Interlomas'
                 className: 'locationItem'
               }    
             ]
           }
  
           {
             type: 'tableviewrow'
             children: [
               {
                 type: 'label'
                 text: 'San Angel'
                 className: 'locationItem'
               }    
             ]
           }
  
           {
             type: 'tableviewrow'
             children: [
               {
                 id: 'foo'
                 type: 'label'
                 text: 'Perisur'
                 className: 'locationItem'
               }    
             ]
           }
         ].map K.createTableViewRow
       }
     ]
   }
 ]

locationPort =
 type: 'view'
 className: 'locationPort'
 children: [
   {
     type: 'label'
     text: 'San Angel'
     className: 'sportium'
   }
 ]
 
children = [
  {
     type: 'label'
     text: 'Sportium texto muy muy grande'
     className: 'sportium'
  },
  mainPort,
  locationPort
]


exports.Class = View.extend
  init: (opts)->
    @children = children
    @_super.apply(@, arguments)
    
    self = @el
    mainPort = $(self).find('.mainPort').get(0)
    locationPort = $(self).find('.locationPort').get(0)
    
    foo = $(self).find('#foo').get(0)
    Ti.API.log foo


    there = false
    
    $(self).find('.locationItem').bind 'click', (event)->(
      Ti.API.log 'ANIMATING '+self
      newLeft = there and 0 or (mainPort.size.width * -1)
      anim = Ti.UI.createAnimation {
          left: newLeft
          duration: 500
        }, ()->(
          Ti.API.log 'DONE ANIMATING '+self
          self.left = newLeft
        )
      self.animate(anim)
    )