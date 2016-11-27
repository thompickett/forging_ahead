$(document).ready(function(){

  $('.products').click(function(){
    let productId = this.id.split('-')[1];
    let product = this;
    $.ajax({
      url: `/api/v1/products/${productId}/product_styles`,
      method: 'GET',
      dataType: 'json',
      success: function(response) {
        printProductStyles(response)
        updateProductStyleDisplay(product)
      },
      error: function(data) {
        alert("couldn't create that link")
      },
    });
  });

  function updateProductStyleDisplay(product) {
    product.classList.add('active-product');
    let productName = product.innerHTML;
    $('#prod-sty-title')[0].innerHTML = productName + ' Styles';
    $('#prodForm')[0].value = productName;
    $('.form')[0].classList.remove('hidden');
  };

  function printProductStyles(response) {
    for(let i = 0; i < response.length; i++) {
      $('#prod-sty').append(`<button type="button" class='btn btn-info' id='prod-sty-${response[i].id}'>${response[i].style.name}</button>\n`)
    };
  };

  $('#prod-sty .btn-primary').click(function(){
    let product = $('.form')[0].prodForm.value;
    let style = $('.form')[0].style.value;
    let productId = $('.active-product')[0].id.split('-')[1];
    let postParams = {
      product_style: {
        product_id: productId,
        style_name: style,
      }
    }
    $.ajax({
      url: `api/v1/products/${productId}/product_styles`,
      method: 'POST',
      dataType: 'json',
      data: postParams,
      success: function(response) {
        addProdStyToList(response,style)
      },
      error: function(response) {
        alert("no doing that!")
      }
    })
  });

  function addProdStyToList(response,style) {
    $('#prod-sty').append(`<button type="button" class='btn btn-info' id='prod-sty-${response.id}'>${style}</button>\n`)
  };


});
