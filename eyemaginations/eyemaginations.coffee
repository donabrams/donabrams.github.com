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
  $.ajax("index.jade").then (data)->
    $("#jade code").text(data)
  $.ajax("eyemaginations.styl").then (data)->
    $("#stylus code").text(data)
  $.ajax("eyemaginations.coffee").then (data)->
    $("#coffee code").text(data)