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
      { original:  { img: attachment.image,
                     style: attachment.image.options[:styles][:original]
               },
        thumb: { img: attachment.image(:thumb),
                 style: attachment.image.options[:styles][:thumb]
               }
      }
    end
    respond_with attachments
  end

  private

  def attachment_params
    params.require(:attachment).permit(:image, :product_style_id)
  end

end
