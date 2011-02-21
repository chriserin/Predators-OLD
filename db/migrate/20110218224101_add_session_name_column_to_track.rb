class AddSessionNameColumnToTrack < ActiveRecord::Migration
 def self.up
    add_column :tracks, :session_name, :string
    add_column :tracks, :name, :string	
  end

  def self.down
    remove_column :tracks, :session_name, :string
    remove_column :tracks, :name, :string
  end
end