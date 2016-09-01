class CreatePhotoLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :photo_likes do |t|
        t.belongs_to :photo
        t.belongs_to :user
    end
  end
end
