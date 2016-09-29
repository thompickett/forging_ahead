class CreateProductStyle < ActiveRecord::Migration[5.0]
  def change
    create_table :product_styles do |t|
      t.references :style, foreign_key: true
      t.references :product, foreign_key: true
      t.references :attachment, foreign_key: true
    end
  end
end
