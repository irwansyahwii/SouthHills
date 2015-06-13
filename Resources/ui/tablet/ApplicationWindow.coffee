FirstView = require('ui/common/IntroScreen')

class ApplicationWindow
    constructor: () ->    
    
        self = Ti.UI.createWindow
            backgroundColor:'#ede0c8'
            orientationModes : [Ti.UI.LANDSCAPE_LEFT, Ti.UI.LANDSCAPE_RIGHT]


        # self.orientationModes = [Ti.UI.LANDSCAPE_LEFT, Ti.UI.LANDSCAPE_RIGHT];

        
        firstView = new FirstView()
        firstView.onExit = =>
            console.log "firstView.onExit called"
        self.add(firstView)
        firstView.play()
        
        
        return self
        
    

    



module.exports = ApplicationWindow
