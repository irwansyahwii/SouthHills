class FullScreenGallery
    constructor: () ->
        @view = Ti.UI.createImageView
            image: "Gallery-Image1.png"

        @view.addEventListener "doubletap", =>
            @view.getParent().remove(@view)

    init: () =>
        @reset()
        @



    reset: () =>

    setEventData: (event_data) =>
        @view.image = "Gallery-Image#{event_data.current_image_index+1}.png"
        @view.left = event_data.pos.left
        @view.top = event_data.pos.top

        @view.width = event_data.width
        @view.height = event_data.height

    animateInMainView: () =>
        m = Ti.UI.create2DMatrix()
        m = m.scale(2.0);
        # anim = Ti.UI.createAnimation()
        # anim.transform = m

        # @view.animate anim

        anim = Ti.UI.createAnimation
            transform: m
            duration: 800
            
        console.log "scaling view animation..."
        @view.animate anim, =>


    play: () =>
        # @reset()
        @animateInMainView()



module.exports = FullScreenGallery