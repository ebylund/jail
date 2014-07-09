class CreateBookees < ActiveRecord::Migration
  def change
    create_table :bookees do |t|
      t.string :name
      t.string :address
      t.string :picture
      t.integer :arrest_date
      t.integer :arrest_time
      t.string :status

      t.timestamps
    end
  end
end
