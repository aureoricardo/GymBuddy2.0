class AddAddressToGym < ActiveRecord::Migration[7.2]
  def change
    add_column :gyms, :address, :string
  end
end
