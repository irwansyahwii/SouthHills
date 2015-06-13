// Generated by CoffeeScript 1.9.2
(function() {
  var FirstView,
    bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  FirstView = (function() {
    function FirstView() {
      this.play = bind(this.play, this);
      this.fadeInText1 = bind(this.fadeInText1, this);
      this.fadeInText2 = bind(this.fadeInText2, this);
      this.fadeOutMainView = bind(this.fadeOutMainView, this);
      this.raiseOnPlayEnds = bind(this.raiseOnPlayEnds, this);
      this.view = Ti.UI.createView();
      this.backgroundImage = Ti.UI.createImageView({
        image: 'Intro1-Background.png',
        width: 1024,
        height: 768
      });
      this.view.add(this.backgroundImage);
      this.text1Image = Ti.UI.createImageView({
        image: 'Intro1-Text1.png',
        width: 713 / 2,
        height: 100 / 2,
        left: 329 / 2,
        top: 789 / 2,
        opacity: 0
      });
      this.view.add(this.text1Image);
      this.text2Image = Ti.UI.createImageView({
        image: 'Intro1-Text2.png',
        width: 691 / 2,
        height: 112 / 2,
        left: 1052 / 2,
        top: 678 / 2,
        opacity: 0
      });
      this.view.add(this.text2Image);
      this.onPlayEnds = null;
    }

    FirstView.prototype.raiseOnPlayEnds = function() {
      if (this.onPlayEnds !== null) {
        return this.onPlayEnds();
      }
    };

    FirstView.prototype.fadeOutMainView = function() {
      return setTimeout((function(_this) {
        return function() {
          return _this.view.animate({
            curve: Ti.UI.ANIMATION_CURVE_EASE_OUT,
            opacity: .0,
            duration: 1000
          }, function() {
            return _this.raiseOnPlayEnds();
          });
        };
      })(this), 1000);
    };

    FirstView.prototype.fadeInText2 = function() {
      return this.text2Image.animate({
        curve: Ti.UI.ANIMATION_CURVE_EASE_IN,
        opacity: 1.0,
        duration: 2000
      }, this.fadeOutMainView);
    };

    FirstView.prototype.fadeInText1 = function() {
      return this.text1Image.animate({
        curve: Ti.UI.ANIMATION_CURVE_EASE_IN,
        opacity: 1.0,
        duration: 2000
      }, this.fadeInText2);
    };

    FirstView.prototype.play = function() {
      return this.fadeInText1();
    };

    return FirstView;

  })();

  module.exports = FirstView;

}).call(this);
