class AddOfficerAndAgencyToBookees < ActiveRecord::Migration
  def change
    add_column :bookees, :officer, :string
    add_column :bookees, :agency, :string
  end
end
