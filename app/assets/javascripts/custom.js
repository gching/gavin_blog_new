$("a[href='#top']").click(function() {
  $("html, body").animate({ scrollTop: 0 }, "slow");
  return false;
});



$(window).scroll(function(){
  if($(window).scrollTop() >= 400) {
    $('.header-fake').fadeIn('fast')
  } else {
    $('.header-fake').fadeOut('fast');
  }
})

$(document).on('open', '[data-reveal]', function () {
  $('body').toggleClass("stop-scrolling")
  $('body').bind('touchmove', function(e){e.preventDefault()})
});

$(document).on('close', '[data-reveal]', function () {
  $('body').toggleClass("stop-scrolling")
  $('body').unbind('touchmove')
});
