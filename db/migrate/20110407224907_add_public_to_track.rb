class AddPublicToTrack < ActiveRecord::Migration
  def self.up
    add_column :tracks, :public, :boolean
  end

  def self.down
    remove_column :tracks, :public
  end
end
