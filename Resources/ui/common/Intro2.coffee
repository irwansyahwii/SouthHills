class Intro2
    constructor: () ->
        @view = Ti.UI.createView()

        @backgroundImage = Ti.UI.createImageView
            image:'Intro2-Background.png'
            width: 1024
            height: 768

        @view.add @backgroundImage

        @text1Image = Ti.UI.createImageView
            image:'Intro2-Text1.png'
            width: 1327/2
            height: 525/2
            opacity: 0

        @text1Image.left = @backgroundImage.width / 2 - @text1Image.width / 2
        @text1Image.top = @backgroundImage.height / 2 - @text1Image.height / 2

        @view.add @text1Image


        @onPlayEnds = null

        # @view.play = @play


        # return @view

    reset: () =>
        @text1Image.opacity = 0

    raiseOnPlayEnds: ()=>
        if @onPlayEnds isnt null
            @onPlayEnds()

    fadeOutMainView: ()=>
        setTimeout =>
                @view.animate
                    curve: Ti.UI.ANIMATION_CURVE_EASE_OUT
                    opacity: .0
                    duration: 1000
                    , =>
                        @raiseOnPlayEnds()
            , 3000


    fadeInMainView: ()=>
        @view.animate
            curve: Ti.UI.ANIMATION_CURVE_EASE_OUT
            opacity: 1.0
            duration: 2000
            , =>
                @fadeInText1()

    fadeInText1: () =>
        @text1Image.animate
            curve: Ti.UI.ANIMATION_CURVE_EASE_IN
            opacity: 1.0
            duration: 2000
            , @fadeOutMainView

    show: () =>
        @view.opacity = 1.0
        @view.visible = true

    play: () =>
        @reset()
        @show()
        @fadeInMainView()



module.exports = Intro2