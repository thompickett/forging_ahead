class AttachmentsController < ApplicationController

  def show
    @attachment = Attachment.find(params[:id])
  end

  def new
    @attachment = Attachment.new(project_id: params[:project])
  end

  def create
    @attachment = Attachment.new(attachment_params)
    if @attachment.save
      redirect_to admin_product_path(@attachment.product_styles.product.name)
    else
      redirect_to admin_product_path(@attachment.product_styles.product.name)
    end
  end

  private

  def attachment_params
    params.require(:attachment).permit(:image, :product_styles_id)
  end


end
