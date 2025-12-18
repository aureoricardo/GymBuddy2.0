class AddProfileFieldsToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :bio, :text
    add_column :users, :deadlift, :integer
    add_column :users, :bench, :integer
    add_column :users, :squat, :integer
  end
end
