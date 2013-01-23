$(document).ready(function() {
  $(".answer").addClass("hidden");
  $(".question").each(function(idx, em) {
    $(em).html($(em).html().split("...").join("<span class='solution'>...</span>"));
  });
  $answerBtn = $("<a class='answer-btn' href='#'>Answer &rarr;</a>").click(function() {
    $(this).next(".answer").toggleClass("hidden");
    $(this).toggleClass("open");
    return false;
  });
  $(".answer").before($answerBtn);
});
