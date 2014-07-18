class AddLatitudeAndLongitudeToBookee < ActiveRecord::Migration
  def change
  	
    add_column :bookees, :address_lat, :float
    add_column :bookees, :address_lon, :float

  end
end
