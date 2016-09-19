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
      flash[:success] = "The photo was added!"
      redirect_to product_path(@attachment.project.product.name)
    else
      render :new
    end
  end

  private

  def attachment_params
    params.require(:attachment).permit(:image, :project_id)
  end


end
