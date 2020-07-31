class CreateProductImages < ActiveRecord::Migration[5.2]
  def change
    create_table :product_images do |t|
      t.integer :service_id
      t.string :image_id

      t.timestamps
      add_reference :product_images, :service, foreign_key: true
    end
  end
end
