class AddTimestampsToPostComments < ActiveRecord::Migration[5.0]
  def change
    add_column :post_comments, :created_at, :datetime
    add_column :post_comments, :update_at, :datetime
  end
end
