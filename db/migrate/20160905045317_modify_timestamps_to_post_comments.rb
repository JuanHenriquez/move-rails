class ModifyTimestampsToPostComments < ActiveRecord::Migration[5.0]
  def change
      rename_column :post_comments, :update_at, :updated_at
  end
end
