SitePlanScreen = require("/ui/common/SitePlanScreen")
NorthViewScreen = require("/ui/common/NorthViewScreen")
HighZoneScreen = require("/ui/common/HighZoneScreen")
LowZoneScreen = require("/ui/common/LowZoneScreen")
DayViewScreen = require("/ui/common/DayViewScreen")


BUTTON_WIDTH = 286
BUTTON_HEIGHT = 69
BUTTON_POS_Y = 66

SCREEN_HEIGHT = 768

class FloorplanScreen
    constructor: () ->
        @view = Ti.UI.createView()

        @toolbar = Ti.UI.createImageView
            image: "SitePlan-Toolbar.png"
            height:138/2
            width: 2048/2
            left: 0
            top: 0

        @view.add @toolbar

        @buttonSitePlan = Ti.UI.createButton
            backgroundImage: 'SitePlan-ButtonSitePlan.png'
            width: BUTTON_WIDTH/2
            height: BUTTON_HEIGHT/2
            button_id: 0
            left: 59/2
            top: BUTTON_POS_Y/2
        @toolbar.add @buttonSitePlan

        @buttonLowZone = Ti.UI.createButton
            backgroundImage: 'SitePlan-ButtonLowZone.png'
            width: BUTTON_WIDTH/2
            height: BUTTON_HEIGHT/2
            button_id: 1
            left: 446/2
            top: BUTTON_POS_Y/2
        @toolbar.add @buttonLowZone

        @buttonHighZone = Ti.UI.createButton
            backgroundImage: 'SitePlan-ButtonHighZone.png'
            width: BUTTON_WIDTH/2
            height: BUTTON_HEIGHT/2
            button_id: 2
            left: 851/2
            top: BUTTON_POS_Y/2
        @toolbar.add @buttonHighZone

        @buttonNorthView = Ti.UI.createButton
            backgroundImage: 'SitePlan-ButtonNorthView.png'
            width: BUTTON_WIDTH/2
            height: BUTTON_HEIGHT/2
            button_id: 3
            left: 1256/2
            top: BUTTON_POS_Y/2
        @toolbar.add @buttonNorthView

        @buttonSouthView = Ti.UI.createButton
            backgroundImage: 'SitePlan-ButtonSouthView.png'
            width: BUTTON_WIDTH/2
            height: BUTTON_HEIGHT/2
            button_id: 4
            left: 1655/2
            top: BUTTON_POS_Y/2
        @toolbar.add @buttonSouthView

        @subScreen = null

    getSubscreenHeight: () =>
        SCREEN_HEIGHT - @toolbar.height        

    assignToCurrentSubscreen: (newSubScreen) =>
        if @subScreen isnt null
            @subScreen.view.getParent().remove(@subScreen.view)
            @subScreen = null

        newSubScreen.view.top = @toolbar.height
        newSubScreen.view.height = @getSubscreenHeight()
        newSubScreen.view.width  = @view.width
        newSubScreen.relayout()
        newSubScreen.play()

        @subScreen = newSubScreen
        @view.add newSubScreen
    showSitePlanScreen: () =>
        sitePlanScreen = new SitePlanScreen().init()
        @assignToCurrentSubscreen sitePlanScreen

    showNorthViewScreen: () =>
        northViewScreen = new NorthViewScreen("NorthView").init()
        @assignToCurrentSubscreen northViewScreen

    showSouthViewScreen: () =>
        southViewScreen = new NorthViewScreen("SouthView").init()
        @assignToCurrentSubscreen southViewScreen

    showDayViewScreen: (e) =>

        imageName = ""

        button = e
        
        if button.button_id is 0
            if button.is_southview
                imageName = "SouthView-Day"
            else
                imageName = "NorthView-Day"
        if button.button_id is 1
            if button.is_southview
                imageName = "SouthView-Night"
            else
                imageName = "NorthView-Night"

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


    showHighZoneScreen: () =>
        highZoneScreen = new HighZoneScreen().init()
        highZoneScreen.onDayViewClicked = (e) =>
            @showDayViewScreen(e)
        @assignToCurrentSubscreen highZoneScreen

    showLowZoneScreen: () =>
        lowZoneScreen = new LowZoneScreen().init()
        lowZoneScreen.onDayViewClicked = (e) =>
            @showDayViewScreen(e)
        @assignToCurrentSubscreen lowZoneScreen

    addClickEventToButton: (button) =>
        button.addEventListener "click", =>
            if button.button_id is 0
                @showSitePlanScreen()
            if button.button_id is 1
                @showLowZoneScreen()
            if button.button_id is 2
                @showHighZoneScreen()
            if button.button_id is 3
                @showNorthViewScreen()
            if button.button_id is 4
                @showSouthViewScreen()

    init: () =>

        @addClickEventToButton @buttonSitePlan
        @addClickEventToButton @buttonHighZone
        @addClickEventToButton @buttonLowZone
        @addClickEventToButton @buttonSouthView
        @addClickEventToButton @buttonNorthView


        @

    play: () =>
        @showSitePlanScreen()

    relayout: () =>

module.exports = FloorplanScreen