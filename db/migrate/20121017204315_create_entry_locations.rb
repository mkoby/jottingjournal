class CreateEntryLocations < ActiveRecord::Migration
  def change
    create_table :entry_locations do |t|
      t.references :entry
      t.float :latitude
      t.float :longitude
      t.string :city
      t.string :state

      t.timestamps
    end
    add_index :entry_locations, :entry_id
  end
end
