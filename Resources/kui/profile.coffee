exports.Class = View.extend
  init: ->
    
    @children = [
      K.jade("profile.jade", 
      {
        name: "Victor Hugo Borja Rodriguez",
        enddate: "20/03/2012"
      }),
      K.createImageView({
        image: "image/logo_530.png",
        className: "logo"
      })
    ]
    
    $(".avatar").get(0).setImage "image/rms.jpg"
    $(".logout").bind('click', () -> Ti.Facebook.logout())
    
    @_super.apply(@, arguments)