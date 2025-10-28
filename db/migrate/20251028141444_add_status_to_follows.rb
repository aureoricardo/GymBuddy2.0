class AddStatusToFollows < ActiveRecord::Migration[8.0]
  def change
    add_column :follows, :status, :string
    add_column :follows, :default, :string
    add_column :follows, :accepted, :string
  end
end
