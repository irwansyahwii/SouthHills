// Generated by CoffeeScript 1.9.2
(function() {
  var LocationScreen,
    bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  LocationScreen = (function() {
    function LocationScreen() {
      this.play = bind(this.play, this);
      this.init = bind(this.init, this);
      this.relayout = bind(this.relayout, this);
      this.view = Ti.UI.createScrollView({
        maxZoomScale: 2.0
      });
      this.imageView = Ti.UI.createImageView({
        image: "Location-Image1.png",
        width: Ti.UI.FILL,
        height: Ti.UI.FILL
      });
      this.view.add(this.imageView);
    }

    LocationScreen.prototype.relayout = function() {
      this.imageView.width = this.view.width;
      return this.imageView.height = this.view.height;
    };

    LocationScreen.prototype.init = function() {
      return this;
    };

    LocationScreen.prototype.play = function() {};

    return LocationScreen;

  })();

  module.exports = LocationScreen;

}).call(this);