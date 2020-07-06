class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.string :main_service
      t.string :service_detail
      t.string :service_name
      t.string :image_id
      t.string :confidence_level
      t.integer :price
      t.string :working_time
      t.date :period_start
      t.date :period_end
      t.text :remark
      t.string :transportation_expenses
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
