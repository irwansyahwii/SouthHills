class SitePlanScreen
    constructor: () ->
        @view = Ti.UI.createScrollView
            maxZoomScale: 2.0

        @backgroundImage = Ti.UI.createImageView
            image: "SitePlan-SitePlanView.png"
            width: 2048/2
            height: 1296/2
            left: 0
            top: 0

        @view.add @backgroundImage

    init: () =>
        @

    play: () =>

    relayout: () =>

module.exports = SitePlanScreen