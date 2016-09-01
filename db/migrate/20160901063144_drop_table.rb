class DropTable < ActiveRecord::Migration[5.0]
  def change
      drop_table :photo_likes
      drop_table :photo_dislikes
  end
end
