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

        @view.add @buttonDay

        @buttonDay = Ti.UI.createButton
            backgroundImage: night_image
            width: 226/2
            height: 147/2
            left: 254/2
            top: 31/2

        @view.add @buttonDay

    init: () =>
        @

    play: () =>

    relayout: () =>
    

module.exports = RoomViewButton