


// スクロールヘッダー

$(document).ready(function() {
  var header = $('header.sticky-top');

  // ページ読み込み時とスクロール時に実行
  $(window).on('load scroll', function() {
    var scrollPos = $(this).scrollTop();

    // スクロール量に応じてヘッダーの透明度を調整
    if (scrollPos > 0) {
      header.addClass('scrolled'); /* scrolledクラスを追加して半透明にする */
    } else {
      header.removeClass('scrolled'); /* scrolledクラスを削除して透明にする */
    }
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

