class AddViewsToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :views, :integer
    add_column :blogs, :views, :integer
  end

  def self.down
    remove_column :posts, :views
    remove_column :blogs, :views
  end
end
