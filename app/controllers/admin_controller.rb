class AdminController < ApplicationController

  before_filter :authorize

  def dashboard
    @products = Product.all
    @styles = Style.all
  end

end
