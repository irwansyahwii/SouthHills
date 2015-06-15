// Generated by CoffeeScript 1.9.2
(function() {
  var DayViewScreen, NorthViewScreen, SCREEN_HEIGHT,
    bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  DayViewScreen = require("/ui/common/DayViewScreen");

  SCREEN_HEIGHT = 768;

  NorthViewScreen = (function() {
    function NorthViewScreen(view_name) {
      this.relayout = bind(this.relayout, this);
      this.play = bind(this.play, this);
      this.init = bind(this.init, this);
      this.addClickEventToButton = bind(this.addClickEventToButton, this);
      this.assignToCurrentSubscreen = bind(this.assignToCurrentSubscreen, this);
      this.getSubscreenHeight = bind(this.getSubscreenHeight, this);
      this.view = Ti.UI.createImageView({
        image: view_name + "-Background.png",
        width: 2048 / 2,
        height: 1296 / 2
      });
      this.buttonNight = Ti.UI.createButton({
        backgroundImage: view_name + "-ButtonNight.png",
        width: 1874 / 2,
        height: 474 / 2,
        left: 92 / 2,
        top: 732 / 2,
        button_id: 0
      });
      this.view.add(this.buttonNight);
      this.buttonDay = Ti.UI.createButton({
        backgroundImage: view_name + "-ButtonDay.png",
        width: 1874 / 2,
        height: 474 / 2,
        left: 92 / 2,
        top: 138 / 2,
        button_id: 1
      });
      this.view.add(this.buttonDay);
      this.view_name = view_name;
      this.subScreen = null;
    }

    NorthViewScreen.prototype.getSubscreenHeight = function() {
      return this.view.height;
    };

    NorthViewScreen.prototype.assignToCurrentSubscreen = function(newSubScreen) {
      if (this.subScreen !== null) {
        this.subScreen.view.getParent().remove(this.subScreen.view);
        this.subScreen = null;
      }
      newSubScreen.view.top = 0;
      newSubScreen.view.height = this.getSubscreenHeight();
      newSubScreen.view.width = this.view.width;
      newSubScreen.relayout();
      newSubScreen.play();
      return this.view.add(newSubScreen);
    };

    NorthViewScreen.prototype.addClickEventToButton = function(button) {
      var imageName;
      imageName = "";
      return button.addEventListener("click", (function(_this) {
        return function() {
          var dayViewScreen, height, width;
          if (button.button_id === 0) {
            imageName = _this.view_name + "-Night";
          }
          if (button.button_id === 1) {
            imageName = _this.view_name + "-Day";
          }
          width = 0;
          height = 0;
          if (imageName === "NorthView-Day") {
            width = 2768;
            height = 1307;
          }
          if (imageName === "NorthView-Night") {
            width = 3570;
            height = 1312;
          }
          if (imageName === "SouthView-Day") {
            width = 2962;
            height = 1305;
          }
          if (imageName === "SouthView-Night") {
            width = 2780;
            height = 1312;
          }
          dayViewScreen = new DayViewScreen(imageName, width, height).init();
          return _this.assignToCurrentSubscreen(dayViewScreen);
        };
      })(this));
    };

    NorthViewScreen.prototype.init = function() {
      this.addClickEventToButton(this.buttonNight);
      this.addClickEventToButton(this.buttonDay);
      return this;
    };

    NorthViewScreen.prototype.play = function() {};

    NorthViewScreen.prototype.relayout = function() {};

    return NorthViewScreen;

  })();

  module.exports = NorthViewScreen;

}).call(this);
