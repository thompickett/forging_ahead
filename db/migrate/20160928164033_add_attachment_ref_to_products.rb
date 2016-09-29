class AddAttachmentRefToProducts < ActiveRecord::Migration[5.0]
  def change
    add_reference :products, :attachment, foreign_key: true
  end
end
