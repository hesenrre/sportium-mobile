exports.Class = View.extend
  init:(image) ->
    @children = [
      {type:'imageview',image:'image/' +image}
    ]
    @_super.apply(@, arguments)