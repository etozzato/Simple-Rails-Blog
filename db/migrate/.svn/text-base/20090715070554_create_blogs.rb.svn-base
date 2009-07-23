class CreateBlogs < ActiveRecord::Migration
  def self.up
    create_table :blogs do |t|
      t.string :name, :identity_url, :seo_id
      t.integer :posts_count
      t.timestamps
    end
    add_index :blogs, :name
    add_index :blogs, :identity_url
  end

  def self.down
    drop_table :blogs
  end
end
