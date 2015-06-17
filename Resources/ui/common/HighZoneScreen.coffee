class HighZoneScreen
    constructor:() ->
        @view = Ti.UI.createView()

        @toolbarView = Ti.UI.createImageView
            image: "HighZone-Toolbar.png"
            width: 2048/2
            height: 61/2
            top: 0
            left: 0

        @view.add @toolbarView

        @button1Bedroom = Ti.UI.createButton
            backgroundImage: "HighZone-Button1Bedroom.png"
            width: 226/2
            height: 61/2
            left: 71/2
            top: 0
        @toolbarView.add @button1Bedroom

        @button2Bedroom = Ti.UI.createButton
            backgroundImage: "HighZone-Button2Bedroom.png"
            width: 226/2
            height: 61/2
            left: 458/2
            top: 0
        @toolbarView.add @button2Bedroom

        @button3Bedroom = Ti.UI.createButton
            backgroundImage: "HighZone-Button3Bedroom.png"
            width: 226/2
            height: 61/2
            left: 845/2
            top: 0
        @toolbarView.add @button3Bedroom

        @buttonSplitUnit = Ti.UI.createButton
            backgroundImage: "HighZone-ButtonSplitUnit.png"
            width: 226/2
            height: 61/2
            left: 1727/2
            top: 0
        @toolbarView.add @buttonSplitUnit

        @button3BedroomStudy = Ti.UI.createButton
            backgroundImage: "HighZone-Button3BedroomStudy.png"
            width: 361/2
            height: 61/2
            left: 1229/2
            top: 0
        @toolbarView.add @button3BedroomStudy

        @scrollView = Ti.UI.createScrollableView
            left: 0
            top: @toolbarView.top + @toolbarView.height




    init: () =>
        @

    play: () =>

    relayout: () =>
        @scrollView.top = @toolbarView.top + @toolbarView.height
        @scrollView.width = @view.width
        @scrollView.height = @view.height - @toolbarView.height

module.exports = HighZoneScreen