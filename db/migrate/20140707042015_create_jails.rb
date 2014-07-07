class CreateJails < ActiveRecord::Migration
  def change
    create_table :jails do |t|

      t.timestamps
    end
  end
end
