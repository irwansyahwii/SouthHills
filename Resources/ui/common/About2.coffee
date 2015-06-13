SCREEN_HEIGHT = 768
SCREEN_WIDTH = 1024

TOPBAR_HEIGHT = 102/2

class About2
    constructor: () ->
        @view = Ti.UI.createScrollView
            maxZoomScale: 2.0
        @view.controller = @

        @container = Ti.UI.createView
            width: SCREEN_WIDTH
            backgroundColor: "white"

        @view.add @container

        @backgroundImage = Ti.UI.createImageView
            image: "About2-image.png"
            width: 2048/2
            height: 1435/2
            scale: 0.5
        @container.add @backgroundImage

        @captionImage = Ti.UI.createImageView
            image: "About2-Caption.png"
            width: 226/2
            height: 61/2
            scale: 0.5
        @container.add @captionImage

        @text1Image = Ti.UI.createImageView
            image: "About2-Text1.png"
            width: 218/2
            height: 227/2
            scale: 0.5
        @container.add @text1Image



    reset: () =>

        @captionImage.left = -@captionImage.width
        @captionImage.top = 1296/2 - TOPBAR_HEIGHT

        @text1Image.left = SCREEN_WIDTH + 5
        @text1Image.top = 1134/2 - TOPBAR_HEIGHT


    animateInText1Image: () =>
        @text1Image.animate
            left : 1685/2
            duration: 200
            

    animateInCaptionImage:() =>
        @captionImage.animate
            left: 1406/2 
            duration: 200
            , @animateInText1Image

    init: () =>

        @reset()        

        @

    play: () =>
        @reset()
        @animateInCaptionImage()

module.exports = About2