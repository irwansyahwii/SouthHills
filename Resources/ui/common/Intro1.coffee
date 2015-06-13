class Intro1
    constructor: () ->
        @view = Ti.UI.createView()

        @backgroundImage = Ti.UI.createImageView
            image:'Intro1-Background.png'
            width: 1024
            height: 768

        @view.add @backgroundImage

        @text1Image = Ti.UI.createImageView
            image:'Intro1-Text1.png'
            width: 713/2
            height: 100/2
            left: 329/2
            top: 789/2
            opacity: 0

        @view.add @text1Image

        @text2Image = Ti.UI.createImageView
            image:'Intro1-Text2.png'
            width: 691/2
            height: 112/2
            left: 1052/2
            top: 678/2
            opacity: 0
            

        @view.add @text2Image

        @onPlayEnds = null

        @isFirstStart = true

        # @view.play = @play


        # return @view

    raiseOnPlayEnds: ()=>
        console.log "raiseOnPlayEnds called"
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

    fadeInText2: ()=>
        @text2Image.animate
            curve: Ti.UI.ANIMATION_CURVE_EASE_IN
            opacity: 1.0
            duration: 2000
            , @fadeOutMainView


    fadeInText1: () =>
        @text1Image.animate
            curve: Ti.UI.ANIMATION_CURVE_EASE_IN
            opacity: 1.0
            duration: 2000
            , @fadeInText2

    reset: () =>
        @text1Image.opacity = 0
        @text2Image.opacity = 0

    show: () =>
        
        @view.opacity = 1.0
        @view.visible = true

    play: () =>
        @reset()
        if @isFirstStart
            @isFirstStart = false
            @show()
            @fadeInText1()
        else
            @fadeInMainView()



module.exports = Intro1