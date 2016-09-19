class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    product = Product.find_by(name: params[:name])
    @styles = Style.joins(:projects).where(projects: { product_id: product.id }).uniq
  end

end
