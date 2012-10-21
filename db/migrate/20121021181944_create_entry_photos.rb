class CreateEntryPhotos < ActiveRecord::Migration
  def change
    create_table :entry_photos do |t|
      t.references :entry
      t.string :photo

      t.timestamps
    end
    add_index :entry_photos, :entry_id
  end
end
