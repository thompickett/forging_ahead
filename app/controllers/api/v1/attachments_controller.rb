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
    product_style = ProductStyles.find(params[:id])
    attachments = product_style.attachments.map do |attachment|
      attachment.image(:thumb)
    end
    respond_with attachments
  end

  private

  def attachment_params
    params.require(:attachment).permit(:image, :product_style_id)
  end

end
