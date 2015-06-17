class RoomScreen
    constructor: (options) ->
        @view = Ti.UI.createView()

        options.dayViewRow1 = options.dayViewRow1 || {}
        options.dayViewRow2 = options.dayViewRow2 || {}

        @dayViewRow1 = 
            visible: options.dayViewRow1.visible || false
            is_southview: options.dayViewRow1.is_southview || false

        @dayViewRow2 = 
            visible: options.dayViewRow2.visible || false
            is_southview: options.dayViewRow2.is_southview || false

        @scrollView = Ti.UI.createScrollableView()
        @view.add @scrollView

        @imageNames = options.imageNames || []

        @roomViews = []
        for imageName in @imageNames            
            roomView = Ti.UI.createView()
            wrapperScroll = Ti.UI.createScrollView
                maxZoomScale: 2.0
            imageView = Ti.UI.createImageView
                image: imageName
                width: 2048/2
                height: 1232/2

            wrapperScroll.add imageView

            roomView.add wrapperScroll

            @roomViews.push roomView

        @scrollView.views = @roomViews



    init: () =>
        @

    play: () =>

    relayout: () =>

module.exports = RoomScreen