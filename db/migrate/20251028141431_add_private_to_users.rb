class AddPrivateToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :private, :boolean
    add_column :users, :default, :string
    add_column :users, :false, :string
  end
end
