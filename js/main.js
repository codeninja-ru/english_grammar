$(document).ready(function() {
  $(".answer").addClass("hidden");
  $(".question").each(function(idx, em) {
    $(em).html($(em).html().split("...").join("<input class='solution' type='text' maxlength='20' placeholder='...'>"));
  });
  $answerBtn = $("<a class='answer-btn' href='#'>Answer &rarr;</a>").click(function() {
    $(this).next(".answer").toggleClass("hidden");
    $(this).toggleClass("open");
    return false;
  });
  $(".answer").before($answerBtn);
  $(".question input.solution").keyup(function () {
    var length = $(this).val().length;
    if (length > 2) {
      $(this).width(length * 18);
    }
  });
});
