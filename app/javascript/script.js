$(document).ready(function() {
  $('.slider').slick({
    arrows: false,
    autoplay: true,
    autoplaySpeed: 5000,
    speed: 6900,
    infinite: true,
    pauseOnHover: false,
    pauseOnFocus: false,
    cssEase: 'linear',
    slidesToShow: 4,
    slidesToScroll: 1,
    responsive: [
      {
        breakpoint: 769,
        settings: {
          slidesToShow: 2,
        }
      },
      {
        breakpoint: 426,
        settings: {
          slidesToShow: 1.5,
        }
      }
    ]
  });
});
