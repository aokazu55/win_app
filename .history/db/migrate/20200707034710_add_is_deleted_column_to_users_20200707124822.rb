class AddIsDeletedColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :is_deleted, :datetime, default: false
  end
end
