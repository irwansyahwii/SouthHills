class LocationScreen
    constructor: () ->
        @view = Ti.UI.createScrollView
            maxZoomScale: 2.0

        @imageView = Ti.UI.createImageView
            image: "Location-Image1.png"
            width: Ti.UI.FILL
            height: Ti.UI.FILL

        @view.add @imageView


    relayout: () =>
        @imageView.width = @view.width
        @imageView.height = @view.height

    init: () =>
        @

    play: () =>

module.exports = LocationScreen