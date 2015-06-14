ANIMATION_DURATION = 200

SCREEN_WIDTH = 1024
SCREEN_HEIGHT = 768

class MainMenuScreen
    constructor: () ->
        @view = Ti.UI.createView()        

        @buttonSouthHills = Ti.UI.createButton
            backgroundImage: 'MainMenu-SouthHills.png'
            width: 1025/2
            height: 900/2

        @view.add @buttonSouthHills

        @buttonGallery = Ti.UI.createButton
            backgroundImage: 'MainMenu-Gallery.png'
            width: 1025/2
            height: 633/2

        @view.add @buttonGallery

        @buttonLocation = Ti.UI.createButton
            backgroundImage: 'MainMenu-Location.png'
            width: 1025/2
            height: 633/2

        @view.add @buttonLocation

        @buttonFloorplan = Ti.UI.createButton
            backgroundImage: 'MainMenu-Floorplan.png'
            width: 1025/2
            height: 903/2

        @view.add @buttonFloorplan

        @onButtonClicked = null

        

    init: () =>
        @buttonSouthHills.left = 0
        @buttonSouthHills.top = - @buttonSouthHills.height 
        @buttonSouthHills.addEventListener "click", @menuButtonClicked
        @buttonSouthHills.button_id = 0

        @buttonGallery.left = SCREEN_WIDTH + @buttonGallery.width
        @buttonGallery.top = 0
        @buttonGallery.addEventListener "click", @menuButtonClicked
        @buttonGallery.button_id = 1

        @buttonLocation.left = -@buttonLocation.width
        @buttonLocation.top = @buttonSouthHills.height
        @buttonLocation.addEventListener "click", @menuButtonClicked
        @buttonLocation.button_id = 2

        @buttonFloorplan.left = @buttonSouthHills.width - 1
        @buttonFloorplan.top = SCREEN_HEIGHT
        @buttonFloorplan.addEventListener "click", @menuButtonClicked
        @buttonFloorplan.button_id = 3

        @

    menuButtonClicked:(e) =>
        @animateOutSHAndFloorplan()
        # @animateOutLocationAndGallery()
        setTimeout =>
                if @onButtonClicked isnt null
                    @onButtonClicked(e.source.button_id)
            , ANIMATION_DURATION*2

    animateOutLocationAndGallery:() =>
        @buttonLocation.animate
            left: -@buttonLocation.width
            duration: ANIMATION_DURATION

        @buttonGallery.animate
            left: SCREEN_WIDTH + @buttonGallery.width
            duration:ANIMATION_DURATION

    animateInLocationAndGallery:() =>
        @buttonLocation.animate
            left: 0
            duration: ANIMATION_DURATION

        @buttonGallery.animate
            left: @buttonSouthHills.width - 1
            duration:ANIMATION_DURATION

    animateInSHAndFloorplan: () =>
        @buttonSouthHills.animate
            top: 1
            duration: ANIMATION_DURATION
            , =>
                @animateInLocationAndGallery()

        @buttonFloorplan.animate
            top: @buttonGallery.height - 1
            duration: ANIMATION_DURATION

    animateOutSHAndFloorplan: () =>
        @buttonSouthHills.animate
            top: - @buttonSouthHills.height 
            duration: ANIMATION_DURATION
            , =>
                @animateOutLocationAndGallery()

        @buttonFloorplan.animate
            top: SCREEN_HEIGHT
            duration: ANIMATION_DURATION
    play: () =>
        @animateInSHAndFloorplan()


module.exports = MainMenuScreen