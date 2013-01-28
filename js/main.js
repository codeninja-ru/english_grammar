$(document).ready(function() {
  $(".answer").addClass("hidden");
  $(".question").each(function(idx, em) {
    $(em).html($(em).html().split("...").join("<span class='solution' contenteditable data-placeholder='...'></span>"));
  });
  $answerBtn = $("<a class='answer-btn' href='#'>Answer &rarr;</a>").click(function() {
    $(this).next(".answer").toggleClass("hidden");
    $(this).toggleClass("open");
    return false;
  });
  $(".answer").before($answerBtn);
//  $(".solution").keydown(function() {
//    if ($(this).text() == $(this).data('placeholder')) {
//      $(this).text('');
//    }
//  });
//  $(".solution").each(function (idx, em) {
//    $(em).html($(em).data('placeholder'));
//  });
});

//http://jsbin.com/onako4/3/edit
//this this solution for ajusting input width by its input
