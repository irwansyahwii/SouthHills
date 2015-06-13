About1 = require("ui/common/About1")
About2 = require("ui/common/About2")

class AboutScreen
    constructor:() ->
        @view = Ti.UI.createScrollableView()
            # backgroundColor: "red"
            # layout: "horizontal"
            # contentWidth: "auto"
            # contentHeight: "auto"
            # showVerticalScrollIndicator: true
            # showHorizontalScrollIndicator: true

        @about1 = new About1().init()        
        # @view.add @about1.view

        @about2 = new About2().init()
        # @view.add @about2.view

        @view.views = [@about1.view, @about2.view]

        @currentViewIndex = 0

        @view.addEventListener "scrollend", @onScrollEnd

    onScrollEnd: () =>
        if @view.currentPage isnt @currentViewIndex
            @currentViewIndex = @view.currentPage
            @getCurrentView().controller.play()


    init: () =>

        @

    getCurrentView: () =>
        for v in @view.views
            v.controller.reset()
        return @view.views[@view.currentPage]

    play: () =>
        @getCurrentView().controller.play()


            




module.exports = AboutScreen