Intro1 = require("ui/common/Intro1")
Intro2 = require("ui/common/Intro2")

class IntroScreen
    constructor: () ->
        @view = Ti.UI.createView()

        @intro1  = new Intro1()
        @view.add @intro1

        @intro2  = new Intro2()
        @view.add @intro2

        @intro2.view.visible = false

        @intro1.onPlayEnds = @onIntro1PlayEnds
        @intro2.onPlayEnds = @onIntro2PlayEnds


        @view.addEventListener "click", @onMainViewClicked

        @onExit = null

    raiseOnExit: () =>
        if @onExit isnt null
            @onExit()

    onMainViewClicked: () =>
        @view.getParent().remove(@view)
        @raiseOnExit()


    onIntro2PlayEnds: () =>
        @intro1.view.visible = true
        @intro2.view.visible = false
        @intro1.play()

    onIntro1PlayEnds: () =>
        console.log "onIntro1PlayEnds called"
        @intro1.view.visible = false
        @intro2.view.visible = true
        @intro2.play()

    play: () =>
        @intro1.play()        


module.exports = IntroScreen