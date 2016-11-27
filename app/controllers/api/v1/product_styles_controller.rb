class Api::V1::ProductStylesController < Api::ApiController

  respond_to :json

  def index
    product = Product.find(params[:product_id])
    product_styles = product.product_styles.as_json(include: :style)
    respond_with product_styles
  end

  def create
    style = Style.find_by(name: product_style_params[:style_name])
    product_style = ProductStyle.create(product_id: product_style_params[:product_id], style_id: style.id)
    render json: product_style.to_json
  end

  private
  def product_style_params
    params.require(:product_style).permit(:style_name, :product_id)
  end

end
