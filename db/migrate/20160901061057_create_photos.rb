class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.belongs_to :user, index: true
      t.text :text
      t.string :picture
    end
  end
end
