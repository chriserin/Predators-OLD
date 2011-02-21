class CreateTracks < ActiveRecord::Migration
  def self.up
    create_table :tracks do |t|
	  t.string :recording_file_name
	  t.string :recording_content_type
	  t.integer :recording_file_size
	  t.datetime :recording_updated_at  
      t.timestamps
    end
  end

  def self.down
    drop_table :tracks
  end
end
