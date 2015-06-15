DayViewScreen = require("/ui/common/DayViewScreen")

SCREEN_HEIGHT = 768

class NorthViewScreen
    constructor: (view_name) ->
        @view = Ti.UI.createImageView
            image: "#{view_name}-Background.png"
            width: 2048/2
            height: 1296/2

        @buttonNight = Ti.UI.createButton
            backgroundImage: "#{view_name}-ButtonNight.png"
            width: 1874/2
            height: 474/2
            left: 92/2
            top: 732/2
            button_id: 0
        @view.add @buttonNight

        @buttonDay = Ti.UI.createButton
            backgroundImage: "#{view_name}-ButtonDay.png"
            width: 1874/2
            height: 474/2
            left: 92/2
            top: 138/2
            button_id: 1
        @view.add @buttonDay

        @view_name = view_name
        @subScreen = null

    getSubscreenHeight: () =>
        @view.height

    assignToCurrentSubscreen: (newSubScreen) =>
        if @subScreen isnt null
            @subScreen.view.getParent().remove(@subScreen.view)
            @subScreen = null

        newSubScreen.view.top = 0
        newSubScreen.view.height = @getSubscreenHeight()
        newSubScreen.view.width  = @view.width
        newSubScreen.relayout()
        newSubScreen.play()

        # @subScreen = newSubScreen
        @view.add newSubScreen


    addClickEventToButton:(button) =>
        imageName = ""
        button.addEventListener "click", =>
            if button.button_id is 0
                imageName = "#{@view_name}-Night"
            if button.button_id is 1
                imageName = "#{@view_name}-Day"

            width= 0
            height = 0
            if imageName is "NorthView-Day"
                width = 2768
                height = 1307
            if imageName is "NorthView-Night"
                width = 3570
                height = 1312
            if imageName is "SouthView-Day"
                width = 2962
                height = 1305
            if imageName is "SouthView-Night"
                width = 2780
                height = 1312

            dayViewScreen = new DayViewScreen(imageName, width, height).init()
            @assignToCurrentSubscreen dayViewScreen



    init: () =>
        @addClickEventToButton @buttonNight
        @addClickEventToButton @buttonDay

        @

    play: () =>

    relayout: () =>

module.exports = NorthViewScreen