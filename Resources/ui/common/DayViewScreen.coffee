class DayViewScreen
    constructor: (image_name, width, height) ->
        @view = Ti.UI.createScrollView
            backgroundColor: "#ede0c8"
            maxZoomScale: 2.0
            # contentWidth: width/2
            # contentHeight: height/2



        @fullscreenView = Ti.UI.createImageView
            image: "#{image_name}-Fullscreen.png"
            width: width/2
            height: height/2
            left: 0
            top: 0
        @view.add @fullscreenView

    init: () =>
        @
    play: () =>

    relayout: ()=>

module.exports = DayViewScreen