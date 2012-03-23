exports.Class = View.extend
  init: ->
    @children = [
      K.jade("profile.jade", 
      {
        name: Ti.App.facebookdata.name,
        enddate: "20/03/2012"
      }),
      K.createImageView({
        image: "image/logo_530.png",
        className: "logo"
      }),
      K.createView({
        layout: "horizontal",
        className: "vtastes",
        children: [
          K.createImageView({
            image: "image/activities/pesas.png"
            className: "icon"
          }),
          K.createImageView({
            image: "image/activities/bici.png"
            className: "icon"
          }),
          K.createImageView({
            image: "image/activities/abdominales.png"
            className: "icon"
          }),
          K.createImageView({
            image: "image/activities/caminadora.png"
            className: "icon"
          })
        ]
      }),
      K.createView({
        layout: "horizontal",
        className: "vachive",
        children: [
          K.createImageView({
            image: "image/badges/pesas10.png"
            className: "badge"
          }),
          K.createImageView({
            image: "image/badges/7.png"
            className: "badge"
          }),
          K.createImageView({
            image: "image/badges/timer.png"
            className: "badge"
          }),
          K.createImageView({
            image: "image/badges/15.png"
            className: "badge"
          }),
          K.createImageView({
            image: "image/badges/timerx2.png"
            className: "badge"
          })
        ]
      })
    ]
    
    $(".avatar").get(0).setImage "image/rms.jpg"
    $(".logout").bind('click', -> Ti.Facebook.logout())
    
    @_super.apply(@, arguments)