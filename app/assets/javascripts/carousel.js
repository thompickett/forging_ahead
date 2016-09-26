$(document).ready(function(){
  let counter = 0

  $(".style").click(function(){

    let postParams = {
      id: this.id.split("-")[1]
    };

    let createCarouselDivs = function(data) {


      if (data.length > 0) {

        if (counter > 0) {
          $('.carousel').slick('unslick').slick('reinit');
          $('.carousel')[0].innerHTML = ""
        }

        data.forEach(function(attachment,index) {
          $('.carousel')[0].innerHTML = $('.carousel')[0].innerHTML + "<div><img src='" + attachment + "'></div>"
        })

        counter = counter + 1

        $('.carousel').slick({
          infinite: true,
          slidesToShow: 1,
          slidesToScroll: 1
        });

      }
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
