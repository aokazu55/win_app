class ChangeDeletedAtColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :deleted_at, default: false
  end
end
