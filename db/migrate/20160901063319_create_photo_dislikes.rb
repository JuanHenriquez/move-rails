class CreatePhotoDislikes < ActiveRecord::Migration[5.0]
  def change
    create_table :photo_dislikes do |t|
        t.belongs_to :photo
        t.belongs_to :user
    end
  end
end
