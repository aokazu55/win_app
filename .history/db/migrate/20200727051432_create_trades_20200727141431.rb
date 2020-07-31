class CreateTrades < ActiveRecord::Migration[5.2]
  def change
    create_table :trades do |t|
      t.text :message
      t.references :user, foreign_key: true
      t.references :service, foreign_key: true
    end
  end
end
