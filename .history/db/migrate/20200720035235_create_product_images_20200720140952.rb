class CreateProductImages < ActiveRecord::Migration[5.2]
  def change
    create_table :product_images do |t|
      t.string :image_id

      t.timestamps
      t.references :service, foreign_key: true
    end
  end
end
