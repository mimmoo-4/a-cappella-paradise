class DeleteGroupUser < ActiveRecord::Migration[6.1]
  def change
    drop_table :group_users
  end
end
