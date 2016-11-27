class Api::V1::ProductStylesController < Api::ApiController

  respond_to :json

  def index
    product = Product.find(params[:product_id])
    product_styles = product.product_styles.as_json(include: :style)
    respond_with product_styles
  end

end
