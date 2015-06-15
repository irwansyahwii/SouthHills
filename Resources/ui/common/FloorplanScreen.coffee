SitePlanScreen = require("/ui/common/SitePlanScreen")
NorthViewScreen = require("/ui/common/NorthViewScreen")


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
            button_id: 2
            left: 1256/2
            top: BUTTON_POS_Y/2
        @toolbar.add @buttonNorthView

        @buttonSouthView = Ti.UI.createButton
            backgroundImage: 'SitePlan-ButtonSouthView.png'
            width: BUTTON_WIDTH/2
            height: BUTTON_HEIGHT/2
            button_id: 3
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

        # @subScreen = newSubScreen
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

    addClickEventToButton: (button) =>
        button.addEventListener "click", =>
            if button.button_id is 0
                @showSitePlanScreen()
            if button.button_id is 2
                @showNorthViewScreen()
            if button.button_id is 3
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