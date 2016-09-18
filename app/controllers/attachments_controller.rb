class AttachmentsController < ApplicationController

  def new
    @attachment = Attachment.new(project_id: params[:project])
  end

  def create
    @attachment = Attachment.new(attachment_params)
    binding.pry
    if @attachment.save
      redirect_to project_path(@attachment.project)
    else
      render :new
    end
  end

  private

  def attachment_params
    params.require(:attachment).permit(:image)
  end


end
