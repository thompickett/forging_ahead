class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.references :product, foreign_key: true
      t.references :style, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
