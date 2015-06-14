class GalleryScreen
    constructor: () ->
        @view = Ti.UI.createView()

        @view.addEventListener "doubletap", @onMainViewDoubleTapped


        @large_scroll_view = Ti.UI.createScrollableView()
            

        @images = []
        @large_images = []
        @thumb_images = []

        @thumb_scroll_view = Ti.UI.createScrollView            
            height: 268/2
            contentWidth: "auto"
            contentHeight: "auto"

        for i in [1..10]
            imgInfo = 
                large_image:  Ti.UI.createImageView
                    image: "Gallery-Image#{i}.png"

                thumb_image: Ti.UI.createImageView
                    image: "Gallery-Thumb#{i}.png"
                    width: 223/2
                    height: 223/2
            @images.push imgInfo
            @large_images.push imgInfo.large_image

            thumb_image_wrapper = Ti.UI.createView
                width: imgInfo.thumb_image.width + 30
                height: imgInfo.thumb_image.height + 10
                left: (i-1) * (imgInfo.thumb_image.width + 30/2)
                top: 0

            thumb_image_wrapper.add imgInfo.thumb_image

            @thumb_scroll_view.add thumb_image_wrapper

            @thumb_images.push thumb_image_wrapper

        @large_scroll_view.views = @large_images

        @thumb_scroll_view.height = @thumb_images[0].height

        @view.add @large_scroll_view
        @view.add @thumb_scroll_view

        @large_scroll_view.left = 0
        @large_scroll_view.top = 0
        @thumb_scroll_view.left = 0

        @onDoubleTapped = null

    raiseOnDoubleTapped: () =>
        if @onDoubleTapped isnt null
            eventInfo = 
                event_type: "GALLERY"                
                event_data:
                    pos: 
                        left: @large_scroll_view.left
                        top: @large_scroll_view.top
                    height: @large_scroll_view.height
                    width: @large_scroll_view.width

                    current_image_index: @large_scroll_view.currentPage

            @onDoubleTapped(eventInfo)

    onMainViewDoubleTapped: () =>
        @raiseOnDoubleTapped()

    relayout: () =>
        @large_scroll_view.height = @view.height - @thumb_scroll_view.height
        @thumb_scroll_view.top = @large_scroll_view.top + @large_scroll_view.height

    init: () =>

        @

    play: () =>


module.exports = GalleryScreen