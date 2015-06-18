class RoomViewButton
    constructor: (options) ->
        @view = Ti.UI.createView
            background: "red"
            width: 496/2
            height: 195/2

        @background = Ti.UI.createImageView
            image: "RoomViewButton-Background.png"
            width: 496/2
            height: 195/2
            left: 0
            top: 0

        @view.add @background

        @is_southview = options.is_southview || false

        day_image = "RoomViewButton-NorthView-Day.png"
        night_image = "RoomViewButton-NorthView-Night.png"
        if @is_southview
            day_image = "RoomViewButton-SouthView-Day.png"
            night_image = "RoomViewButton-SouthView-Night.png"


        @buttonDay = Ti.UI.createButton
            backgroundImage: day_image
            width: 226/2
            height: 147/2
            left: 16/2
            top: 31/2
            button_id: 0

        @view.add @buttonDay

        @buttonNight = Ti.UI.createButton
            backgroundImage: night_image
            width: 226/2
            height: 147/2
            left: 254/2
            top: 31/2
            button_id: 1

        @view.add @buttonNight

        @onButtonClicked = null

    addClickEvent: (button) =>
        button.addEventListener "click", =>
            eventInfo =
                button_id: button.button_id
                is_southview: @is_southview

            
            if @onButtonClicked
                @onButtonClicked(eventInfo)



    init: () =>
        @addClickEvent @buttonDay
        @addClickEvent @buttonNight


        @

    play: () =>

    relayout: () =>
    

module.exports = RoomViewButton