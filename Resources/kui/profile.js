(function() {

  exports.Class = View.extend({
    init: function() {
      this.children = [
        K.jade("profile.jade", {
          name: "Victor Hugo Borja Rodriguez",
          enddate: "20/03/2012"
        }), K.createImageView({
          image: "image/logo_530.png",
          className: "logo"
        })
      ];
      $(".avatar").get(0).setImage("image/rms.jpg");
      return this._super.apply(this, arguments);
    }
  });

}).call(this);
