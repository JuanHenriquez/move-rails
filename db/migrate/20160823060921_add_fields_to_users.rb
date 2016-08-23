class AddFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
      add_column :users, :first_name, :string, null: false, default: ""
      add_column :users, :last_name, :string, null: false, default: ""
      add_column :users, :status, :boolean, null: false, default: false
      add_column :users, :avatar, :string, null: false, default: ""
      add_column :users, :age, :integer
      add_column :users, :country, :string, null: false, default: ""
  end
end
