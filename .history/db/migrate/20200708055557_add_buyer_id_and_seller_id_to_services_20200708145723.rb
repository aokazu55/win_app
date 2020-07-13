class AddBuyerIdAndSellerIdToServices < ActiveRecord::Migration[5.2]
  def change
    add_column :services, :buyer_id, :integer
    add_column :services, :seller_id, :integer
  end
end
