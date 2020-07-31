class CreateTrades < ActiveRecord::Migration[5.2]
  def change
    create_table :trades do |t|
      t.text :message
      t.integer :user_id
      t.integer :service_id

      t.timestamps null: false

      t.references :user, foreign_key: true
      t.references :service, foreign_key: true
      
    end
    add_index :trades, :user_id
    add_index :trades, :service_id
    add_index :trades, [:user_id, :service_id], unique: true
  end
end
