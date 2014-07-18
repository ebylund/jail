class AddPcfNumberToBookee < ActiveRecord::Migration
  def change
    add_column :bookees, :pcf_number, :integer
    add_column :bookees, :city_state, :string
  end
end
