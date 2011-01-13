class CreateBlogs < ActiveRecord::Migration
  def self.up
    create_table :blogs do |t|
      t.integer :user_id
      t.boolean :frontpage
      t.text :blogtext

      t.timestamps
    end
    add_index :blogs, :user_id
end

  def self.down
    drop_table :blogs
  end
end
