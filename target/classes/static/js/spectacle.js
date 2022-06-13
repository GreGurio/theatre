$('.multiple-items').slick({
  centerMode: true,
  centerPadding: '-10px',
  slidesToShow: 3,
  variableWidth: true,
  autoplay: true,

  nextArrow: '<button class="slick-arrow slick-next"><img src="/static/img/icons/arrow-next.png" alt="next arrow"></button>',
  prevArrow: '<button class="slick-arrow slick-prev"><img src="/static/img/icons/arrow-prev.png" alt="prev arrow"></button>',

  
});

$('.multiple-items2').slick({
  centerMode: true,
  // prevArrow: "<img src='/img/prev-arrow.png' alt='1'>",
  // nextArrow: "<img src='/img/next-arrow.png' alt='2'>",
  centerPadding: '60px',
  slidesToShow: 5,
  variableWidth: true,
  autoplay: true,

  nextArrow: '<button class="slick-arrow-2 slick-next-2"><img src="/static/img/icons/arrow-next.png" alt="next arrow"></button>',
  prevArrow: '<button class="slick-arrow-2 slick-prev-2"><img src="/static/img/icons/arrow-prev.png" alt="prev arrow"></button>',
  responsive: [
    {
      breakpoint: 768,
      settings: {
        arrows: false,
        centerMode: true,
        centerPadding: '40px',
        slidesToShow: 3
      }
    },
    {
      breakpoint: 480,
      settings: {
        arrows: false,
        centerMode: true,
        centerPadding: '40px',
        slidesToShow: 1
      }
    }
  ]
});


// REGISTER FORM

