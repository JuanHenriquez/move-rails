class CreateGroupPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :group_posts do |t|
        t.belongs_to :group
        t.belongs_to :user
        t.text :text
        t.timestamps
    end
  end
end
