class TopMenuBar
    constructor: () ->
        @view = Ti.UI.createView
            height:102/2

        @buttonSouthHills = Ti.UI.createButton
            backgroundImage: 'MenuBar-SouthHills.png'
            width: 486/2
            height: 101/2
            button_id: 0

        @view.add @buttonSouthHills

        @buttonGallery = Ti.UI.createButton
            backgroundImage: 'MenuBar-Gallery.png'
            width: 489/2
            height: 102/2
            button_id: 1

        @view.add @buttonGallery

        @buttonLogo = Ti.UI.createButton
            backgroundImage: 'MenuBar-Logo.png'
            width: 99/2
            height: 102/2

        @view.add @buttonLogo

        @buttonPlans = Ti.UI.createButton
            backgroundImage: 'MenuBar-Plans.png'
            width: 489/2
            height: 102/2
            button_id: 3

        @view.add @buttonPlans

        @buttonLocation = Ti.UI.createButton
            backgroundImage: 'MenuBar-Location.png'
            width: 489/2
            height: 102/2
            button_id: 2

        @view.add @buttonLocation

        @onButtonClicked = null

    addClickListener: (btn) =>
        btn.addEventListener "click", =>
            if @onButtonClicked isnt null
                @onButtonClicked(btn.button_id)

    init: () =>
        @buttonSouthHills.left = 0
        @buttonSouthHills.top = 0

        @buttonGallery.left = @buttonSouthHills.width - 1
        @buttonGallery.top = 0

        @buttonLogo.left = @buttonGallery.left + @buttonGallery.width - 1
        @buttonLogo.top = 0

        @buttonPlans.left = @buttonLogo.left + @buttonLogo.width - 1
        @buttonPlans.top = 0

        @buttonLocation.left = @buttonPlans.left + @buttonPlans.width - 1
        @buttonLocation.top = 0

        @addClickListener @buttonSouthHills
        @addClickListener @buttonGallery
        @addClickListener @buttonLogo
        @addClickListener @buttonPlans

        @



    play: () =>



        

module.exports = TopMenuBar