class CreateGroupChats < ActiveRecord::Migration[6.1]
  def change
    create_table :group_chats do |t|
      t.text :chat
      t.integer :member_id
      t.integer :group_id
      t.timestamps
    end
  end
end
