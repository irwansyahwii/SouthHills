TopMenuBar = require("ui/common/TopMenuBar")
AboutScreen = require("ui/common/AboutScreen")

SCREEN_HEIGHT = 768

class ScreenWithTopBarMenu
    constructor:() ->
        @view = Ti.UI.createView
            width: Ti.UI.FILL
            height: Ti.UI.FILL
            

        @topBar = new TopMenuBar().init()

        @view.add @topBar.view

    init: () =>

        @topBar.view.left = 0
        @topBar.view.top = - @topBar.view.height
        # @topBar.view.top = 0

        @

    animateInTopBar: () =>
        @topBar.view.animate
            top: 0
            duration: 500

    play: () =>
        @animateInTopBar()

    click: (button_id) =>        
        aboutScreen = new AboutScreen().init()
        aboutScreen.view.top = @topBar.view.height
        aboutScreen.view.height = SCREEN_HEIGHT - @topBar.view.height
        @view.add aboutScreen
        aboutScreen.play()



module.exports = ScreenWithTopBarMenu