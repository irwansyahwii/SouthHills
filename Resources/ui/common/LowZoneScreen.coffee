RoomScreen = require("/ui/common/RoomScreen")

class LowZoneScreen
    constructor:() ->
        @view = Ti.UI.createView()

        @toolbarView = Ti.UI.createImageView
            image: "LowZone-Toolbar.png"
            width: 2048/2
            height: 74/2
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
            left: 401/2
            top: 0
            button_id: 1
        @toolbarView.add @button2Bedroom

        @button3Bedroom = Ti.UI.createButton
            backgroundImage: "HighZone-Button3Bedroom.png"
            width: 226/2
            height: 61/2
            left: 752/2
            top: 0
            button_id: 2
        @toolbarView.add @button3Bedroom

        @buttonSplitUnit = Ti.UI.createButton
            backgroundImage: "LowZone-Button4BedroomStudy.png"
            width: 361/2
            height: 63/2
            left: 1571/2
            top: 0
            button_id: 3
        @toolbarView.add @buttonSplitUnit

        @button3BedroomStudy = Ti.UI.createButton
            backgroundImage: "HighZone-Button3BedroomStudy.png"
            width: 361/2
            height: 61/2
            left: 1082/2
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
            imageInfos: [
                {
                    imageName: "LowZone-1Bedroom-AJ.png"
                    dayViewRow1:
                        type: "ROW1"                        
                        visible: true
                        is_southview: true
                }                
                {
                    imageName: "LowZone-1Bedroom-BI.png"
                    dayViewRow1:
                        type: "ROW1"                        
                        visible: true
                        is_southview: true
                }        
                
            ]
        roomScreen = new RoomScreen(options).init()

        @assignToCurrentSubscreen roomScreen

    show2BedroomScreen: () =>
        options =             
            imageInfos: [
                {
                    imageName: "LowZone-2Bedroom-QLCH.png"
                    dayViewRow1:
                        type: "ROW1"                        
                        visible: true
                        is_southview: true
                    dayViewRow2:
                        type: "ROW2"                        
                        visible: true
                        is_southview: false
                }                
                {
                    imageName: "LowZone-2Bedroom-PONMDEFG.png"
                    dayViewRow1:
                        type: "ROW1"                        
                        visible: true
                        is_southview: true
                    dayViewRow2:
                        type: "ROW2"                        
                        visible: true
                        is_southview: false
                }                
            ]
        roomScreen = new RoomScreen(options).init()

        @assignToCurrentSubscreen roomScreen

    show3BedroomScreen: () =>
        options =             
            imageInfos: [
                {
                    imageName: "LowZone-3Bedroom-RK.png"
                    dayViewRow1:
                        type: "ROW1"                        
                        visible: true
                        is_southview: false
                }                
                {
                    imageName: "LowZone-3Bedroom-RK-2.png"
                    dayViewRow1:
                        type: "ROW1"                        
                        visible: true
                        is_southview: false
                }        
                {
                    imageName: "LowZone-3Bedroom-RK-3.png"
                    dayViewRow1:
                        type: "ROW1"                        
                        visible: true
                        is_southview: false
                }
                
            ]
        roomScreen = new RoomScreen(options).init()

        @assignToCurrentSubscreen roomScreen     

    show3BedroomStudyScreen: () =>
        options =             
            imageInfos: [
                {
                    imageName: "LowZone-3BedroomStudy-OPNM.png"
                    dayViewRow1:
                        type: "ROW1"                        
                        visible: true
                        is_southview: false
                }                
                {
                    imageName: "LowZone-3BedroomStudy-EF.png"
                    dayViewRow1:
                        type: "ROW1"                        
                        visible: true
                        is_southview: true
                }        
                {
                    imageName: "LowZone-3BedroomStudy-CDGH.png"
                    dayViewRow1:
                        type: "ROW1"                        
                        visible: true
                        is_southview: true
                }
                
            ]
        roomScreen = new RoomScreen(options).init()

        @assignToCurrentSubscreen roomScreen                
    addClickEvent:(button)=>
        button.addEventListener "click", =>
            if button.button_id is 0
                @show1BedroomScreen()

            if button.button_id is 1
                @show2BedroomScreen()
            if button.button_id is 2
                @show3BedroomScreen()
            if button.button_id is 4
                @show3BedroomStudyScreen()

    init: () =>

        @addClickEvent @button1Bedroom
        @addClickEvent @button2Bedroom
        @addClickEvent @button3Bedroom
        @addClickEvent @button3BedroomStudy
        @addClickEvent @buttonSplitUnit

        @

    play: () =>
        @show1BedroomScreen()

    relayout: () =>
        @scrollView.top = @toolbarView.top + @toolbarView.height
        @scrollView.width = @view.width
        @scrollView.height = @view.height - @toolbarView.height
module.exports = LowZoneScreen