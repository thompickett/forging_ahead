class RenameAttachmentProductStyleRef < ActiveRecord::Migration[5.0]
  def change
    rename_column :attachments, :product_styles_id, :product_style_id
  end
end
