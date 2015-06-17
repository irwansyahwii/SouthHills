// Generated by CoffeeScript 1.9.2
(function() {
  var HighZoneScreen,
    bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  HighZoneScreen = (function() {
    function HighZoneScreen() {
      this.relayout = bind(this.relayout, this);
      this.play = bind(this.play, this);
      this.init = bind(this.init, this);
      this.view = Ti.UI.createView();
      this.toolbarView = Ti.UI.createImageView({
        image: "HighZone-Toolbar.png",
        width: 2048 / 2,
        height: 61 / 2,
        top: 0,
        left: 0
      });
      this.view.add(this.toolbarView);
      this.button1Bedroom = Ti.UI.createButton({
        backgroundImage: "HighZone-Button1Bedroom.png",
        width: 226 / 2,
        height: 61 / 2,
        left: 71 / 2,
        top: 0
      });
      this.toolbarView.add(this.button1Bedroom);
      this.button2Bedroom = Ti.UI.createButton({
        backgroundImage: "HighZone-Button2Bedroom.png",
        width: 226 / 2,
        height: 61 / 2,
        left: 458 / 2,
        top: 0
      });
      this.toolbarView.add(this.button2Bedroom);
      this.button3Bedroom = Ti.UI.createButton({
        backgroundImage: "HighZone-Button3Bedroom.png",
        width: 226 / 2,
        height: 61 / 2,
        left: 845 / 2,
        top: 0
      });
      this.toolbarView.add(this.button3Bedroom);
      this.buttonSplitUnit = Ti.UI.createButton({
        backgroundImage: "HighZone-ButtonSplitUnit.png",
        width: 226 / 2,
        height: 61 / 2,
        left: 1727 / 2,
        top: 0
      });
      this.toolbarView.add(this.buttonSplitUnit);
      this.button3BedroomStudy = Ti.UI.createButton({
        backgroundImage: "HighZone-Button3BedroomStudy.png",
        width: 361 / 2,
        height: 61 / 2,
        left: 1229 / 2,
        top: 0
      });
      this.toolbarView.add(this.button3BedroomStudy);
      this.scrollView = Ti.UI.createScrollableView({
        left: 0,
        top: this.toolbarView.top + this.toolbarView.height
      });
    }

    HighZoneScreen.prototype.init = function() {
      return this;
    };

    HighZoneScreen.prototype.play = function() {};

    HighZoneScreen.prototype.relayout = function() {
      this.scrollView.top = this.toolbarView.top + this.toolbarView.height;
      this.scrollView.width = this.view.width;
      return this.scrollView.height = this.view.height - this.toolbarView.height;
    };

    return HighZoneScreen;

  })();

  module.exports = HighZoneScreen;

}).call(this);