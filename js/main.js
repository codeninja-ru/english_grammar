$(document).ready(function() {
  $(".answer").addClass("hidden");
  $(".question").each(function(idx, em) {
    var html = $(em).html();
    if (html.indexOf("...") != -1) {
      $(em).html(html.split("...").join("<span class='solution' contenteditable data-placeholder='...'></span>"));
    } else {
      $(em).after("<div class='textarea' contenteditable></div>");
    }
  });
  $answerBtn = $("<a class='answer-btn' href='#'>Answer &rarr;</a>").click(function() {
    $(this).next(".answer").toggleClass("hidden");
    $(this).toggleClass("open");
    return false;
  });
  $(".answer").before($answerBtn);
});
