exports.Class = View.extend
  init:(args) ->
    @children = [
      {
        type:'imageview',
        image:'image/' +args.image,
        classname:'notificationView',
        events:{
           click:(event) ->
             args.win.close()
        }
      }
    ]
    @_super.apply(@, arguments)