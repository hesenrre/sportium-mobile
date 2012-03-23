

exports.Class = View.extend
  init: (opts)->
    todo = opts.todo
    
    childs = []
    childs.push 
       type: 'label'
       text: todo.desc
       className: 'instdesc'
      
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
    
    @children = childs
    @_super.apply(@, arguments)

    anim = $('.anim').get(0)
    anim.start() if anim
