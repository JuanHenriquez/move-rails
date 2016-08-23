class ChangeAvatarForUsers < ActiveRecord::Migration[5.0]
  def change
      change_column :users, :avatar, :string, null: true, default: nil
  end
end
