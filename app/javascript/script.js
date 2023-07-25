// ヘッダー　category, mypage, loginドロップダウンメニュー
document.addEventListener('turbolinks:load', function() {
  const categoryContainer = document.getElementById('categoryContainer');
  const categoryDropdown = document.getElementById('categoryDropdown');

  if (categoryContainer) {
    categoryContainer.addEventListener('mouseover', function() {
      categoryDropdown.style.display = 'block';
    });

    categoryContainer.addEventListener('mouseout', function() {
      categoryDropdown.style.display = 'none';
    });
  }

  const mypageBtnContainer = document.getElementById('mypageBtnContainer');
  const mypageDropdown = document.getElementById('mypageDropdown');

  if (mypageBtnContainer) {
    mypageBtnContainer.addEventListener('mouseover', function() {
      mypageDropdown.style.display = 'block';
    });

    mypageBtnContainer.addEventListener('mouseout', function() {
      mypageDropdown.style.display = 'none';
    });
  }

  const loginBtnContainer = document.getElementById('loginBtnContainer');
  const loginDropdown = document.getElementById('loginDropdown');

  if (loginBtnContainer) {
    loginBtnContainer.addEventListener('mouseover', function() {
      loginDropdown.style.display = 'block';
    });

    loginBtnContainer.addEventListener('mouseout', function() {
      loginDropdown.style.display = 'none';
    });
  }
});


// 検索ボタン
document.addEventListener('turbolinks:load', function() {
  const searchIcon = document.getElementById('search-icon');
  const searchForm = document.getElementById('search-form');
  const searchInput = document.getElementById('search-input');
  let searchVisible = false;

  searchIcon.addEventListener('click', function() {
    if (!searchVisible) {
      searchForm.style.width = "200px";
      searchVisible = true;
      setTimeout(() => searchInput.focus(), 300);
    } else {
      searchForm.querySelector('form').submit();
    }
  });

  document.addEventListener('click', function(event) {
    if (searchVisible && !searchIcon.contains(event.target) && !searchForm.contains(event.target)) {
      searchForm.style.width = "0";
      searchVisible = false;
    }
  });
});



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

// フッター インフォ表示
document.addEventListener('turbolinks:load', function() {
  const infoIcon1 = document.getElementById('info-icon-1');
  const infoIcon2 = document.getElementById('info-icon-2');
  const infoDropdown1 = document.getElementById('info-dropdown-1');
  const infoDropdown2 = document.getElementById('info-dropdown-2');

  infoIcon1.addEventListener('mouseover', () => {
    infoDropdown1.style.display = 'block';
  });

  infoIcon1.addEventListener('mouseout', () => {
    infoDropdown1.style.display = 'none';
  });

  infoDropdown1.addEventListener('mouseover', () => {
    infoDropdown1.style.display = 'block';
  });

  infoDropdown1.addEventListener('mouseout', () => {
    infoDropdown1.style.display = 'none';
  });

  infoIcon2.addEventListener('mouseover', () => {
    infoDropdown2.style.display = 'block';
  });

  infoIcon2.addEventListener('mouseout', () => {
    infoDropdown2.style.display = 'none';
  });

  infoDropdown2.addEventListener('mouseover', () => {
    infoDropdown2.style.display = 'block';
  });

  infoDropdown2.addEventListener('mouseout', () => {
    infoDropdown2.style.display = 'none';
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

