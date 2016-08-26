class CreateFriendshipsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :friendships do |t|
      t.integer :user_id
      t.integer :friend_id
      t.string :status
      t.timestamp :accepted_at
      t.timestamps
    end
  end
end
