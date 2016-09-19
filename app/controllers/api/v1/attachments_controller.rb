class Api::V1::AttachmentsController < Api::ApiController

  respond_to :json

  def show
    respond_with Attachment.find(params[:id])
  end

  def create
    @attachment = Attachment.create(attachment_params)
    respond_with attachment_path(@attachment)
  end

  private

  def attachment_params
    params.require(:attachment).permit(:image, :project_id)
  end

end
