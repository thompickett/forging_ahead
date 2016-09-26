class Api::V1::AttachmentsController < Api::ApiController

  respond_to :json

  def show
    respond_with Attachment.find(params[:id])
  end

  def create
    @attachment = Attachment.create(attachment_params)
    respond_with attachment_path(@attachment)
  end

  def style_attachments
    style = Style.find(params[:id])
    attachments = style.projects.map do |project|
      project.attachments.map do |attachment|
        attachment.image
      end
    end.flatten
    respond_with attachments
  end

  private

  def attachment_params
    params.require(:attachment).permit(:image, :project_id)
  end

end
