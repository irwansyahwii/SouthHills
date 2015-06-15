// Generated by CoffeeScript 1.9.2
(function() {
  var BUTTON_HEIGHT, BUTTON_POS_Y, BUTTON_WIDTH, FloorplanScreen, SCREEN_HEIGHT, SitePlanScreen,
    bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  SitePlanScreen = require("/ui/common/SitePlanScreen");

  BUTTON_WIDTH = 286;

  BUTTON_HEIGHT = 69;

  BUTTON_POS_Y = 66;

  SCREEN_HEIGHT = 768;

  FloorplanScreen = (function() {
    function FloorplanScreen() {
      this.relayout = bind(this.relayout, this);
      this.play = bind(this.play, this);
      this.init = bind(this.init, this);
      this.addClickEventToButton = bind(this.addClickEventToButton, this);
      this.showSitePlanScreen = bind(this.showSitePlanScreen, this);
      this.assignToCurrentSubscreen = bind(this.assignToCurrentSubscreen, this);
      this.getSubscreenHeight = bind(this.getSubscreenHeight, this);
      this.view = Ti.UI.createView();
      this.toolbar = Ti.UI.createImageView({
        image: "SitePlan-Toolbar.png",
        height: 138 / 2,
        width: 2048 / 2,
        left: 0,
        top: 0
      });
      this.view.add(this.toolbar);
      this.buttonSitePlan = Ti.UI.createButton({
        backgroundImage: 'SitePlan-ButtonSitePlan.png',
        width: BUTTON_WIDTH / 2,
        height: BUTTON_HEIGHT / 2,
        button_id: 0,
        left: 59 / 2,
        top: BUTTON_POS_Y / 2
      });
      this.toolbar.add(this.buttonSitePlan);
      this.buttonLowZone = Ti.UI.createButton({
        backgroundImage: 'SitePlan-ButtonLowZone.png',
        width: BUTTON_WIDTH / 2,
        height: BUTTON_HEIGHT / 2,
        button_id: 1,
        left: 446 / 2,
        top: BUTTON_POS_Y / 2
      });
      this.toolbar.add(this.buttonLowZone);
      this.buttonHighZone = Ti.UI.createButton({
        backgroundImage: 'SitePlan-ButtonHighZone.png',
        width: BUTTON_WIDTH / 2,
        height: BUTTON_HEIGHT / 2,
        button_id: 2,
        left: 851 / 2,
        top: BUTTON_POS_Y / 2
      });
      this.toolbar.add(this.buttonHighZone);
      this.buttonNorthView = Ti.UI.createButton({
        backgroundImage: 'SitePlan-ButtonNorthView.png',
        width: BUTTON_WIDTH / 2,
        height: BUTTON_HEIGHT / 2,
        button_id: 2,
        left: 1256 / 2,
        top: BUTTON_POS_Y / 2
      });
      this.toolbar.add(this.buttonNorthView);
      this.buttonSouthView = Ti.UI.createButton({
        backgroundImage: 'SitePlan-ButtonSouthView.png',
        width: BUTTON_WIDTH / 2,
        height: BUTTON_HEIGHT / 2,
        button_id: 3,
        left: 1655 / 2,
        top: BUTTON_POS_Y / 2
      });
      this.toolbar.add(this.buttonSouthView);
      this.subScreen = null;
    }

    FloorplanScreen.prototype.getSubscreenHeight = function() {
      return SCREEN_HEIGHT - this.toolbar.height;
    };

    FloorplanScreen.prototype.assignToCurrentSubscreen = function(newSubScreen) {
      if (this.subScreen !== null) {
        this.subScreen.view.getParent().remove(this.subScreen.view);
        this.subScreen = null;
      }
      newSubScreen.view.top = this.toolbar.height;
      newSubScreen.view.height = this.getSubscreenHeight();
      newSubScreen.view.width = this.view.width;
      newSubScreen.relayout();
      newSubScreen.play();
      return this.view.add(newSubScreen);
    };

    FloorplanScreen.prototype.showSitePlanScreen = function() {};

    FloorplanScreen.prototype.addClickEventToButton = function(button) {
      return button.addEventListener("click", (function(_this) {
        return function() {
          var sitePlanScreen;
          if (button.button_id === 0) {
            sitePlanScreen = new SitePlanScreen().init();
            return _this.assignToCurrentSubscreen(sitePlanScreen);
          }
        };
      })(this));
    };

    FloorplanScreen.prototype.init = function() {
      this.addClickEventToButton(this.buttonSitePlan);
      this.addClickEventToButton(this.buttonHighZone);
      this.addClickEventToButton(this.buttonLowZone);
      this.addClickEventToButton(this.buttonSouthView);
      this.addClickEventToButton(this.buttonNorthView);
      return this;
    };

    FloorplanScreen.prototype.play = function() {};

    FloorplanScreen.prototype.relayout = function() {};

    return FloorplanScreen;

  })();

  module.exports = FloorplanScreen;

}).call(this);