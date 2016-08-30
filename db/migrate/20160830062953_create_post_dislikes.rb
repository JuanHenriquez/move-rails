class CreatePostDislikes < ActiveRecord::Migration[5.0]
  def change
    create_table :post_dislikes do |t|
      t.belongs_to :post, index: true
      t.belongs_to :user, index: true
    end
  end
end
