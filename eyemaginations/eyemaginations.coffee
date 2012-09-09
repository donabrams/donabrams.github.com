$ ->
  videoContainer = $(".videoContainer")
  firstVideo = $("#first")
  secondVideo = $("#second")
  intermediate = $("#intermediate")
  # video elements size not able to be specified by css
  for video in [firstVideo, secondVideo]
    video.attr("height", videoContainer.height())
    video.attr("width", videoContainer.width())
  # As per instructions animate between all 3 videos
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