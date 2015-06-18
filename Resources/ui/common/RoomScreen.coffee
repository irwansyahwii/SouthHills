RoomViewButton = require("/ui/common/RoomViewButton")

class RoomScreen
    constructor: (options) ->
        @view = Ti.UI.createView()

        # options.dayViewRow1 = options.dayViewRow1 || {}
        # options.dayViewRow2 = options.dayViewRow2 || {}

        # @dayViewRow1 = 
        #     visible: options.dayViewRow1.visible || false
        #     is_southview: options.dayViewRow1.is_southview || false

        # @dayViewRow2 = 
        #     visible: options.dayViewRow2.visible || false
        #     is_southview: options.dayViewRow2.is_southview || false

        @scrollView = Ti.UI.createScrollableView()
        @view.add @scrollView

        @imageInfos = options.imageInfos || []

        console.log JSON.stringify(@imageInfos)

        @roomViews = []
        for imageInfo in @imageInfos            
            roomView = Ti.UI.createView()
            wrapperScroll = Ti.UI.createScrollView
                maxZoomScale: 2.0
            imageView = Ti.UI.createImageView
                image: imageInfo.imageName
                width: 2048/2
                height: 1232/2

            imageInfo.dayViewRow1 = imageInfo.dayViewRow1 || {visible: false, is_southview: false}
            imageInfo.dayViewRow2 = imageInfo.dayViewRow2 || {visible: false, is_southview: false}

            wrapperScroll.add imageView

            roomView.add wrapperScroll

            if imageInfo.dayViewRow1.visible                
                roomViewButton = new RoomViewButton(imageInfo.dayViewRow1).init()
                roomViewButton.view.left = 68/2
                roomViewButton.view.top = 1018/2
                roomView.add roomViewButton.view

            if imageInfo.dayViewRow2.visible                
                roomViewButton = new RoomViewButton(imageInfo.dayViewRow2).init()
                roomViewButton.view.left = 68/2
                roomViewButton.view.top = 783/2
                roomView.add roomViewButton.view

            @roomViews.push roomView

        @scrollView.views = @roomViews



    init: () =>
        @

    play: () =>

    relayout: () =>

module.exports = RoomScreen