class RenamePostsLikesTable < ActiveRecord::Migration[5.0]
  def change
      rename_table :posts_likes, :post_likes
  end
end
