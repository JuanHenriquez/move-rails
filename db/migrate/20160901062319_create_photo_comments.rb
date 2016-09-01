class CreatePhotoComments < ActiveRecord::Migration[5.0]
  def change
    create_table :photo_comments do |t|
        t.belongs_to :photo
        t.belongs_to :user
        t.text :text
    end
  end
end
