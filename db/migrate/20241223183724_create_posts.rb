class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :post_title
      t.text :post_text
      t.integer :member_id
      t.integer :genre_id
      t.timestamps
    end
  end
end
