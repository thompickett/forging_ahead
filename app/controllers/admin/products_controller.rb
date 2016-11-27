class Admin::ProductsController < AdminController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find_by(name: params[:name])
    @product_styles = ProductStyle.where(product_id: @product.id).order(:style_id)
  end

end
