class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.references :blog
      t.string :title
      t.text :body
      t.boolean :is_public, :default => false 
      t.datetime :published_at
      t.timestamps
    end
    add_index :posts, :published_at
  end

  def self.down
    drop_table :posts
  end
end
