class ChangeIsDeletedToUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :is_deleted, :datetime
    add_index :users, :is_deleted
  end
end
