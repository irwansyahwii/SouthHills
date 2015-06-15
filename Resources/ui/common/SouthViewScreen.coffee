class SouthViewScreen
    constructor: () ->
        @view = Ti.UI.createImageView
            image: "SouthView-Background.png"
            width: 2048/2
            height: 1296/2

        @buttonNight = Ti.UI.createButton
            backgroundImage: "SouthView-ButtonNight.png"
            width: 1874/2
            height: 474/2
            left: 92/2
            top: 732/2
        @view.add @buttonNight

        @buttonDay = Ti.UI.createButton
            backgroundImage: "SouthView-ButtonDay.png"
            width: 1874/2
            height: 474/2
            left: 92/2
            top: 138/2
        @view.add @buttonDay

    init: () =>
        @

    play: () =>

    relayout: () =>


module.exports = SouthViewScreen