class Admin::ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find_by(name: params[:name])
    @product_styles = ProductStyles.where(product_id: @product.id).order(:style_id)
  end

end
