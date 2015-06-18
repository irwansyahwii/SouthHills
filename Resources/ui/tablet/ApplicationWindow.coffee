FirstView = require('ui/common/IntroScreen')
MainMenuScreen = require("ui/common/MainMenuScreen")
ScreenWithTopBarmenu = require("ui/common/ScreenWithTopBarMenu")
FullScreenGallery = require("ui/common/FullScreenGallery")

class ApplicationWindow
    constructor: () ->    
    
        self = Ti.UI.createWindow
            backgroundColor:'#ede0c8'
            orientationModes : [Ti.UI.LANDSCAPE_LEFT, Ti.UI.LANDSCAPE_RIGHT]
            statusBarStyle : Titanium.UI.iPhone.StatusBar.LIGHT_CONTENT
            fullscreen:true

        # self.orientationModes = [Ti.UI.LANDSCAPE_LEFT, Ti.UI.LANDSCAPE_RIGHT];

        
        firstView = new FirstView()
        firstView.onExit = =>            

            mainMenuScreen = new MainMenuScreen().init()      

            mainMenuScreen.onButtonClicked = (button_id) =>
                topBarScreen = new ScreenWithTopBarmenu().init()
                topBarScreen.onDoubleTapped = (eventInfo)=>
                    if eventInfo.event_type is "GALLERY"
                        eventData = eventInfo.event_data
                        console.log eventInfo
                        fullscreenGallery = new FullScreenGallery().init()   
                        fullscreenGallery.setEventData(eventData)
                        self.add fullscreenGallery
                        fullscreenGallery.play()

                topBarScreen.onDayView = (image) =>


                self.add topBarScreen
                topBarScreen.play()
                topBarScreen.click button_id

            self.add mainMenuScreen
            mainMenuScreen.play()

        self.add(firstView)
        firstView.play()
        
        
        return self
        
    

    



module.exports = ApplicationWindow
