RoomScreen = require("/ui/common/RoomScreen")

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
            button_id: 0
        @toolbarView.add @button1Bedroom

        @button2Bedroom = Ti.UI.createButton
            backgroundImage: "HighZone-Button2Bedroom.png"
            width: 226/2
            height: 61/2
            left: 458/2
            top: 0
            button_id: 1
        @toolbarView.add @button2Bedroom

        @button3Bedroom = Ti.UI.createButton
            backgroundImage: "HighZone-Button3Bedroom.png"
            width: 226/2
            height: 61/2
            left: 845/2
            top: 0
            button_id: 2
        @toolbarView.add @button3Bedroom

        @buttonSplitUnit = Ti.UI.createButton
            backgroundImage: "HighZone-ButtonSplitUnit.png"
            width: 226/2
            height: 61/2
            left: 1727/2
            top: 0
            button_id: 3
        @toolbarView.add @buttonSplitUnit

        @button3BedroomStudy = Ti.UI.createButton
            backgroundImage: "HighZone-Button3BedroomStudy.png"
            width: 361/2
            height: 61/2
            left: 1229/2
            top: 0
            button_id: 4
        @toolbarView.add @button3BedroomStudy

        @scrollView = Ti.UI.createScrollableView
            left: 0
            top: @toolbarView.top + @toolbarView.height

        @subScreen = null

    getSubscreenHeight: () =>
        @view.height - @toolbarView.height

    assignToCurrentSubscreen: (newSubScreen) =>
        if @subScreen isnt null
            @subScreen.view.getParent().remove(@subScreen.view)
            @subScreen = null

        newSubScreen.view.top = @toolbarView.height
        newSubScreen.view.height = @getSubscreenHeight()
        newSubScreen.view.width  = @view.width
        newSubScreen.relayout()
        newSubScreen.play()

        @subScreen = newSubScreen
        @view.add newSubScreen

    show1BedroomScreen: () =>
        options = 
            dayViewRow1:
                visible: true
                is_southview: false

            imageNames: [
                "HighZone-1Bedroom-QL.png"
                "HighZone-1Bedroom-QPONML-1.png"
                "HighZone-1Bedroom-QPONML-2.png"
            ]
        roomScreen = new RoomScreen(options).init()

        @assignToCurrentSubscreen roomScreen

    addClickEvent:(button)=>
        button.addEventListener "click", =>
            if button.button_id is 0
                @show1BedroomScreen()


    init: () =>

        @addClickEvent @button1Bedroom
        @addClickEvent @button2Bedroom
        @addClickEvent @button3Bedroom
        @addClickEvent @button3BedroomStudy
        @addClickEvent @buttonSplitUnit

        @

    play: () =>

    relayout: () =>
        @scrollView.top = @toolbarView.top + @toolbarView.height
        @scrollView.width = @view.width
        @scrollView.height = @view.height - @toolbarView.height

module.exports = HighZoneScreen