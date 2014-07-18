class ChangeDateTimeFormatInMyTable < ActiveRecord::Migration
  def change
  	remove_column :bookees, :arrest_time
  	rename_column :bookees, :arrest_date, :arrest_datetime
  	change_column :bookees, :arrest_datetime, :datetime
  end
end
