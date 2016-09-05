class AddTimestampsToPhotoComments < ActiveRecord::Migration[5.0]
  def change
    add_column :photo_comments, :updated_at, :datetime
    add_column :photo_comments, :created_at, :datetime
  end
end
