TopMenuBar = require("/ui/common/TopMenuBar")
AboutScreen = require("/ui/common/AboutScreen")
GalleryScreen = require("/ui/common/GalleryScreen")

SCREEN_HEIGHT = 768

class ScreenWithTopBarMenu
    constructor:() ->
        @view = Ti.UI.createView
            width: Ti.UI.FILL
            height: Ti.UI.FILL
            

        @topBar = new TopMenuBar().init()

        @view.add @topBar.view

        @subScreen = null

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

    getSubscreenHeight: () =>
        SCREEN_HEIGHT - @topBar.view.height        

    assignToCurrentSubscreen: (newSubScreen) =>
        if @subScreen isnt null
            @subScreen.view.getParent().remove(@subScreen.view)
            @subScreen = null

        newSubScreen.view.top = @topBar.view.height
        newSubScreen.view.height = @getSubscreenHeight()
        newSubScreen.play()

        @subScreen = newSubScreen
        @view.add newSubScreen

    showAboutScreen: () =>
        aboutScreen = new AboutScreen().init()
        @assignToCurrentSubscreen aboutScreen

    showGalleryScreen: () =>
        galleryScreen = new GalleryScreen().init()
        galleryScreen.view.height = @getSubscreenHeight()
        galleryScreen.relayout()
        @assignToCurrentSubscreen galleryScreen

    click: (button_id) =>        
        @showGalleryScreen()



module.exports = ScreenWithTopBarMenu