class CreateFollowers < ActiveRecord::Migration[5.2]
  def change
    create_table :followers do |t|
      t.integer :following_user_id
      t.integer :followed_user_id

      t.timestamps
    end
    add_index :followers, :following_user_id
    add_index :followers, :followed_user_id
  end
end
