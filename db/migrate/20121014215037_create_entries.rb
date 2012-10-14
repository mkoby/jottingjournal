class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.references :user
      t.text :contents
      t.binary :entry_hash

      t.timestamps
    end
    add_index :entries, :user_id
  end
end
