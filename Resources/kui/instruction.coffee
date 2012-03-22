

exports.Class = View.extend
  init: (opts)->
    todo = opts.todo
    
    childs = []
    childs.push 
       type: 'label'
       text: todo.desc
       className: 'desc'
      
    if todo.anim
      childs.push
        type: 'imageview'
        images: todo.anim
        duration: 400
        className: 'anim'
    
    if todo.longdesc
      childs.push
         type: 'label'
         text: todo.longdesc
         className: 'longdesc'    
      
    Ti.API.info childs
    @children = childs
    @_super.apply(@, arguments)
    
    if todo.anim
      $('.anim').get(0).start()  
