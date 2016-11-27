class Api::V1::ProductsController < Api::ApiController

  respond_to :json

  def show
    product = Product.find(params[:id])
    respond_with product
  end

end
