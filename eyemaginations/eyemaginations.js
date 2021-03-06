// Generated by CoffeeScript 1.3.3
(function() {

  $(function() {
    var appendSource, file, firstVideo, intermediate, secondVideo, sourceTemplate, video, videoContainer, _i, _j, _len, _len1, _ref, _ref1, _results;
    videoContainer = $(".videoContainer");
    firstVideo = $("#first");
    secondVideo = $("#second");
    intermediate = $("#intermediate");
    _ref = [firstVideo, secondVideo];
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      video = _ref[_i];
      video.attr("height", videoContainer.height());
      video.attr("width", videoContainer.width());
    }
    firstVideo.on("ended", function() {
      return firstVideo.hide('slow', function() {
        return intermediate.show('slow', function() {
          return setTimeout(function() {
            return intermediate.hide('slow', function() {
              return secondVideo.show('slow', function() {
                return this.play();
              });
            });
          }, 10000);
        });
      });
    });
    $("#start").click(function() {
      firstVideo.show('slow', function() {
        return this.play();
      });
      return $(this).remove();
    });
    sourceTemplate = _.template($("#sourceTemplate").text());
    appendSource = function(file) {
      return $.ajax(file).then(function(data) {
        return $("#source").append(sourceTemplate({
          data: {
            filename: file,
            code: data
          }
        }));
      });
    };
    _ref1 = ["index.jade", "eyemaginations.styl", "eyemaginations.coffee"];
    _results = [];
    for (_j = 0, _len1 = _ref1.length; _j < _len1; _j++) {
      file = _ref1[_j];
      _results.push(appendSource(file));
    }
    return _results;
  });

}).call(this);
