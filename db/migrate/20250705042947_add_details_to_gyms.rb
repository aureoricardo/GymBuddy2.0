class AddDetailsToGyms < ActiveRecord::Migration[8.0]
  def change
  
    add_column :gyms, :latitude, :float
    add_column :gyms, :longitude, :float
    add_column :gyms, :avatar_url, :string
  end
end
