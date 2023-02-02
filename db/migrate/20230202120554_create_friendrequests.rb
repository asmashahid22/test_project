class CreateFriendrequests < ActiveRecord::Migration[5.2]
  def change
    create_table :friendrequests do |t|
      t.integer :send_user_id
      t.integer :receive_user_id

      t.timestamps
    end
    add_index :friendrequests, :send_user_id
    add_index :friendrequests, :receive_user_id
  end
end
