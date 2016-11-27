$(document).ready(function(){

  $('.products').click(function(){
    let product = this.innerHTML;
    $('#prod-sty-title')[0].innerHTML = product + ' Styles';
    let id = this.id.split('-')[1];
    findStyles(id);
  });

  let findStyles = function(id) {
    $.ajax({
      url: `/api/v1/products/${id}/product_styles`,
      method: 'GET',
      dataType: 'json',
      success: function(response) {
        printProductStyles(response)
      },
      error: function(data) {
        alert("couldn't create that link")
      },
    });
  };

  function printProductStyles(response) {
    for(let i = 0; i < response.length; i++) {
      $('#prod-sty').append(`<button type="button" class='btn btn-info' id='prod-sty-${response[i].id}'>${response[i].style.name}</button>\n`)
    };
  };
});
