SCREEN_WIDTH = 1024
SCREEN_HEIGHT = 768

class About1
    constructor: () ->
        @view = Ti.UI.createScrollView
            maxZoomScale: 2.0
            width: Ti.UI.FILL
            height: Ti.UI.FILL
        @view.controller = @

        @container = Ti.UI.createView
            width: SCREEN_WIDTH
            height: 1435/2
            backgroundColor: "white"

        @view.add @container

        @backgroundImage = Ti.UI.createImageView
            image: "About1-Image.png"
            width: 2048/2
            height: 1435/2
            scale: 0.5
        @container.add @backgroundImage

        @captionImage = Ti.UI.createImageView
            image: "About1-Caption.png"
            width: 536/2
            height: 74/2
            scale: 0.5
        @container.add @captionImage

        @text1Image = Ti.UI.createImageView
            image: "About1-Text1.png"
            width: 295/2
            height: 148/2
            scale: 0.5
        @container.add @text1Image

        @text2Image = Ti.UI.createImageView
            image: "About1-Text2.png"
            width: 298/2
            height: 127/2
            scale: 0.5
        @container.add @text2Image



    reset: () =>

        @captionImage.left = -@captionImage.width
        @captionImage.top = 440/2

        @text1Image.left = 371/2
        @text1Image.top = SCREEN_HEIGHT + @text1Image.height

        @text2Image.left = 371/2
        @text2Image.top = SCREEN_HEIGHT + @text1Image.height

    animateInText2Image: () =>
        @text2Image.animate
            top: 877/2
            duration: 200

    animateInText1Image: () =>
        @text1Image.animate
            top : 671/2
            duration: 200
            , @animateInText2Image

    animateInCaptionImage:() =>
        @captionImage.animate
            left: 401/2
            duration: 200
            , @animateInText1Image

    init: () =>

        @reset()        

        @

    play: () =>
        @reset()
        @animateInCaptionImage()

module.exports = About1