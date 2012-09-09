$ ->
  videoContainer = $(".videoContainer")
  firstVideo = $("#first")
  secondVideo = $("#second")
  intermediate = $("#intermediate")
  # video elements size not able to be specified by css
  for video in [firstVideo, secondVideo]
    video.attr("height", videoContainer.height())
    video.attr("width", videoContainer.width())
  # As per instructions play first video, then display img, 
  # then play second video on 10 sec delay
  # with animation transition between
  firstVideo.on "ended", ->
    firstVideo.hide 'slow', ->
      intermediate.show 'slow', ->
        setTimeout ->
            intermediate.hide 'slow', ->
              secondVideo.show 'slow', ->
                this.play()
          , 10000
  # hit off the first video
  $("#start").click ->
    firstVideo.show 'slow', ->
      this.play()
    $(this).remove()
  # append source to bottom 
  sourceTemplate = _.template $("#sourceTemplate").text()
  appendSource = (file) ->
    $.ajax(file).then (data) ->
      $("#source").append sourceTemplate
        data: 
          filename: file
          code: data
  for file in ["index.jade", "eyemaginations.styl", "eyemaginations.coffee"]
    appendSource file