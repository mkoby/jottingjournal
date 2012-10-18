class AddFavoriteToEntryTable < ActiveRecord::Migration
  def change
    add_column :entries, :is_favorite, :boolean, :default => false
    add_index :entries, :is_favorite
  end
end
