class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :privacy
      t.string :bg_picture
      t.string :info_text
    end
  end
end
