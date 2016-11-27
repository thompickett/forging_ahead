class Admin::ProductStylesController < AdminController

  def new
    @product_style = ProductStyle.new
    @products = Product.all
    @styles = Style.all
  end

  def create
    @product_style = ProductStyle.new(project_params)
    if @product_style.save
      redirect_to admin_product_path(@product_style.product.name)
    else
      render :new
    end
  end

private

  def project_params
    params.require(:product_styles).permit(:product_id, :style_id)
  end

end
