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

        @onDoubleTapped = null

    raiseOnDoubleTapped: (eventInfo) =>
        if @onDoubleTapped isnt null
            @onDoubleTapped(eventInfo)

    init: () =>

        @topBar.view.left = 0
        @topBar.view.top = - @topBar.view.height

        @topBar.onButtonClicked = @click
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
        galleryScreen.onDoubleTapped = @raiseOnDoubleTapped

        @assignToCurrentSubscreen galleryScreen

    showLocationScreen: () =>

    showFloorplanScreen: () =>


    click: (button_id) =>        
        if button_id is 0        
            @showAboutScreen()

        if button_id is 1
            @showGalleryScreen()

        if button_id is 2
            @showLocationScreen()

        if button_id is 3
            @showFloorplanScreen()

module.exports = ScreenWithTopBarMenu