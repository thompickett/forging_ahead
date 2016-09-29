$(document).ready(function(){

  let blurBackground = function() {
    $('.projects').addClass('blur');
  };

  let unSlick = function() {
    let initialized = $('.carousel')[0].classList.contains("slick-initialized");
    if (initialized) {
      $('.carousel').slick('unslick');
      $('.carousel')[0].innerHTML = "";
    }
  };

  let slick = function() {
    $('.carousel').slick({
      infinite: true,
      slidesToShow: 6,
      slidesToScroll: 1
    });
  };

  let createCarouselDivs = function(data) {
    if (data.length > 0) {
      unSlick();
      data.forEach(function(attachment,index) {
        $('.carousel')[0].innerHTML = $('.carousel')[0].innerHTML + "<div><img src='" + attachment + "'></div>";
      });
      slick();
    }
  };

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
        blurBackground()
      },
      error: function(data) {
        alert("couldn't create that link")
      },
    });

  });
});
