class AddZipcodeToEntryLocations < ActiveRecord::Migration
  def change
    add_column :entry_locations, :zipcode, :string
  end
end
