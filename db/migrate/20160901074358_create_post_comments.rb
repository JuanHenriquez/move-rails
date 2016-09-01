class CreatePostComments < ActiveRecord::Migration[5.0]
  def change
    create_table :post_comments do |t|
      t.belongs_to :post
      t.belongs_to :user
      t.text :text
    end
  end
end
