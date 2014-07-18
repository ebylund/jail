class CreateConvictOffenses < ActiveRecord::Migration
  def change
    create_table :convict_offenses do |t|
      t.belongs_to :bookees, index: true
      t.belongs_to :crimes, index: true
      t.string :court
      t.string :required_bond
      t.string :paid

      t.timestamps
    end
  end
end
