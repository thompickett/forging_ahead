class AddAttachmentRefToAttachments < ActiveRecord::Migration[5.0]
  def change
    add_reference :attachments, :product_styles, foreign_key: true
  end
end
