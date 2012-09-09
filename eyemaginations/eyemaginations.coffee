$ ->
  videoContainer = $(".videoContainer")
  firstVideo = $("#first")
  secondVideo = $("#second")
  for video in [firstVideo, secondVideo]
    video.attr("height", videoContainer.height())
    video.attr("width", videoContainer.width())
  firstVideo.on "ended", ->
    $("#first").hide 'slow', ->
      $("#intermediate").show 'slow', ->
        setTimeout ->
            $("#intermediate").hide 'slow', ->
              secondVideo.show 'slow', ->
                this.play() 
          , 10000
  $("#start").click ->
    firstVideo.show 'slow', ->
      this.play()
  sourceTemplate = _.template $("#sourceTemplate").text()
  appendSource = (file) ->
    $.ajax(file).then (data) ->
      $("#source").append sourceTemplate
        data: 
          filename: file
          code: data
  for file in ["index.jade", "eyemaginations.styl", "eyemaginations.coffee"]
    appendSource file