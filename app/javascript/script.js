// topアニメーション
$(window).on('load', function(){
  $("#splash_logo").delay(1200).fadeOut('slow');
  $("#splash").delay(1500).fadeOut('slow',function(){
    $('body').addClass('appear');
  });
  $('.splashbg1').on('animationend', function(){
  });
});


// スライドショー
$(document).ready(function() {
  $('.slider').slick({
    autoplay: true,
    infinite: true,
    speed: 500,
    slidesToShow: 3,
    slidesToScroll: 1,
    prevArrow: '<div class="slick-prev"></div>',
    nextArrow: '<div class="slick-next"></div>',
    centerMode: true,
    variableWidth: true,
    dots: true,
  });
});
