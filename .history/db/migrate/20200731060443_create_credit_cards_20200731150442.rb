class CreateCreditCards < ActiveRecord::Migration[5.2]
  def change
    create_table :credit_cards do |t|
      t.string :customer_id
      t.string :card_id
      t.references :user, foreign_key: true
    end
  end
end
