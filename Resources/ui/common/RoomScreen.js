// Generated by CoffeeScript 1.9.2
(function() {
  var RoomScreen, RoomViewButton,
    bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  RoomViewButton = require("/ui/common/RoomViewButton");

  RoomScreen = (function() {
    function RoomScreen(options) {
      this.relayout = bind(this.relayout, this);
      this.play = bind(this.play, this);
      this.init = bind(this.init, this);
      this.raiseOnButtonClicked = bind(this.raiseOnButtonClicked, this);
      var i, imageInfo, imageView, len, ref, roomView, roomViewButton, wrapperScroll;
      this.view = Ti.UI.createView();
      this.scrollView = Ti.UI.createScrollableView();
      this.view.add(this.scrollView);
      this.imageInfos = options.imageInfos || [];
      this.onButtonClicked = null;
      this.roomViews = [];
      ref = this.imageInfos;
      for (i = 0, len = ref.length; i < len; i++) {
        imageInfo = ref[i];
        roomView = Ti.UI.createView();
        wrapperScroll = Ti.UI.createScrollView({
          maxZoomScale: 2.0
        });
        imageView = Ti.UI.createImageView({
          image: imageInfo.imageName,
          width: 2048 / 2,
          height: 1232 / 2
        });
        imageInfo.dayViewRow1 = imageInfo.dayViewRow1 || {
          visible: false,
          is_southview: false
        };
        imageInfo.dayViewRow2 = imageInfo.dayViewRow2 || {
          visible: false,
          is_southview: false
        };
        wrapperScroll.add(imageView);
        roomView.add(wrapperScroll);
        if (imageInfo.dayViewRow1.visible) {
          roomViewButton = new RoomViewButton(imageInfo.dayViewRow1).init();
          roomViewButton.view.left = 68 / 2;
          roomViewButton.view.top = 1018 / 2;
          roomViewButton.onButtonClicked = this.raiseOnButtonClicked;
          roomView.add(roomViewButton.view);
        }
        if (imageInfo.dayViewRow2.visible) {
          roomViewButton = new RoomViewButton(imageInfo.dayViewRow2).init();
          roomViewButton.view.left = 68 / 2;
          roomViewButton.view.top = 783 / 2;
          roomViewButton.onButtonClicked = this.raiseOnButtonClicked;
          roomView.add(roomViewButton.view);
        }
        this.roomViews.push(roomView);
      }
      this.scrollView.views = this.roomViews;
    }

    RoomScreen.prototype.raiseOnButtonClicked = function(e) {
      if (this.onButtonClicked !== null) {
        return this.onButtonClicked(e);
      }
    };

    RoomScreen.prototype.init = function() {
      return this;
    };

    RoomScreen.prototype.play = function() {};

    RoomScreen.prototype.relayout = function() {};

    return RoomScreen;

  })();

  module.exports = RoomScreen;

}).call(this);
