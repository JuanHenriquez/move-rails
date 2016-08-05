class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :country
      t.string :tel
      t.string :address
      t.string :user_picture
      t.boolean :status

      t.timestamps
    end
  end
end
