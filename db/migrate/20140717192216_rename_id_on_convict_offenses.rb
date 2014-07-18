class RenameIdOnConvictOffenses < ActiveRecord::Migration
  def change
  	rename_column :convict_offenses, :bookees_id, :bookee_id
    rename_column :convict_offenses, :crimes_id, :crime_id

  end
end
