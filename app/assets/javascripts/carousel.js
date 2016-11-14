$(document).ready(function(){

  photos = []

  // let slider = $('#lightSlider').lightSlider({
  //   // basics
  //   // gallery: true,
  //   item: 1,
  //   adaptiveHeight: true,
  //   enableDrag: true,
  //   loop:true,
  //   pager: false,
  //   // thumbItem: 9,
  //   onAfterSlide: function (el) {
  //     var width = $($('.active')[0].innerHTML)[0].width
  //     $('.productStyleDisplay').width(width)
  //   },
  //   // controls
  //   prevHtml: '<',
  //   nextHtml: '>',
  // });

  let blurBackground = function() {
    $('.projects').addClass('blur');
  };

  let createCarouselDivs = function(data) {
    blurBackground()
    data[0]
    var img = new Image();
    img.onload = function() {
      width = img.naturalWidth,
      height = img.naturalHeight
    };
    img.src = data[0].original.img
    var width = img.width
    $('.productStyleDisplay').width(width + 40)

    let carouselIndicators = ""
    let slideWrappers = ""

    data.forEach(function(image,index) {
      carouselIndicators = carouselIndicators + '<li data-target="#myCarousel" data-slide-to="' +
      index + '"';
      slideWrappers = slideWrappers + '<div class="carousel-item';
      if (index === 0) {
        carouselIndicators = carouselIndicators + 'class="active"';
        slideWrappers = slideWrappers + ' active';
      }
      carouselIndicators = carouselIndicators + '></li>';
      slideWrappers = slideWrappers + '"><img src="' +
      image.original.img +
      '"></div>';
    });

    $('.carousel-inner')[0].innerHTML = slideWrappers;
    $('.carousel-indicators')[0].innerHTML = carouselIndicators;

  };

  $('#myCarousel').on('slid.bs.carousel', function () {
    var width = $($('div.active')[0].innerHTML)[0].width
    $('.productStyleDisplay').width(width + 40)
  })

  $(".style").click(function(){
    let postParams = {
      id: this.id.split("-")[1]
    };

    $.ajax({
      url: "/api/v1/style_attachments.json",
      data: postParams,
      method: "GET",
      dataType: "json",
      success: function(data) {
        createCarouselDivs(data)
      },
      error: function(data) {
        alert("couldn't create that link")
      },
    });

  });

});
