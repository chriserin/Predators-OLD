class AddFrontpageColumnToTracks < ActiveRecord::Migration
 def self.up
    add_column :tracks, :frontpage, :boolean, :default => false
  end

  def self.down
    remove_column :tracks, :frontpage, :boolean
  end
end
